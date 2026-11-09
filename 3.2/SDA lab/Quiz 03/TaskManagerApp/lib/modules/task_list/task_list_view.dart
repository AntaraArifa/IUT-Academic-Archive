// task_list_view.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskList Module View
// Created on October 2, 2025

import 'package:flutter/material.dart';
import '../../common/entities/task.dart';
import 'task_list_protocols.dart';
import 'task_list_presenter.dart';
import 'task_list_interactor.dart';
import 'task_list_router.dart';

/// TaskList View Implementation
/// Main UI component for displaying and managing task list
class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView>
    implements TaskListViewProtocol {
  late TaskListPresenter _presenter;
  late TaskListInteractor _interactor;
  late TaskListRouter _router;

  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  bool _showSearch = false;

  @override
  void initState() {
    super.initState();
    _setupVIPER();
    _presenter.viewDidLoad();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _presenter.viewDidDisappear();
    super.dispose();
  }

  void _setupVIPER() {
    _presenter = TaskListPresenter();
    _interactor = TaskListInteractor();
    _router = TaskListRouter();

    // Set up the VIPER connections properly
    _presenter.setView(this);
    _presenter.setInteractor(_interactor);
    _presenter.setRouter(_router);

    // Connect interactor to presenter for callbacks
    _interactor.setPresenter(_presenter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      title: _showSearch ? _buildSearchField() : const Text('Tasks'),
      actions: [
        if (!_showSearch) ...[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _showSearch = true;
              });
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) => _handleMenuSelection(value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'filter',
                child: Row(
                  children: [
                    Icon(Icons.filter_list),
                    SizedBox(width: 8),
                    Text('Filter'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'sort',
                child: Row(
                  children: [
                    Icon(Icons.sort),
                    SizedBox(width: 8),
                    Text('Sort'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'refresh',
                child: Row(
                  children: [
                    Icon(Icons.refresh),
                    SizedBox(width: 8),
                    Text('Refresh'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          ),
        ] else ...[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                _showSearch = false;
                _searchController.clear();
                _presenter.searchTasks('');
              });
            },
          ),
        ],
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: 'Search tasks...',
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      onChanged: (query) {
        _presenter.searchTasks(query);
      },
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        _presenter.refreshTasks();
      },
      child: _buildTaskList(),
    );
  }

  Widget _buildTaskList() {
    final taskCount = _presenter.getTaskCount();

    if (taskCount == 0) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80), // Space for FAB
      itemCount: taskCount,
      itemBuilder: (context, index) {
        final task = _presenter.getTaskAt(index);
        return _buildTaskCard(task, index);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.task_alt,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No tasks yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the + button to add your first task',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(Task task, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 2,
      child: InkWell(
        onTap: () => _presenter.didSelectTask(context, index),
        onLongPress: () => _presenter.showTaskActions(context, task),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: task.status == TaskStatus.completed
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                    ),
                  ),
                  _buildPriorityChip(task.priority),
                ],
              ),
              if (task.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  task.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                        decoration: task.status == TaskStatus.completed
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildStatusChip(task.status),
                  const SizedBox(width: 8),
                  if (task.dueDate != null) ...[
                    _buildDueDateChip(task.dueDate!),
                    const SizedBox(width: 8),
                  ],
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_vert, size: 20),
                    onPressed: () => _presenter.showTaskActions(context, task),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              if (task.tags.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: task.tags
                      .take(3)
                      .map((tag) => _buildTagChip(tag))
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriorityChip(TaskPriority priority) {
    Color color;
    String label;

    switch (priority) {
      case TaskPriority.high:
        color = Colors.red;
        label = 'High';
        break;
      case TaskPriority.medium:
        color = Colors.orange;
        label = 'Medium';
        break;
      case TaskPriority.low:
        color = Colors.green;
        label = 'Low';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStatusChip(TaskStatus status) {
    Color color;
    String label;
    IconData icon;

    switch (status) {
      case TaskStatus.pending:
        color = Colors.orange;
        label = 'Pending';
        icon = Icons.schedule;
        break;
      case TaskStatus.inProgress:
        color = Colors.blue;
        label = 'In Progress';
        icon = Icons.work;
        break;
      case TaskStatus.completed:
        color = Colors.green;
        label = 'Completed';
        icon = Icons.check_circle;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDueDateChip(DateTime dueDate) {
    final now = DateTime.now();
    final isOverdue = dueDate.isBefore(now);
    final isToday = dueDate.year == now.year &&
        dueDate.month == now.month &&
        dueDate.day == now.day;

    Color color;
    if (isOverdue) {
      color = Colors.red;
    } else if (isToday) {
      color = Colors.orange;
    } else {
      color = Colors.grey;
    }

    String label;
    if (isToday) {
      label = 'Today';
    } else if (isOverdue) {
      final days = now.difference(dueDate).inDays;
      label = '$days day${days > 1 ? 's' : ''} overdue';
    } else {
      final days = dueDate.difference(now).inDays;
      if (days == 1) {
        label = 'Tomorrow';
      } else {
        label = '$days days left';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.event, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagChip(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _presenter.addNewTaskTapped(context),
      child: const Icon(Icons.add),
    );
  }

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'filter':
        _presenter.filterButtonTapped(context);
        break;
      case 'sort':
        _presenter.sortButtonTapped(context);
        break;
      case 'refresh':
        _presenter.refreshTasks();
        break;
      case 'settings':
        _presenter.settingsButtonTapped(context);
        break;
    }
  }

  // MARK: - TaskListViewProtocol Implementation

  @override
  void displayTasks(List<Task> tasks) {
    setState(() {
      // Tasks are managed by presenter
    });
  }

  @override
  void showEmptyState() {
    setState(() {
      // Empty state is handled in build method
    });
  }

  @override
  void refreshTaskList() {
    setState(() {
      // Refresh handled by presenter
    });
  }

  @override
  void showAddTaskDialog() {
    _presenter.addNewTaskTapped(context);
  }

  @override
  void updateTask(Task task) {
    setState(() {
      // Task update handled by presenter
    });
  }

  @override
  void removeTask(String taskId) {
    setState(() {
      // Task removal handled by presenter
    });
  }

  @override
  void showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Retry',
            textColor: Colors.white,
            onPressed: () => _presenter.refreshTasks(),
          ),
        ),
      );
    }
  }

  @override
  void showSuccess(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
