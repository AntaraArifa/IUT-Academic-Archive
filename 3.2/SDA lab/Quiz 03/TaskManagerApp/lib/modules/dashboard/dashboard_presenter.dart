// VIPER Architecture - Dashboard Module Presenter

import 'dashboard_protocols.dart';
import 'dashboard_entity.dart';
import 'dashboard_interactor.dart';
import '../../common/entities/task.dart';

/// Dashboard Module Presenter - Handles presentation logic and user interaction
class DashboardPresenter implements DashboardViewToPresenterProtocol {
  // VIPER References
  DashboardPresenterToViewProtocol? view;
  DashboardPresenterToInteractorProtocol? interactor;
  DashboardPresenterToRouterProtocol? router;

  // State
  List<Task> _tasks = [];
  DashboardStats? _currentStats;
  WeeklyProgress? _currentProgress;

  @override
  void viewDidLoad() {
    print('🎯 DashboardPresenter: View did load');
    view?.showLoadingIndicator();
    _loadDashboardData();
  }

  @override
  void refreshDashboard() {
    print('🔄 DashboardPresenter: Refreshing dashboard data');
    view?.showLoadingIndicator();
    _loadDashboardData();
  }

  @override
  void navigateToTaskList() {
    print('🧭 DashboardPresenter: Navigating to task list');
    router?.navigateToTaskList();
  }

  @override
  void navigateToTaskDetail() {
    print('🧭 DashboardPresenter: Navigating to task detail');
    router?.navigateToTaskDetail();
  }

  @override
  void viewTaskDetails(String taskId) {
    print('🧭 DashboardPresenter: Viewing task details for: $taskId');
    router?.navigateToTaskDetailWithId(taskId);
  }

  /// Load dashboard data from interactor
  void _loadDashboardData() {
    print('📊 DashboardPresenter: Loading dashboard data');

    // In a real app, this would come from a data source
    // For now, we'll create some sample data
    _tasks = _generateSampleTasks();

    // Calculate statistics
    DashboardInteractor dashboardInteractor = DashboardInteractor();
    _currentStats = dashboardInteractor.calculateStats(_tasks);
    _currentProgress = dashboardInteractor.calculateWeeklyProgress(_tasks);

    // Get insights
    List<String> insights =
        dashboardInteractor.getProductivityInsights(_currentStats!);

    view?.hideLoadingIndicator();
    view?.displayDashboardStats(_currentStats!);
    view?.displayWeeklyProgress(_currentProgress!);
    view?.displayProductivityInsights(insights);

    print('📊 DashboardPresenter: Dashboard data loaded successfully');
  }

  /// Generate sample tasks for demonstration
  List<Task> _generateSampleTasks() {
    DateTime now = DateTime.now();

    return [
      Task(
        id: '1',
        title: 'Complete Flutter App',
        description: 'Finish the task management app',
        priority: TaskPriority.high,
        status: TaskStatus.inProgress,
        createdDate: now.subtract(const Duration(days: 2)),
        lastModifiedDate: now,
        dueDate: now.add(const Duration(days: 3)),
        tags: ['development', 'flutter'],
      ),
      Task(
        id: '2',
        title: 'Review Code',
        description: 'Review pull requests from team',
        priority: TaskPriority.medium,
        status: TaskStatus.completed,
        createdDate: now.subtract(const Duration(days: 1)),
        lastModifiedDate: now.subtract(const Duration(hours: 2)),
        tags: ['review'],
      ),
      Task(
        id: '3',
        title: 'Update Documentation',
        description: 'Update project documentation',
        priority: TaskPriority.low,
        status: TaskStatus.pending,
        createdDate: now.subtract(const Duration(hours: 5)),
        lastModifiedDate: now.subtract(const Duration(hours: 5)),
        tags: ['documentation'],
      ),
      Task(
        id: '4',
        title: 'Fix Login Bug',
        description: 'Fix authentication issue',
        priority: TaskPriority.high,
        status: TaskStatus.completed,
        createdDate: now.subtract(const Duration(days: 3)),
        lastModifiedDate: now.subtract(const Duration(days: 1)),
        tags: ['bug', 'authentication'],
      ),
      Task(
        id: '5',
        title: 'Design UI Mockups',
        description: 'Create new UI designs',
        priority: TaskPriority.medium,
        status: TaskStatus.inProgress,
        createdDate: now.subtract(const Duration(hours: 8)),
        lastModifiedDate: now.subtract(const Duration(hours: 2)),
        tags: ['design', 'ui'],
      ),
    ];
  }

  /// Get formatted completion rate
  String getFormattedCompletionRate() {
    return _currentStats?.completionRate.toStringAsFixed(1) ?? '0.0';
  }

  /// Get total tasks count
  int getTotalTasksCount() {
    return _currentStats?.totalTasks ?? 0;
  }

  /// Get completed tasks count
  int getCompletedTasksCount() {
    return _currentStats?.completedTasks ?? 0;
  }
}
