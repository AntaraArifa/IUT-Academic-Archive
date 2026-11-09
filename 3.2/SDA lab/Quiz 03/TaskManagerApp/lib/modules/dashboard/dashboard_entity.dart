// VIPER Architecture - Dashboard Module Entity

/// Dashboard Statistics Entity
class DashboardStats {
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final int inProgressTasks;
  final double completionRate;
  final Map<String, int> tasksByPriority;
  final Map<String, int> tasksByDate;

  DashboardStats({
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.inProgressTasks,
    required this.completionRate,
    required this.tasksByPriority,
    required this.tasksByDate,
  });

  factory DashboardStats.empty() {
    return DashboardStats(
      totalTasks: 0,
      completedTasks: 0,
      pendingTasks: 0,
      inProgressTasks: 0,
      completionRate: 0.0,
      tasksByPriority: {},
      tasksByDate: {},
    );
  }
}

/// Weekly Progress Entity
class WeeklyProgress {
  final List<int> dailyCompletions;
  final int weeklyGoal;
  final int currentStreak;

  WeeklyProgress({
    required this.dailyCompletions,
    required this.weeklyGoal,
    required this.currentStreak,
  });

  factory WeeklyProgress.empty() {
    return WeeklyProgress(
      dailyCompletions: List.filled(7, 0),
      weeklyGoal: 0,
      currentStreak: 0,
    );
  }
}
