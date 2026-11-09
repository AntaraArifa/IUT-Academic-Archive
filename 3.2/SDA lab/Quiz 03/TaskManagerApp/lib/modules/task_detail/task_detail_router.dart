// task_detail_router.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskDetail Module Router
// Created on October 6, 2025

import 'package:flutter/material.dart';
import '../../common/entities/task.dart';
import 'task_detail_protocols.dart';

/// TaskDetail Router Implementation
/// Handles navigation and routing for TaskDetail module
class TaskDetailRouter implements TaskDetailRouterProtocol {
  @override
  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void navigateBackWithResult(BuildContext context, Task? task) {
    Navigator.of(context).pop(task);
  }

  @override
  void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void showConfirmation(BuildContext context, String title, String message,
      VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  void showDeleteConfirmation(BuildContext context, VoidCallback onConfirm) {
    showConfirmation(
      context,
      'Delete Task',
      'Are you sure you want to delete this task? This action cannot be undone.',
      onConfirm,
    );
  }
}
