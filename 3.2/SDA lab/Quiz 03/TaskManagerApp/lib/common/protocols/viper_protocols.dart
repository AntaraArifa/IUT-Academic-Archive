// viper_protocols.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - Protocol Layer
// Created on October 2, 2025

import 'package:flutter/material.dart';

/// Base VIPER Protocols
/// These abstract classes define the contracts between VIPER components

// MARK: - View Protocol
/// View handles UI display and user interactions
/// View -> Presenter communication
abstract class BaseViewProtocol {
  /// Show loading indicator
  void showLoading();

  /// Hide loading indicator
  void hideLoading();

  /// Show error message to user
  void showError(String message);

  /// Show success message to user
  void showSuccess(String message);
}

// MARK: - Presenter Protocol
/// Presenter handles presentation logic and coordinates between View and Interactor
/// Presenter -> View, Presenter -> Interactor, Presenter -> Router communication
abstract class BasePresenterProtocol {
  /// Called when view is loaded
  void viewDidLoad();

  /// Called when view will appear
  void viewWillAppear();

  /// Called when view did appear
  void viewDidAppear();

  /// Called when view will disappear
  void viewWillDisappear();
}

// MARK: - Interactor Protocol
/// Interactor handles business logic and data operations
/// Interactor -> Presenter communication
abstract class BaseInteractorProtocol {
  // Base interactor methods can be added here
}

// MARK: - Router Protocol
/// Router handles navigation and module creation
abstract class BaseRouterProtocol {
  /// Navigate back to previous screen
  void navigateBack(BuildContext context);

  /// Show alert dialog
  void showAlert(BuildContext context, String title, String message);

  /// Show confirmation dialog
  void showConfirmation(
    BuildContext context,
    String title,
    String message,
    VoidCallback onConfirm,
  );
}

// MARK: - Data Manager Protocol
/// Protocol for data persistence and retrieval
abstract class DataManagerProtocol {
  /// Save tasks to persistent storage
  Future<bool> saveTasks(List<dynamic> tasks);

  /// Load tasks from persistent storage
  Future<List<dynamic>> loadTasks();

  /// Save user preferences to persistent storage
  Future<bool> saveUserPreferences(dynamic preferences);

  /// Load user preferences from persistent storage
  Future<dynamic> loadUserPreferences();

  /// Clear all data
  Future<bool> clearAllData();
}

// MARK: - Navigation Delegate Protocol
/// Protocol for handling navigation between modules
abstract class NavigationDelegate {
  /// Navigate to task detail with task data
  void navigateToTaskDetail(BuildContext context, dynamic task);

  /// Navigate to settings screen
  void navigateToSettings(BuildContext context);

  /// Navigate to add task screen
  void navigateToAddTask(BuildContext context);

  /// Navigate back to previous screen
  void navigateBack(BuildContext context);
}

// MARK: - Module Assembly Protocol
/// Protocol for VIPER module assembly
abstract class ModuleAssemblyProtocol {
  /// Create and assemble VIPER module
  Widget createModule();
}

// MARK: - Error Handling Protocol
/// Protocol for consistent error handling across modules
abstract class ErrorHandlingProtocol {
  /// Handle generic error
  void handleError(String error);

  /// Handle network error
  void handleNetworkError();

  /// Handle validation error
  void handleValidationError(String field, String message);
}

// MARK: - Loading State Protocol
/// Protocol for managing loading states
abstract class LoadingStateProtocol {
  /// Set loading state
  void setLoading(bool isLoading);

  /// Get current loading state
  bool get isLoading;
}

// MARK: - Validation Protocol
/// Protocol for data validation
abstract class ValidationProtocol {
  /// Validate required field
  bool isValidRequired(String? value);

  /// Validate email format
  bool isValidEmail(String? email);

  /// Validate minimum length
  bool isValidMinLength(String? value, int minLength);

  /// Get validation error message
  String? getValidationError(String field, String? value);
}
