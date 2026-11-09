// VIPER Architecture - Profile Module Entity

/// User Profile Entity
class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String? avatarUrl;
  final DateTime joinDate;
  final UserPreferences preferences;
  final UserStats stats;

  UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarUrl,
    required this.joinDate,
    required this.preferences,
    required this.stats,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      joinDate: DateTime.parse(json['joinDate'] as String),
      preferences:
          UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
      stats: UserStats.fromJson(json['stats'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'avatarUrl': avatarUrl,
      'joinDate': joinDate.toIso8601String(),
      'preferences': preferences.toJson(),
      'stats': stats.toJson(),
    };
  }

  UserProfile copyWith({
    String? id,
    String? fullName,
    String? email,
    String? avatarUrl,
    DateTime? joinDate,
    UserPreferences? preferences,
    UserStats? stats,
  }) {
    return UserProfile(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      joinDate: joinDate ?? this.joinDate,
      preferences: preferences ?? this.preferences,
      stats: stats ?? this.stats,
    );
  }
}

/// User Preferences Entity
class UserPreferences {
  final bool darkMode;
  final String language;
  final bool notifications;
  final bool emailDigest;
  final String defaultPriority;
  final int dailyGoal;

  UserPreferences({
    required this.darkMode,
    required this.language,
    required this.notifications,
    required this.emailDigest,
    required this.defaultPriority,
    required this.dailyGoal,
  });

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      darkMode: json['darkMode'] as bool? ?? false,
      language: json['language'] as String? ?? 'en',
      notifications: json['notifications'] as bool? ?? true,
      emailDigest: json['emailDigest'] as bool? ?? false,
      defaultPriority: json['defaultPriority'] as String? ?? 'medium',
      dailyGoal: json['dailyGoal'] as int? ?? 5,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'darkMode': darkMode,
      'language': language,
      'notifications': notifications,
      'emailDigest': emailDigest,
      'defaultPriority': defaultPriority,
      'dailyGoal': dailyGoal,
    };
  }

  UserPreferences copyWith({
    bool? darkMode,
    String? language,
    bool? notifications,
    bool? emailDigest,
    String? defaultPriority,
    int? dailyGoal,
  }) {
    return UserPreferences(
      darkMode: darkMode ?? this.darkMode,
      language: language ?? this.language,
      notifications: notifications ?? this.notifications,
      emailDigest: emailDigest ?? this.emailDigest,
      defaultPriority: defaultPriority ?? this.defaultPriority,
      dailyGoal: dailyGoal ?? this.dailyGoal,
    );
  }
}

/// User Statistics Entity
class UserStats {
  final int totalTasksCreated;
  final int totalTasksCompleted;
  final int currentStreak;
  final int longestStreak;
  final double averageCompletionTime;
  final Map<String, int> monthlyCompletions;

  UserStats({
    required this.totalTasksCreated,
    required this.totalTasksCompleted,
    required this.currentStreak,
    required this.longestStreak,
    required this.averageCompletionTime,
    required this.monthlyCompletions,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) {
    return UserStats(
      totalTasksCreated: json['totalTasksCreated'] as int? ?? 0,
      totalTasksCompleted: json['totalTasksCompleted'] as int? ?? 0,
      currentStreak: json['currentStreak'] as int? ?? 0,
      longestStreak: json['longestStreak'] as int? ?? 0,
      averageCompletionTime:
          (json['averageCompletionTime'] as num?)?.toDouble() ?? 0.0,
      monthlyCompletions:
          Map<String, int>.from(json['monthlyCompletions'] as Map? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalTasksCreated': totalTasksCreated,
      'totalTasksCompleted': totalTasksCompleted,
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'averageCompletionTime': averageCompletionTime,
      'monthlyCompletions': monthlyCompletions,
    };
  }

  factory UserStats.empty() {
    return UserStats(
      totalTasksCreated: 0,
      totalTasksCompleted: 0,
      currentStreak: 0,
      longestStreak: 0,
      averageCompletionTime: 0.0,
      monthlyCompletions: {},
    );
  }
}
