// task_detail_presenter.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - TaskDetail Module Presenter
// Created on October 6, 2025

import 'package:flutter/material.dart';
import '../../common/entities/task.dart';
import 'task_detail_protocols.dart';

/// TaskDetail Presenter Implementation
/// Handles presentation logic and communication between View and Interactor
class TaskDetailPresenter
    implements
        TaskDetailPresenterProtocol,
        TaskDetailInteractorOutputProtocol,
        TaskDetailPresenterInputProtocol {
  TaskDetailViewProtocol? view;
  TaskDetailInteractorProtocol? interactor;
  TaskDetailRouterProtocol? router;

  Task? _currentTask;
  bool _isEditing = false;
  bool _isLoading = false;
  Map<String, String> _validationErrors = {};

  // Setters for VIPER components
  void setView(view) {
    this.view = view as TaskDetailViewProtocol?;
  }

  void setInteractor(interactor) {
    this.interactor = interactor as TaskDetailInteractorProtocol?;
  }

  void setRouter(router) {
    this.router = router as TaskDetailRouterProtocol?;
  }

  void setTask(Task? task) {
    _currentTask = task;
    _isEditing = task != null;
  }

  // MARK: - BasePresenterProtocol

  @override
  void viewDidLoad() {
    if (_currentTask != null) {
      view?.displayTask(_currentTask!);
    }
    _validateCurrentState();
  }

  @override
  void viewDidAppear() {
    // Implementation for view appearing
  }

  @override
  void viewDidDisappear() {
    // Implementation for view disappearing
  }

  // MARK: - TaskDetailPresenterProtocol

  @override
  void didTapSave(Task task) {
    if (_isLoading) return;

    _isLoading = true;
    view?.showLoading();

    interactor?.validateTask(task);
  }

  @override
  void didTapCancel(BuildContext context) {
    router?.navigateBackWithResult(context, null);
  }

  @override
  void didChangeTitle(String title) {
    _clearValidationError('title');
    _validateCurrentState();
  }

  @override
  void didChangeDescription(String description) {
    _clearValidationError('description');
    _validateCurrentState();
  }

  @override
  void didChangePriority(TaskPriority priority) {
    _validateCurrentState();
  }

  @override
  void didChangeStatus(TaskStatus status) {
    _validateCurrentState();
  }

  @override
  void didChangeDueDate(DateTime? dueDate) {
    _validateCurrentState();
  }

  @override
  void didAddTag(String tag) {
    _validateCurrentState();
  }

  @override
  void didRemoveTag(String tag) {
    _validateCurrentState();
  }

  // MARK: - TaskDetailPresenterInputProtocol

  @override
  void saveTask() {
    // This will be called by the view when save button is pressed
  }

  @override
  void cancelEditing() {
    // Implementation for canceling
  }

  @override
  void validateInput() {
    _validateCurrentState();
  }

  @override
  void deleteCurrent() {
    if (_currentTask != null) {
      // Show confirmation dialog
    }
  }

  // MARK: - TaskDetailInteractorOutputProtocol

  @override
  void taskValidationSucceeded() {
    _validationErrors.clear();
    view?.clearValidationErrors();

    // Proceed with saving
    if (_currentTask != null) {
      if (_isEditing) {
        interactor?.updateTask(_currentTask!);
      } else {
        interactor?.saveTask(_currentTask!);
      }
    }
  }

  @override
  void taskValidationFailed(Map<String, String> errors) {
    _isLoading = false;
    _validationErrors = errors;

    view?.hideLoading();
    view?.clearValidationErrors();

    // Display validation errors
    errors.forEach((field, error) {
      view?.displayValidationError(field, error);
    });

    _validateCurrentState();
  }

  @override
  void taskSaveSucceeded(Task task) {
    _isLoading = false;
    _currentTask = task;

    view?.hideLoading();
    view?.showSuccess(
        _isEditing ? 'Task updated successfully' : 'Task created successfully');

    // Navigate back with result after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      router?.navigateBackWithResult(_getCurrentContext(), task);
    });
  }

  @override
  void taskSaveFailed(String error) {
    _isLoading = false;
    view?.hideLoading();
    view?.showError('Failed to save task: $error');
  }

  @override
  void taskUpdateSucceeded(Task task) {
    taskSaveSucceeded(task); // Same handling as save
  }

  @override
  void taskUpdateFailed(String error) {
    _isLoading = false;
    view?.hideLoading();
    view?.showError('Failed to update task: $error');
  }

  @override
  void taskDetailsLoaded(Task task) {
    _currentTask = task;
    view?.displayTask(task);
  }

  @override
  void taskDetailsLoadFailed(String error) {
    view?.showError('Failed to load task details: $error');
  }

  // MARK: - Private Methods

  void _validateCurrentState() {
    if (_validationErrors.isEmpty) {
      view?.enableSaveButton();
    } else {
      view?.disableSaveButton();
    }
  }

  void _clearValidationError(String field) {
    _validationErrors.remove(field);
  }

  BuildContext _getCurrentContext() {
    // This is a simplified approach - in a real app you'd handle this differently
    // For now, we'll assume the view can provide the context
    return _buildContext ?? _fallbackContext();
  }

  BuildContext? _buildContext;

  void setContext(BuildContext context) {
    _buildContext = context;
  }

  BuildContext _fallbackContext() {
    // Fallback - this should ideally be handled by the router
    throw Exception('Context not available - ensure setContext is called');
  }
}
