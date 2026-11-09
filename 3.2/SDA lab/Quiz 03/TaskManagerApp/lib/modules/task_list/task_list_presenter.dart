// task_list_presenter.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskList Module Presenter
// Created on October 2, 2025

import 'package:flutter/material.dart';
import '../../common/entities/task.dart';
import 'task_list_protocols.dart';
import 'task_list_router.dart';

/// TaskList Presenter Implementation
/// Handles presentation logic and communication between View and Interactor
class TaskListPresenter
    implements TaskListPresenterProtocol, TaskListInteractorOutputProtocol {
  TaskListViewProtocol? view;
  TaskListInteractorProtocol? interactor;
  TaskListRouterProtocol? router;

  // Presentation state
  List<Task> _tasks = [];
  bool _isLoading = false;
  String? _errorMessage;
  TaskFilter _currentFilter = const TaskFilter();
  TaskSortOrder _currentSortOrder = TaskSortOrder.dateCreated;

  void setView(view) {
    this.view = view as TaskListViewProtocol?;
  }

  void setInteractor(interactor) {
    this.interactor = interactor as TaskListInteractorProtocol?;
  }

  void setRouter(router) {
    this.router = router as TaskListRouterProtocol?;

    // Set up callbacks for task results
    if (this.router is TaskListRouter) {
      final taskListRouter = this.router as TaskListRouter;
      taskListRouter.setTaskAddedCallback(_handleTaskAdded);
      taskListRouter.setTaskUpdatedCallback(_handleTaskUpdated);
    }
  }

  // Handle task added result from TaskDetail
  void _handleTaskAdded(Task task) {
    interactor?.addTask(task);
  }

  // Handle task updated result from TaskDetail
  void _handleTaskUpdated(Task task) {
    interactor?.updateTask(task);
  }

  void viewDidLoad() {
    _isLoading = true;
    view?.showLoading();
    interactor?.fetchTasks();
  }

  void viewWillAppear() {
    // Refresh tasks when view appears
    interactor?.fetchTasks();
  }

  void viewDidAppear() {
    // Called after view appears
  }

  void viewWillDisappear() {
    // Called before view disappears
  }

  void viewDidDisappear() {
    // Clean up if needed
  }

  // MARK: - TaskListPresenterProtocol Implementation

  @override
  int getTaskCount() {
    return _tasks.length;
  }

  @override
  Task getTaskAt(int index) {
    if (index >= 0 && index < _tasks.length) {
      return _tasks[index];
    }
    throw IndexError.withLength(index, _tasks.length);
  }

  @override
  void didSelectTask(BuildContext context, int index) {
    if (index >= 0 && index < _tasks.length) {
      final task = _tasks[index];
      router?.navigateToTaskDetail(context, task);
    }
  }

  @override
  void addNewTaskTapped(BuildContext context) {
    router?.navigateToAddTask(context);
  }

  @override
  void settingsButtonTapped(BuildContext context) {
    router?.navigateToSettings(context);
  }

  @override
  void refreshTasks() {
    _isLoading = true;
    view?.showLoading();
    interactor?.fetchTasks();
  }

  @override
  void deleteTask(String taskId) {
    interactor?.deleteTask(taskId);
  }

  @override
  void updateTask(Task task) {
    interactor?.updateTask(task);
  }

  @override
  void searchTasks(String query) {
    interactor?.searchTasks(query);
  }

  @override
  void filterTasksByStatus(TaskStatus? status) {
    _currentFilter = TaskFilter(
      status: status,
      priority: _currentFilter.priority,
      dateFrom: _currentFilter.dateFrom,
      dateTo: _currentFilter.dateTo,
      searchQuery: _currentFilter.searchQuery,
    );

    interactor?.filterTasks(
      status: status,
      priority: _currentFilter.priority,
      dateFrom: _currentFilter.dateFrom,
      dateTo: _currentFilter.dateTo,
    );
  }

  void filterTasksByPriority(TaskPriority? priority) {
    _currentFilter = TaskFilter(
      status: _currentFilter.status,
      priority: priority,
      dateFrom: _currentFilter.dateFrom,
      dateTo: _currentFilter.dateTo,
      searchQuery: _currentFilter.searchQuery,
    );

    interactor?.filterTasks(
      status: _currentFilter.status,
      priority: priority,
      dateFrom: _currentFilter.dateFrom,
      dateTo: _currentFilter.dateTo,
    );
  }

  @override
  void sortTasks(TaskSortOrder order) {
    _currentSortOrder = order;
    interactor?.sortTasks(order);
  }

  void sortTasksBy(TaskSortOrder order) {
    sortTasks(order);
  }

  // MARK: - Public Methods for View

  /// Get current filter state
  TaskFilter getCurrentFilter() => _currentFilter;

  /// Get current sort order
  TaskSortOrder getCurrentSortOrder() => _currentSortOrder;

  /// Check if currently loading
  bool isLoading() => _isLoading;

  /// Get current error message
  String? getErrorMessage() => _errorMessage;

  /// Handle filter button tap
  void filterButtonTapped(BuildContext context) async {
    final result = await router?.showFilterOptions(context);
    if (result != null) {
      if (result is TaskStatus) {
        filterTasksByStatus(result);
      } else if (result is TaskPriority) {
        filterTasksByPriority(result);
      }
    } else {
      // Clear filters - show all tasks
      clearFilters();
    }
  }

  /// Handle sort button tap
  void sortButtonTapped(BuildContext context) async {
    final result = await router?.showSortOptions(context);
    if (result != null && result is TaskSortOrder) {
      sortTasksBy(result);
    }
  }

  /// Handle task action selection
  void handleTaskAction(BuildContext context, Task task, TaskAction action) {
    switch (action) {
      case TaskAction.edit:
        router?.navigateToTaskDetail(context, task);
        break;
      case TaskAction.delete:
        deleteTask(task.id);
        break;
      case TaskAction.duplicate:
        _duplicateTask(task);
        break;
      case TaskAction.markComplete:
        _updateTaskStatus(task, TaskStatus.completed);
        break;
      case TaskAction.markPending:
        _updateTaskStatus(task, TaskStatus.pending);
        break;
      case TaskAction.changePriority:
        _cyclePriority(task);
        break;
      case TaskAction.setDueDate:
        _showDatePicker(context, task);
        break;
    }
  }

  /// Show task actions bottom sheet
  void showTaskActions(BuildContext context, Task task) {
    router?.showTaskActionsBottomSheet(
      context,
      task,
      (action) => handleTaskAction(context, task, action),
    );
  }

  /// Apply advanced filter
  void applyAdvancedFilter({
    TaskStatus? status,
    TaskPriority? priority,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? searchQuery,
  }) {
    _currentFilter = TaskFilter(
      status: status,
      priority: priority,
      dateFrom: dateFrom,
      dateTo: dateTo,
      searchQuery: searchQuery,
    );

    interactor?.filterTasks(
      status: status,
      priority: priority,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );

    if (searchQuery != null) {
      interactor?.searchTasks(searchQuery);
    }
  }

  /// Clear all filters
  void clearFilters() {
    _currentFilter = const TaskFilter();
    interactor?.fetchTasks();
  }

  /// Get task statistics
  void getStatistics() {
    interactor?.getTaskStatistics();
  }

  // MARK: - TaskListInteractorOutputProtocol Implementation

  @override
  void tasksFetchedSuccessfully(List<Task> tasks) {
    _isLoading = false;
    _errorMessage = null;
    _tasks = tasks;

    view?.hideLoading();

    if (tasks.isEmpty) {
      view?.showEmptyState();
    } else {
      view?.displayTasks(tasks);
    }
  }

  @override
  void tasksFetchingFailed(String error) {
    _isLoading = false;
    _errorMessage = error;
    view?.hideLoading();
    view?.showError(error);
  }

  @override
  void taskAddedSuccessfully(Task task) {
    view?.hideLoading();
    view?.showSuccess('Task added successfully');
    // Refresh the task list to show the new task
    interactor?.fetchTasks();
  }

  @override
  void taskAdditionFailed(String error) {
    view?.hideLoading();
    view?.showError('Failed to add task: $error');
  }

  @override
  void taskUpdatedSuccessfully(Task task) {
    view?.showSuccess('Task updated successfully');
    // Refresh the entire task list to show the updated task
    interactor?.fetchTasks();
  }

  @override
  void taskUpdateFailed(String error) {
    view?.showError('Failed to update task: $error');
  }

  @override
  void taskDeletedSuccessfully(String taskId) {
    view?.removeTask(taskId);
    view?.showSuccess('Task deleted successfully');
  }

  @override
  void taskDeletionFailed(String error) {
    view?.showError('Failed to delete task: $error');
  }

  @override
  void searchResultsReady(List<Task> tasks) {
    _tasks = tasks;
    if (tasks.isEmpty && _currentFilter.searchQuery?.isNotEmpty == true) {
      view?.showError(
          'No tasks found matching "${_currentFilter.searchQuery}"');
    } else {
      view?.displayTasks(tasks);
    }
  }

  @override
  void filterResultsReady(List<Task> tasks) {
    _tasks = tasks;
    view?.displayTasks(tasks);
  }

  @override
  void sortResultsReady(List<Task> tasks) {
    _tasks = tasks;
    view?.displayTasks(tasks);
  }

  @override
  void statisticsReady(Map<String, int> statistics) {
    // Can be used to show statistics in UI if needed
    debugPrint('Task Statistics: $statistics');
  }

  // MARK: - Private Helper Methods

  /// Duplicate a task
  void _duplicateTask(Task task) {
    final duplicatedTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: '${task.title} (Copy)',
      description: task.description,
      priority: task.priority,
      status: TaskStatus.pending,
      dueDate: task.dueDate,
      createdDate: DateTime.now(),
      lastModifiedDate: DateTime.now(),
      tags: List.from(task.tags),
      estimatedHours: task.estimatedHours,
    );

    interactor?.addTask(duplicatedTask);
  }

  /// Update task status
  void _updateTaskStatus(Task task, TaskStatus newStatus) {
    final updatedTask = task.copyWith(
      status: newStatus,
      lastModifiedDate: DateTime.now(),
    );

    interactor?.updateTask(updatedTask);
  }

  /// Cycle through priority levels
  void _cyclePriority(Task task) {
    TaskPriority newPriority;
    switch (task.priority) {
      case TaskPriority.low:
        newPriority = TaskPriority.medium;
        break;
      case TaskPriority.medium:
        newPriority = TaskPriority.high;
        break;
      case TaskPriority.high:
        newPriority = TaskPriority.low;
        break;
    }

    final updatedTask = task.copyWith(
      priority: newPriority,
      lastModifiedDate: DateTime.now(),
    );

    interactor?.updateTask(updatedTask);
  }

  /// Show date picker for due date
  void _showDatePicker(BuildContext context, Task task) {
    showDatePicker(
      context: context,
      initialDate: task.dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((selectedDate) {
      if (selectedDate != null) {
        final updatedTask = task.copyWith(
          dueDate: selectedDate,
          lastModifiedDate: DateTime.now(),
        );

        interactor?.updateTask(updatedTask);
      }
    });
  }
}
