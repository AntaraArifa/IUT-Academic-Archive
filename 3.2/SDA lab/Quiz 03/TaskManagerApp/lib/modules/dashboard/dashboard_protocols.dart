// VIPER Architecture - Dashboard Module Protocols

import 'dashboard_entity.dart';

/// VIPER Protocols for Dashboard Module
/// These define the communication interfaces between VIPER components

// View -> Presenter
abstract class DashboardViewToPresenterProtocol {
  void viewDidLoad();
  void refreshDashboard();
  void navigateToTaskList();
  void navigateToTaskDetail();
  void viewTaskDetails(String taskId);
}

// Presenter -> View
abstract class DashboardPresenterToViewProtocol {
  void showLoadingIndicator();
  void hideLoadingIndicator();
  void displayDashboardStats(DashboardStats stats);
  void displayWeeklyProgress(WeeklyProgress progress);
  void displayProductivityInsights(List<String> insights);
  void showError(String message);
}

// Presenter -> Interactor
abstract class DashboardPresenterToInteractorProtocol {
  void calculateDashboardStats();
  void calculateWeeklyProgress();
  void getProductivityInsights();
}

// Interactor -> Presenter
abstract class DashboardInteractorToPresenterProtocol {
  void didCalculateStats(DashboardStats stats);
  void didCalculateProgress(WeeklyProgress progress);
  void didGetInsights(List<String> insights);
  void didFailWithError(String error);
}

// Presenter -> Router
abstract class DashboardPresenterToRouterProtocol {
  void navigateToTaskList();
  void navigateToTaskDetail();
  void navigateToTaskDetailWithId(String taskId);
  void navigateToSettings();
}
