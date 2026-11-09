// task_detail_interactor.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskDetail Module Interactor
// Created on October 6, 2025

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/entities/task.dart';
import 'task_detail_protocols.dart';

/// TaskDetail Interactor Implementation
/// Handles business logic and data operations for TaskDetail module
class TaskDetailInteractor implements TaskDetailInteractorProtocol {
  TaskDetailInteractorOutputProtocol? presenter;
  static const String _tasksKey = 'tasks';

  // Setter for presenter
  void setPresenter(presenter) {
    this.presenter = presenter as TaskDetailInteractorOutputProtocol?;
  }

  @override
  Future<void> validateTask(Task task) async {
    print('TaskDetailInteractor: Starting task validation');

    Map<String, String> errors = {};

    // Validate title
    if (task.title.trim().isEmpty) {
      errors['title'] = 'Title is required';
    } else if (task.title.trim().length < 3) {
      errors['title'] = 'Title must be at least 3 characters';
    } else if (task.title.trim().length > 100) {
      errors['title'] = 'Title must be less than 100 characters';
    }

    // Validate description
    if (task.description.trim().length > 500) {
      errors['description'] = 'Description must be less than 500 characters';
    }

    // Validate due date
    if (task.dueDate != null &&
        task.dueDate!
            .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      errors['dueDate'] = 'Due date cannot be in the past';
    }

    // Validate tags
    if (task.tags.length > 10) {
      errors['tags'] = 'Maximum 10 tags allowed';
    }

    for (String tag in task.tags) {
      if (tag.trim().isEmpty) {
        errors['tags'] = 'Empty tags are not allowed';
        break;
      }
      if (tag.trim().length > 20) {
        errors['tags'] = 'Tags must be less than 20 characters';
        break;
      }
    }

    print(
        'TaskDetailInteractor: Validation completed with ${errors.length} errors');

    if (errors.isEmpty) {
      presenter?.taskValidationSucceeded();
    } else {
      presenter?.taskValidationFailed(errors);
    }
  }

  @override
  Future<void> saveTask(Task task) async {
    print('TaskDetailInteractor: Starting task save');

    try {
      final prefs = await SharedPreferences.getInstance();

      // Get existing tasks
      final tasksJson = prefs.getString(_tasksKey);
      List<Task> allTasks = [];

      if (tasksJson != null && tasksJson.isNotEmpty) {
        final List<dynamic> tasksList = jsonDecode(tasksJson);
        allTasks = tasksList.map((json) => Task.fromJson(json)).toList();
      }

      // Create new task with unique ID
      final newTask = task.copyWith(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        createdDate: DateTime.now(),
        lastModifiedDate: DateTime.now(),
      );

      // Add to list
      allTasks.add(newTask);

      // Save back to storage
      final updatedTasksJson =
          jsonEncode(allTasks.map((task) => task.toJson()).toList());
      await prefs.setString(_tasksKey, updatedTasksJson);

      print(
          'TaskDetailInteractor: Task saved successfully with ID ${newTask.id}');
      presenter?.taskSaveSucceeded(newTask);
    } catch (error) {
      print('TaskDetailInteractor: Error saving task: $error');
      presenter?.taskSaveFailed(error.toString());
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    print('TaskDetailInteractor: Starting task update for ID ${task.id}');

    try {
      final prefs = await SharedPreferences.getInstance();

      // Get existing tasks
      final tasksJson = prefs.getString(_tasksKey);
      if (tasksJson == null || tasksJson.isEmpty) {
        presenter?.taskUpdateFailed('No tasks found');
        return;
      }

      final List<dynamic> tasksList = jsonDecode(tasksJson);
      List<Task> allTasks =
          tasksList.map((json) => Task.fromJson(json)).toList();

      // Find and update the task
      final taskIndex = allTasks.indexWhere((t) => t.id == task.id);
      if (taskIndex == -1) {
        presenter?.taskUpdateFailed('Task not found');
        return;
      }

      // Update the task with new modification date
      final updatedTask = task.copyWith(
        lastModifiedDate: DateTime.now(),
      );

      allTasks[taskIndex] = updatedTask;

      // Save back to storage
      final updatedTasksJson =
          jsonEncode(allTasks.map((task) => task.toJson()).toList());
      await prefs.setString(_tasksKey, updatedTasksJson);

      print('TaskDetailInteractor: Task updated successfully');
      presenter?.taskUpdateSucceeded(updatedTask);
    } catch (error) {
      print('TaskDetailInteractor: Error updating task: $error');
      presenter?.taskUpdateFailed(error.toString());
    }
  }

  @override
  Future<void> loadTaskDetails(String taskId) async {
    print('TaskDetailInteractor: Loading task details for ID $taskId');

    try {
      final prefs = await SharedPreferences.getInstance();

      // Get existing tasks
      final tasksJson = prefs.getString(_tasksKey);
      if (tasksJson == null || tasksJson.isEmpty) {
        presenter?.taskDetailsLoadFailed('No tasks found');
        return;
      }

      final List<dynamic> tasksList = jsonDecode(tasksJson);
      List<Task> allTasks =
          tasksList.map((json) => Task.fromJson(json)).toList();

      // Find the task
      final task = allTasks.firstWhere(
        (t) => t.id == taskId,
        orElse: () => throw Exception('Task not found'),
      );

      print('TaskDetailInteractor: Task details loaded successfully');
      presenter?.taskDetailsLoaded(task);
    } catch (error) {
      print('TaskDetailInteractor: Error loading task details: $error');
      presenter?.taskDetailsLoadFailed(error.toString());
    }
  }
}
