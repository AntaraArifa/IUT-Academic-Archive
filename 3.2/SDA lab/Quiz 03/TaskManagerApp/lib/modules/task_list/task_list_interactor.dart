// task_list_interactor.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskList Module Interactor
// Created on October 2, 2025

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/entities/task.dart';
import 'task_list_protocols.dart';

/// TaskList Interactor Implementation
/// Handles all business logic and data operations for TaskList module
class TaskListInteractor implements TaskListInteractorProtocol {
  TaskListInteractorOutputProtocol? presenter;

  /// Generate unique ID for tasks
  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  // Data storage key
  static const String _tasksKey = 'user_tasks';

  // In-memory cache
  List<Task> _allTasks = [];
  List<Task> _filteredTasks = [];
  TaskFilter _currentFilter = const TaskFilter();
  TaskSortOrder _currentSortOrder = TaskSortOrder.dateCreated;

  void setPresenter(presenter) {
    this.presenter = presenter as TaskListInteractorOutputProtocol?;
  }

  @override
  Future<void> fetchTasks() async {
    print('TaskListInteractor: Starting fetchTasks');
    try {
      final prefs = await SharedPreferences.getInstance();
      print('TaskListInteractor: Got SharedPreferences');

      final tasksJson = prefs.getString(_tasksKey);
      print('TaskListInteractor: Retrieved tasksJson: $tasksJson');

      if (tasksJson != null && tasksJson.isNotEmpty) {
        final List<dynamic> tasksList = jsonDecode(tasksJson);
        _allTasks = tasksList.map((json) => Task.fromJson(json)).toList();
        print(
            'TaskListInteractor: Loaded ${_allTasks.length} tasks from storage');
      } else {
        // Initialize with sample tasks if no data exists
        print('TaskListInteractor: No existing tasks, creating sample data');
        _allTasks = _createSampleTasks();
        await _saveTasks();
        print('TaskListInteractor: Created ${_allTasks.length} sample tasks');
      }

      // Apply current filter and sort
      _applyFilterAndSort();
      print(
          'TaskListInteractor: Applied filter/sort, filtered tasks: ${_filteredTasks.length}');

      print('TaskListInteractor: About to call tasksFetchedSuccessfully');
      presenter?.tasksFetchedSuccessfully(_filteredTasks);
      print('TaskListInteractor: Called tasksFetchedSuccessfully');
    } catch (error) {
      print('TaskListInteractor: Error occurred: $error');
      presenter?.tasksFetchingFailed('Error loading tasks: $error');
    }
  }

