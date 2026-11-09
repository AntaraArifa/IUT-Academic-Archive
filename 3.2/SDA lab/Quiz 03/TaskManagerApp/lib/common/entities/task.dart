// task.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - Task Entity Model
// Created on October 2, 2025

/// Task Entity - Core data model in VIPER architecture
/// Entities are simple data models used by Interactors
class Task {
  final String id;
  final String title;
  final String description;
  final TaskPriority priority;
  final TaskStatus status;
  final DateTime createdDate;
  final DateTime lastModifiedDate;
  final DateTime? dueDate;
  final List<String> tags;
  final int? estimatedHours;
  final int? actualHours;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.createdDate,
    required this.lastModifiedDate,
    this.dueDate,
    this.tags = const [],
    this.estimatedHours,
    this.actualHours,
  });

  /// Factory constructor for JSON deserialization
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      priority: TaskPriority.values[json['priority'] as int],
      status: TaskStatus.values[json['status'] as int],
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      tags: List<String>.from(json['tags'] as List? ?? []),
      estimatedHours: json['estimatedHours'] as int?,
      actualHours: json['actualHours'] as int?,
    );
  }

  /// Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority.index,
      'status': status.index,
      'createdDate': createdDate.toIso8601String(),
      'lastModifiedDate': lastModifiedDate.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'tags': tags,
      'estimatedHours': estimatedHours,
      'actualHours': actualHours,
    };
  }

  /// Create a copy of this task with updated fields
  Task copyWith({
    String? id,
    String? title,
    String? description,
    TaskPriority? priority,
    TaskStatus? status,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
    DateTime? dueDate,
    List<String>? tags,
    int? estimatedHours,
    int? actualHours,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      createdDate: createdDate ?? this.createdDate,
      lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
      dueDate: dueDate ?? this.dueDate,
      tags: tags ?? this.tags,
      estimatedHours: estimatedHours ?? this.estimatedHours,
      actualHours: actualHours ?? this.actualHours,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, priority: $priority, status: $status)';
  }
}

/// Task Priority Enum
enum TaskPriority {
  low,
  medium,
  high,
}

/// Task Status Enum
enum TaskStatus {
  pending,
  inProgress,
  completed,
}

/// Task Sort Order Enum
enum TaskSortOrder {
  dateCreated,
  dateModified,
  dueDate,
  priority,
  title,
  status,
}
