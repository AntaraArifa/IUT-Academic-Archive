// task_list_protocols.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskList Module Protocols
// Created on October 2, 2025

import 'package:flutter/material.dart';
import '../../common/protocols/viper_protocols.dart';
import '../../common/entities/task.dart';

// MARK: - TaskList VIPER Protocols
/// Specific protocols for TaskList module following VIPER architecture

// MARK: - View Protocol
abstract class TaskListViewProtocol extends BaseViewProtocol {
  /// Display list of tasks in the UI
  void displayTasks(List<Task> tasks);

  /// Show empty state when no tasks available
  void showEmptyState();

  /// Refresh the task list
  void refreshTaskList();

  /// Show add task dialog or navigate to add task screen
  void showAddTaskDialog();

  /// Update single task in the list
  void updateTask(Task task);

  /// Remove task from the list
  void removeTask(String taskId);
}

// MARK: - Presenter Protocol
abstract class TaskListPresenterProtocol extends BasePresenterProtocol {
  /// Get number of tasks for list display
  int getTaskCount();

  /// Get task at specific index
  Task getTaskAt(int index);

  /// Handle task selection
  void didSelectTask(BuildContext context, int index);

  /// Handle add new task button tap
  void addNewTaskTapped(BuildContext context);

  /// Handle settings button tap
  void settingsButtonTapped(BuildContext context);

  /// Handle refresh action
  void refreshTasks();

  /// Handle task deletion
  void deleteTask(String taskId);

  /// Handle task update
  void updateTask(Task task);

  /// Search tasks with query
  void searchTasks(String query);

  /// Filter tasks by status
  void filterTasksByStatus(TaskStatus? status);

  /// Sort tasks by order
  void sortTasks(TaskSortOrder order);
}

// MARK: - Interactor Protocol
abstract class TaskListInteractorProtocol extends BaseInteractorProtocol {
  /// Fetch all tasks from data source
  Future<void> fetchTasks();

  /// Add new task
  Future<void> addTask(Task task);

  /// Update existing task
  Future<void> updateTask(Task task);

  /// Delete task by ID
  Future<void> deleteTask(String taskId);

  /// Search tasks with query
  Future<void> searchTasks(String query);

  /// Filter tasks by criteria
  Future<void> filterTasks({
    TaskStatus? status,
    TaskPriority? priority,
    DateTime? dateFrom,
    DateTime? dateTo,
  });

  /// Sort tasks by order
  Future<void> sortTasks(TaskSortOrder order);

  /// Get task statistics
  Future<Map<String, int>> getTaskStatistics();
}

// MARK: - Router Protocol
abstract class TaskListRouterProtocol extends BaseRouterProtocol {
  /// Navigate to task detail screen
  void navigateToTaskDetail(BuildContext context, Task task);

  /// Navigate to settings screen
  void navigateToSettings(BuildContext context);

  /// Navigate to add task screen
  void navigateToAddTask(BuildContext context);

  /// Show add task bottom sheet
  void showAddTaskBottomSheet(BuildContext context);

  /// Show task actions bottom sheet
  void showTaskActionsBottomSheet(
    BuildContext context,
    Task task,
    Function(TaskAction) onAction,
  );

  /// Show filter options
  Future<dynamic> showFilterOptions(BuildContext context);

  /// Show sort options
  Future<dynamic> showSortOptions(BuildContext context);
}

// MARK: - Interactor Output Protocol
/// Protocol for Interactor to communicate back to Presenter
abstract class TaskListInteractorOutputProtocol {
  /// Called when tasks are successfully fetched
  void tasksFetchedSuccessfully(List<Task> tasks);

  /// Called when task fetching fails
  void tasksFetchingFailed(String error);

  /// Called when task is successfully added
  void taskAddedSuccessfully(Task task);

  /// Called when task addition fails
  void taskAdditionFailed(String error);

  /// Called when task is successfully updated
  void taskUpdatedSuccessfully(Task task);

  /// Called when task update fails
  void taskUpdateFailed(String error);

  /// Called when task is successfully deleted
  void taskDeletedSuccessfully(String taskId);

  /// Called when task deletion fails
  void taskDeletionFailed(String error);

  /// Called when search results are available
  void searchResultsReady(List<Task> tasks);

  /// Called when filter results are available
  void filterResultsReady(List<Task> tasks);

  /// Called when sort results are available
  void sortResultsReady(List<Task> tasks);

  /// Called when statistics are available
  void statisticsReady(Map<String, int> statistics);
}

// MARK: - Supporting Enums and Classes

/// Task Action Enum for context menu
enum TaskAction {
  edit,
  delete,
  duplicate,
  markComplete,
  markPending,
  changePriority,
  setDueDate,
}

/// Task Filter Configuration
class TaskFilter {
  final TaskStatus? status;
  final TaskPriority? priority;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final String? searchQuery;

  const TaskFilter({
    this.status,
    this.priority,
    this.dateFrom,
    this.dateTo,
    this.searchQuery,
  });

  /// Check if filter is empty
  bool get isEmpty =>
      status == null &&
      priority == null &&
      dateFrom == null &&
      dateTo == null &&
      (searchQuery == null || searchQuery!.isEmpty);

  /// Apply filter to task list
  List<Task> apply(List<Task> tasks) {
    var filteredTasks = tasks;

    // Filter by status
    if (status != null) {
      filteredTasks =
          filteredTasks.where((task) => task.status == status).toList();
    }

    // Filter by priority
    if (priority != null) {
      filteredTasks =
          filteredTasks.where((task) => task.priority == priority).toList();
    }

    // Filter by date range
    if (dateFrom != null) {
      filteredTasks = filteredTasks
          .where((task) =>
              task.createdDate.isAfter(dateFrom!) ||
              task.createdDate.isAtSameMomentAs(dateFrom!))
          .toList();
    }

    if (dateTo != null) {
      filteredTasks = filteredTasks
          .where((task) =>
              task.createdDate.isBefore(dateTo!) ||
              task.createdDate.isAtSameMomentAs(dateTo!))
          .toList();
    }

    // Filter by search query
    if (searchQuery != null && searchQuery!.isNotEmpty) {
      final query = searchQuery!.toLowerCase();
      filteredTasks = filteredTasks
          .where((task) =>
              task.title.toLowerCase().contains(query) ||
              task.description.toLowerCase().contains(query))
          .toList();
    }

    return filteredTasks;
  }
}
