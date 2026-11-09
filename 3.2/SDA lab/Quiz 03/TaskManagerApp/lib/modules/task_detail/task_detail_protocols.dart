// task_detail_protocols.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskDetail Module Protocols
// Created on October 6, 2025

import 'package:flutter/material.dart';
import '../../common/entities/task.dart';

/// Base Protocol Definitions
abstract class BaseViewProtocol {
  void showLoading();
  void hideLoading();
  void showError(String error);
  void showSuccess(String message);
}

abstract class BasePresenterProtocol {
  void viewDidLoad();
  void viewDidAppear();
  void viewDidDisappear();
}

abstract class BaseInteractorProtocol {}

abstract class BaseRouterProtocol {
  void navigateBack(BuildContext context);
  void showAlert(BuildContext context, String title, String message);
  void showConfirmation(BuildContext context, String title, String message,
      VoidCallback onConfirm);
}

/// TaskDetail Module Protocols

// View Protocol
abstract class TaskDetailViewProtocol extends BaseViewProtocol {
  void displayTask(Task task);
  void displayValidationError(String field, String error);
  void clearValidationErrors();
  void enableSaveButton();
  void disableSaveButton();
}

// Presenter Protocol
abstract class TaskDetailPresenterProtocol extends BasePresenterProtocol {
  void didTapSave(Task task);
  void didTapCancel(BuildContext context);
  void didChangeTitle(String title);
  void didChangeDescription(String description);
  void didChangePriority(TaskPriority priority);
  void didChangeStatus(TaskStatus status);
  void didChangeDueDate(DateTime? dueDate);
  void didAddTag(String tag);
  void didRemoveTag(String tag);
}

// Interactor Protocol
abstract class TaskDetailInteractorProtocol extends BaseInteractorProtocol {
  Future<void> validateTask(Task task);
  Future<void> saveTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> loadTaskDetails(String taskId);
}

// Router Protocol
abstract class TaskDetailRouterProtocol extends BaseRouterProtocol {
  void navigateBackWithResult(BuildContext context, Task? task);
  void showDeleteConfirmation(BuildContext context, VoidCallback onConfirm);
}

// Interactor Output Protocol (Callbacks to Presenter)
abstract class TaskDetailInteractorOutputProtocol {
  void taskValidationSucceeded();
  void taskValidationFailed(Map<String, String> errors);
  void taskSaveSucceeded(Task task);
  void taskSaveFailed(String error);
  void taskUpdateSucceeded(Task task);
  void taskUpdateFailed(String error);
  void taskDetailsLoaded(Task task);
  void taskDetailsLoadFailed(String error);
}

// Presenter Input Protocol (Methods called by View)
abstract class TaskDetailPresenterInputProtocol {
  void saveTask();
  void cancelEditing();
  void validateInput();
  void deleteCurrent();
}