  @override
  Future<void> addTask(Task task) async {
    try {
      final taskWithId = task.copyWith(id: _generateId());
      _allTasks.add(taskWithId);
      await _saveTasks();

      // Apply current filter and sort
      _applyFilterAndSort();

      presenter?.taskAddedSuccessfully(task);
      presenter?.tasksFetchedSuccessfully(_filteredTasks);
    } catch (error) {
      presenter?.taskAdditionFailed('Error adding task: $error');
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      final index = _allTasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _allTasks[index] = task;
        await _saveTasks();

        // Apply current filter and sort
        _applyFilterAndSort();

        presenter?.taskUpdatedSuccessfully(task);
        presenter?.tasksFetchedSuccessfully(_filteredTasks);
      } else {
        presenter?.taskUpdateFailed('Task not found');
      }
    } catch (error) {
      presenter?.taskUpdateFailed('Error updating task: $error');
    }
  }

  @override
  Future<void> deleteTask(String taskId) async {
    try {
      final index = _allTasks.indexWhere((t) => t.id == taskId);
      if (index != -1) {
        _allTasks.removeAt(index);
        await _saveTasks();

        // Apply current filter and sort
        _applyFilterAndSort();

        presenter?.taskDeletedSuccessfully(taskId);
        presenter?.tasksFetchedSuccessfully(_filteredTasks);
      } else {
        presenter?.taskDeletionFailed('Task not found');
      }
    } catch (error) {
      presenter?.taskDeletionFailed('Error deleting task: $error');
    }
  }

  @override
  Future<void> searchTasks(String query) async {
    try {
      _currentFilter = TaskFilter(
        status: _currentFilter.status,
        priority: _currentFilter.priority,
        dateFrom: _currentFilter.dateFrom,
        dateTo: _currentFilter.dateTo,
        searchQuery: query,
      );

      _applyFilterAndSort();
      presenter?.searchResultsReady(_filteredTasks);
    } catch (error) {
      presenter?.tasksFetchingFailed('Error searching tasks: $error');
    }
  }

  @override
  Future<void> filterTasks({
    TaskStatus? status,
    TaskPriority? priority,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) async {
    try {
      _currentFilter = TaskFilter(
        status: status,
        priority: priority,
        dateFrom: dateFrom,
        dateTo: dateTo,
        searchQuery: _currentFilter.searchQuery,
      );

      _applyFilterAndSort();
      presenter?.filterResultsReady(_filteredTasks);
    } catch (error) {
      presenter?.tasksFetchingFailed('Error filtering tasks: $error');
    }
  }

  @override
  Future<void> sortTasks(TaskSortOrder order) async {
    try {
      _currentSortOrder = order;
      _applyFilterAndSort();
      presenter?.sortResultsReady(_filteredTasks);
    } catch (error) {
      presenter?.tasksFetchingFailed('Error sorting tasks: $error');
    }
  }

  @override
  Future<Map<String, int>> getTaskStatistics() async {
    try {
      final stats = <String, int>{
        'total': _allTasks.length,
        'completed':
            _allTasks.where((t) => t.status == TaskStatus.completed).length,
        'pending':
            _allTasks.where((t) => t.status == TaskStatus.pending).length,
        'inProgress':
            _allTasks.where((t) => t.status == TaskStatus.inProgress).length,
        'high': _allTasks.where((t) => t.priority == TaskPriority.high).length,
        'medium':
            _allTasks.where((t) => t.priority == TaskPriority.medium).length,
        'low': _allTasks.where((t) => t.priority == TaskPriority.low).length,
        'overdue': _allTasks
            .where((t) =>
                t.dueDate != null &&
                t.dueDate!.isBefore(DateTime.now()) &&
                t.status != TaskStatus.completed)
            .length,
      };

      presenter?.statisticsReady(stats);
      return stats;
    } catch (error) {
      presenter?.tasksFetchingFailed('Error calculating statistics: $error');
      return {};
    }
  }

  // MARK: - Private Methods

  /// Save tasks to persistent storage
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson =
        jsonEncode(_allTasks.map((task) => task.toJson()).toList());
    await prefs.setString(_tasksKey, tasksJson);
  }

  /// Apply current filter and sort to tasks
  void _applyFilterAndSort() {
    // First apply filter
    _filteredTasks = _currentFilter.apply(_allTasks);

    // Then apply sort
    _filteredTasks = _applySortOrder(_filteredTasks, _currentSortOrder);
  }

  /// Apply sort order to task list
  List<Task> _applySortOrder(List<Task> tasks, TaskSortOrder order) {
    final sortedTasks = List<Task>.from(tasks);

    switch (order) {
      case TaskSortOrder.dateCreated:
        sortedTasks.sort((a, b) => b.createdDate.compareTo(a.createdDate));
        break;
      case TaskSortOrder.dateModified:
        sortedTasks
            .sort((a, b) => b.lastModifiedDate.compareTo(a.lastModifiedDate));
        break;
      case TaskSortOrder.dueDate:
        sortedTasks.sort((a, b) {
          if (a.dueDate == null && b.dueDate == null) return 0;
          if (a.dueDate == null) return 1;
          if (b.dueDate == null) return -1;
          return a.dueDate!.compareTo(b.dueDate!);
        });
        break;
      case TaskSortOrder.priority:
        sortedTasks
            .sort((a, b) => a.priority.index.compareTo(b.priority.index));
        break;
      case TaskSortOrder.title:
        sortedTasks.sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case TaskSortOrder.status:
        sortedTasks.sort((a, b) => a.status.index.compareTo(b.status.index));
        break;
    }

    return sortedTasks;
  }

  /// Create sample tasks for demonstration
  List<Task> _createSampleTasks() {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Complete VIPER Architecture Demo',
        description:
            'Implement the task management app using VIPER architecture pattern with proper separation of concerns.',
        priority: TaskPriority.high,
        status: TaskStatus.inProgress,
        dueDate: now.add(const Duration(days: 2)),
        createdDate: now.subtract(const Duration(days: 1)),
        lastModifiedDate: now,
        tags: ['development', 'architecture', 'flutter'],
        estimatedHours: 8,
        actualHours: 5,
      ),
      Task(
        id: '2',
        title: 'Review Code Documentation',
        description:
            'Review and update the code documentation to ensure all components are properly documented.',
        priority: TaskPriority.medium,
        status: TaskStatus.pending,
        dueDate: now.add(const Duration(days: 5)),
        createdDate: now.subtract(const Duration(days: 2)),
        lastModifiedDate: now.subtract(const Duration(hours: 6)),
        tags: ['documentation', 'review'],
        estimatedHours: 3,
      ),
      Task(
        id: '3',
        title: 'Setup Development Environment',
        description:
            'Install and configure Flutter development environment with necessary tools and dependencies.',
        priority: TaskPriority.high,
        status: TaskStatus.completed,
        dueDate: now.subtract(const Duration(days: 1)),
        createdDate: now.subtract(const Duration(days: 3)),
        lastModifiedDate: now.subtract(const Duration(days: 1)),
        tags: ['setup', 'environment'],
        estimatedHours: 2,
        actualHours: 2,
      ),
      Task(
        id: '4',
        title: 'Write Unit Tests',
        description:
            'Create comprehensive unit tests for all VIPER components to ensure code quality and reliability.',
        priority: TaskPriority.medium,
        status: TaskStatus.pending,
        dueDate: now.add(const Duration(days: 7)),
        createdDate: now.subtract(const Duration(hours: 12)),
        lastModifiedDate: now.subtract(const Duration(hours: 12)),
        tags: ['testing', 'quality'],
        estimatedHours: 6,
      ),
      Task(
        id: '5',
        title: 'Optimize App Performance',
        description:
            'Analyze and optimize app performance, focusing on memory usage and rendering speed.',
        priority: TaskPriority.low,
        status: TaskStatus.pending,
        dueDate: now.add(const Duration(days: 10)),
        createdDate: now.subtract(const Duration(hours: 8)),
        lastModifiedDate: now.subtract(const Duration(hours: 8)),
        tags: ['performance', 'optimization'],
        estimatedHours: 4,
      ),
    ];
  }
}
