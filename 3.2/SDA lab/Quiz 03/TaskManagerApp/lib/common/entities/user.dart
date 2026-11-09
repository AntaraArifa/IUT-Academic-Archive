// user.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - User Entity Model
// Created on October 2, 2025

import 'task.dart';

/// User Entity Model
/// Represents a user in the task management system
class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;
  final DateTime createdDate;
  final DateTime lastActiveDate;
  final UserPreferences preferences;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    required this.createdDate,
    required this.lastActiveDate,
    required this.preferences,
  });

  /// Create User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastActiveDate: DateTime.parse(json['lastActiveDate'] as String),
      preferences:
          UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
    );
  }

  /// Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'createdDate': createdDate.toIso8601String(),
      'lastActiveDate': lastActiveDate.toIso8601String(),
      'preferences': preferences.toJson(),
    };
  }

  /// Create a copy of this user with updated fields
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImageUrl,
    DateTime? createdDate,
    DateTime? lastActiveDate,
    UserPreferences? preferences,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdDate: createdDate ?? this.createdDate,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      preferences: preferences ?? this.preferences,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email)';
  }
}

/// User Preferences Model
class UserPreferences {
  final AppTheme theme;
  final bool notificationsEnabled;
  final bool emailNotifications;
  final TaskSortOrder defaultSortOrder;
  final int tasksPerPage;

  const UserPreferences({
    this.theme = AppTheme.system,
    this.notificationsEnabled = true,
    this.emailNotifications = false,
    this.defaultSortOrder = TaskSortOrder.dateCreated,
    this.tasksPerPage = 20,
  });

  /// Create UserPreferences from JSON
  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      theme: AppTheme.values[json['theme'] as int],
      notificationsEnabled: json['notificationsEnabled'] as bool,
      emailNotifications: json['emailNotifications'] as bool,
      defaultSortOrder: TaskSortOrder.values[json['defaultSortOrder'] as int],
      tasksPerPage: json['tasksPerPage'] as int,
    );
  }

  /// Convert UserPreferences to JSON
  Map<String, dynamic> toJson() {
    return {
      'theme': theme.index,
      'notificationsEnabled': notificationsEnabled,
      'emailNotifications': emailNotifications,
      'defaultSortOrder': defaultSortOrder.index,
      'tasksPerPage': tasksPerPage,
    };
  }

  /// Create a copy of preferences with updated fields
  UserPreferences copyWith({
    AppTheme? theme,
    bool? notificationsEnabled,
    bool? emailNotifications,
    TaskSortOrder? defaultSortOrder,
    int? tasksPerPage,
  }) {
    return UserPreferences(
      theme: theme ?? this.theme,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      defaultSortOrder: defaultSortOrder ?? this.defaultSortOrder,
      tasksPerPage: tasksPerPage ?? this.tasksPerPage,
    );
  }
}

/// App Theme Enum
enum AppTheme {
  light,
  dark,
  system,
}
