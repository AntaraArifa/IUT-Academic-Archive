// VIPER Architecture - Dashboard Module Router

import 'package:flutter/material.dart';
import 'dashboard_protocols.dart';
import '../task_list/task_list_view.dart';
import '../task_detail/task_detail_view.dart';
import '../settings/settings_view.dart';

/// Dashboard Module Router - Handles navigation between modules
class DashboardRouter implements DashboardPresenterToRouterProtocol {
  final Function(int)? onNavigate;

  DashboardRouter(this.onNavigate);

  static DashboardRouter createModule([Function(int)? onNavigate]) {
    print('🏗️ DashboardRouter: Creating dashboard module');
    return DashboardRouter(onNavigate);
  }

  @override
  void navigateToTaskList() {
    print('🧭 DashboardRouter: Navigating to task list (index 1)');
    onNavigate?.call(1); // TaskList is at index 1
  }

  @override
  void navigateToTaskDetail() {
    print('🧭 DashboardRouter: Navigating to task detail (index 2)');
    onNavigate?.call(2); // TaskDetail is at index 2
  }

  @override
  void navigateToTaskDetailWithId(String taskId) {
    print('🧭 DashboardRouter: Navigating to task detail with ID: $taskId');
    // In a real implementation, this would pass the task ID to TaskDetail
  }

  @override
  void navigateToSettings() {
    print('🧭 DashboardRouter: Navigating to settings (index 4)');
    onNavigate?.call(4); // Settings is at index 4
  }

  /// Navigate to TaskList from Dashboard
  static void pushTaskListView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TaskListView(),
      ),
    );
  }

  /// Navigate to TaskDetail from Dashboard
  static void pushTaskDetailView(BuildContext context, {String? taskId}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TaskDetailView(),
      ),
    );
  }

  /// Navigate to Settings from Dashboard
  static void pushSettingsView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsView(),
      ),
    );
  }
}
