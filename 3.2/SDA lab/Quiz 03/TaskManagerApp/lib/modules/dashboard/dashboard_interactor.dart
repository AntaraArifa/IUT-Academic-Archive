// VIPER Architecture - Dashboard Module Interactor

import '../../common/entities/task.dart';
import 'dashboard_entity.dart';

/// Dashboard Module Business Logic
class DashboardInteractor {
  /// Calculate dashboard statistics from tasks
  DashboardStats calculateStats(List<Task> tasks) {
    print(
        '🔄 DashboardInteractor: Calculating stats for ${tasks.length} tasks');

    if (tasks.isEmpty) {
      print('📊 DashboardInteractor: No tasks found, returning empty stats');
      return DashboardStats.empty();
    }

    int totalTasks = tasks.length;
    int completedTasks =
        tasks.where((task) => task.status == TaskStatus.completed).length;
    int pendingTasks =
        tasks.where((task) => task.status == TaskStatus.pending).length;
    int inProgressTasks =
        tasks.where((task) => task.status == TaskStatus.inProgress).length;

    double completionRate =
        totalTasks > 0 ? (completedTasks / totalTasks) * 100 : 0.0;

    // Group by priority
    Map<String, int> tasksByPriority = {};
    for (Task task in tasks) {
      String priorityKey = task.priority.toString().split('.').last;
      tasksByPriority[priorityKey] = (tasksByPriority[priorityKey] ?? 0) + 1;
    }

    // Group by date (last 7 days)
    Map<String, int> tasksByDate = {};
    DateTime now = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime date = now.subtract(Duration(days: i));
      String dateKey = date.toString().split(' ')[0];
      tasksByDate[dateKey] = tasks
          .where((task) => task.createdDate.toString().split(' ')[0] == dateKey)
          .length;
    }

    DashboardStats stats = DashboardStats(
      totalTasks: totalTasks,
      completedTasks: completedTasks,
      pendingTasks: pendingTasks,
      inProgressTasks: inProgressTasks,
      completionRate: completionRate,
      tasksByPriority: tasksByPriority,
      tasksByDate: tasksByDate,
    );

    print(
        '📊 DashboardInteractor: Stats calculated - Total: $totalTasks, Completed: $completedTasks, Rate: ${completionRate.toStringAsFixed(1)}%');
    return stats;
  }

  /// Calculate weekly progress
  WeeklyProgress calculateWeeklyProgress(List<Task> tasks) {
    print('📈 DashboardInteractor: Calculating weekly progress');

    List<int> dailyCompletions = List.filled(7, 0);
    DateTime now = DateTime.now();

    for (int i = 0; i < 7; i++) {
      DateTime date =
          now.subtract(Duration(days: 6 - i)); // Start from 6 days ago
      String dateKey = date.toString().split(' ')[0];

      dailyCompletions[i] = tasks
          .where((task) =>
              task.status == TaskStatus.completed &&
              task.createdDate.toString().split(' ')[0] == dateKey)
          .length;
    }

    int weeklyGoal = 10; // Default goal
    int currentStreak = _calculateStreak(tasks);

    WeeklyProgress progress = WeeklyProgress(
      dailyCompletions: dailyCompletions,
      weeklyGoal: weeklyGoal,
      currentStreak: currentStreak,
    );

    print(
        '📈 DashboardInteractor: Weekly progress calculated - Streak: $currentStreak days');
    return progress;
  }

  /// Calculate current completion streak
  int _calculateStreak(List<Task> tasks) {
    DateTime now = DateTime.now();
    int streak = 0;

    for (int i = 0; i < 30; i++) {
      // Check last 30 days
      DateTime date = now.subtract(Duration(days: i));
      String dateKey = date.toString().split(' ')[0];

      bool hasCompletedTask = tasks.any((task) =>
          task.status == TaskStatus.completed &&
          task.createdDate.toString().split(' ')[0] == dateKey);

      if (hasCompletedTask) {
        streak++;
      } else {
        break; // Streak broken
      }
    }

    return streak;
  }

  /// Get productivity insights
  List<String> getProductivityInsights(DashboardStats stats) {
    List<String> insights = [];

    if (stats.completionRate >= 80) {
      insights.add(
          '🎉 Excellent productivity! ${stats.completionRate.toStringAsFixed(1)}% completion rate');
    } else if (stats.completionRate >= 60) {
      insights.add('👍 Good progress! Keep up the momentum');
    } else if (stats.completionRate >= 40) {
      insights.add(
          '📈 Room for improvement - try breaking tasks into smaller parts');
    } else {
      insights
          .add('🎯 Focus on completing existing tasks before adding new ones');
    }

    if (stats.inProgressTasks > stats.completedTasks) {
      insights.add('⚠️ You have more in-progress tasks than completed ones');
    }

    if (stats.tasksByPriority['high'] != null &&
        stats.tasksByPriority['high']! > 5) {
      insights.add('🔥 Many high-priority tasks - consider prioritizing them');
    }

    print('💡 DashboardInteractor: Generated ${insights.length} insights');
    return insights;
  }
}
