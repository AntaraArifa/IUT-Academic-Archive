// task_list_router.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskList Module Router
// Created on October 2, 2025

import 'package:flutter/material.dart';
import '../../common/entities/task.dart';
import '../task_detail/task_detail_view.dart';
import '../settings/settings_view.dart';
import 'task_list_protocols.dart';

/// TaskList Router Implementation
/// Handles navigation and routing for TaskList module
class TaskListRouter implements TaskListRouterProtocol {
  // Callbacks for handling task results
  Function(Task)? _onTaskAdded;
  Function(Task)? _onTaskUpdated;

  // Setter methods for callbacks
  void setTaskAddedCallback(Function(Task) callback) {
    _onTaskAdded = callback;
  }

  void setTaskUpdatedCallback(Function(Task) callback) {
    _onTaskUpdated = callback;
  }

  // Implement required BaseRouterProtocol methods
  @override
  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
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
  Future<void> navigateToTaskDetail(BuildContext context, Task task) async {
    final result = await Navigator.of(context).push<Task>(
      MaterialPageRoute(
        builder: (context) => TaskDetailView(task: task),
      ),
    );

    if (result != null) {
      // Task was updated, notify presenter
      _onTaskUpdated?.call(result);
    }
  }

  @override
  void navigateToSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsView(),
      ),
    );
  }

  @override
  Future<void> navigateToAddTask(BuildContext context) async {
    final result = await Navigator.of(context).push<Task>(
      MaterialPageRoute(
        builder: (context) => const TaskDetailView(), // No task means add new
      ),
    );

    if (result != null) {
      // New task was created, notify presenter
      _onTaskAdded?.call(result);
    }
  }

  @override
  void showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: const TaskDetailView(), // Add task in bottom sheet
      ),
    );
  }

  @override
  void showTaskActionsBottomSheet(
    BuildContext context,
    Task task,
    Function(TaskAction) onAction,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Task Actions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            // Action items
            _buildActionTile(
              context: context,
              icon: Icons.edit,
              title: 'Edit Task',
              subtitle: 'Modify task details',
              onTap: () {
                Navigator.pop(context);
                onAction(TaskAction.edit);
              },
            ),

            _buildActionTile(
              context: context,
              icon: Icons.copy,
              title: 'Duplicate Task',
              subtitle: 'Create a copy of this task',
              onTap: () {
                Navigator.pop(context);
                onAction(TaskAction.duplicate);
              },
            ),

            if (task.status != TaskStatus.completed)
              _buildActionTile(
                context: context,
                icon: Icons.check_circle,
                title: 'Mark Complete',
                subtitle: 'Mark this task as completed',
                color: Colors.green,
                onTap: () {
                  Navigator.pop(context);
                  onAction(TaskAction.markComplete);
                },
              ),

            if (task.status == TaskStatus.completed)
              _buildActionTile(
                context: context,
                icon: Icons.radio_button_unchecked,
                title: 'Mark Pending',
                subtitle: 'Mark this task as pending',
                color: Colors.orange,
                onTap: () {
                  Navigator.pop(context);
                  onAction(TaskAction.markPending);
                },
              ),

            _buildActionTile(
              context: context,
              icon: Icons.priority_high,
              title: 'Change Priority',
              subtitle: 'Cycle through priority levels',
              color: _getPriorityColor(task.priority),
              onTap: () {
                Navigator.pop(context);
                onAction(TaskAction.changePriority);
              },
            ),

            _buildActionTile(
              context: context,
              icon: Icons.calendar_today,
              title: 'Set Due Date',
              subtitle: 'Change the due date',
              onTap: () {
                Navigator.pop(context);
                onAction(TaskAction.setDueDate);
              },
            ),

            _buildActionTile(
              context: context,
              icon: Icons.delete,
              title: 'Delete Task',
              subtitle: 'Remove this task permanently',
              color: Colors.red,
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(context, task, onAction);
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Future<dynamic> showFilterOptions(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Filter Tasks',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            // Filter by Status
            ExpansionTile(
              leading: const Icon(Icons.task_alt),
              title: const Text('Filter by Status'),
              children: [
                _buildFilterTile(
                  context: context,
                  title: 'All Tasks',
                  onTap: () => Navigator.pop(context, null),
                ),
                _buildFilterTile(
                  context: context,
                  title: 'Pending',
                  color: Colors.orange,
                  onTap: () => Navigator.pop(context, TaskStatus.pending),
                ),
                _buildFilterTile(
                  context: context,
                  title: 'In Progress',
                  color: Colors.blue,
                  onTap: () => Navigator.pop(context, TaskStatus.inProgress),
                ),
                _buildFilterTile(
                  context: context,
                  title: 'Completed',
                  color: Colors.green,
                  onTap: () => Navigator.pop(context, TaskStatus.completed),
                ),
              ],
            ),

            // Filter by Priority
            ExpansionTile(
              leading: const Icon(Icons.priority_high),
              title: const Text('Filter by Priority'),
              children: [
                _buildFilterTile(
                  context: context,
                  title: 'High Priority',
                  color: Colors.red,
                  onTap: () => Navigator.pop(context, TaskPriority.high),
                ),
                _buildFilterTile(
                  context: context,
                  title: 'Medium Priority',
                  color: Colors.orange,
                  onTap: () => Navigator.pop(context, TaskPriority.medium),
                ),
                _buildFilterTile(
                  context: context,
                  title: 'Low Priority',
                  color: Colors.green,
                  onTap: () => Navigator.pop(context, TaskPriority.low),
                ),
              ],
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Future<dynamic> showSortOptions(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Sort Tasks',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            // Sort options
            _buildSortTile(
              context: context,
              icon: Icons.access_time,
              title: 'Date Created',
              subtitle: 'Newest first',
              onTap: () => Navigator.pop(context, TaskSortOrder.dateCreated),
            ),

            _buildSortTile(
              context: context,
              icon: Icons.update,
              title: 'Date Modified',
              subtitle: 'Recently modified first',
              onTap: () => Navigator.pop(context, TaskSortOrder.dateModified),
            ),

            _buildSortTile(
              context: context,
              icon: Icons.event,
              title: 'Due Date',
              subtitle: 'Earliest due date first',
              onTap: () => Navigator.pop(context, TaskSortOrder.dueDate),
            ),

            _buildSortTile(
              context: context,
              icon: Icons.priority_high,
              title: 'Priority',
              subtitle: 'High priority first',
              onTap: () => Navigator.pop(context, TaskSortOrder.priority),
            ),

            _buildSortTile(
              context: context,
              icon: Icons.title,
              title: 'Title',
              subtitle: 'Alphabetical order',
              onTap: () => Navigator.pop(context, TaskSortOrder.title),
            ),

            _buildSortTile(
              context: context,
              icon: Icons.task_alt,
              title: 'Status',
              subtitle: 'Group by status',
              onTap: () => Navigator.pop(context, TaskSortOrder.status),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // MARK: - Private Helper Methods

  Widget _buildActionTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: color ?? Theme.of(context).primaryColor,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  Widget _buildFilterTile({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: color ?? Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildSortTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.high:
        return Colors.red;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.low:
        return Colors.green;
    }
  }

  void _showDeleteConfirmation(
    BuildContext context,
    Task task,
    Function(TaskAction) onAction,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: Text('Are you sure you want to delete "${task.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onAction(TaskAction.delete);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
