// main.dart
// TaskManagerApp - Flutter Cross-Platform
// VIPER Architecture - Main Application Entry Point
// Created on October 2, 2025

import 'package:flutter/material.dart';
import 'modules/task_list/task_list_view.dart';
import 'modules/dashboard/dashboard_view.dart';
import 'modules/task_detail/task_detail_view.dart';
import 'modules/profile/profile_view.dart';
import 'modules/settings/settings_view.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager - VIPER Architecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
          shape: CircleBorder(),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MainNavigationView(),
    );
  }
}

/// Main Navigation View with Bottom Navigation Bar
class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _currentIndex = 0;

  void _navigateToPage(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
  }

  List<Widget> get _pages => [
        DashboardView(onNavigate: _navigateToPage),
        const TaskListView(),
        const TaskDetailView(),
        const ProfileView(),
        const SettingsView(),
      ];

  final List<BottomNavigationBarItem> _navigationItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'Tasks',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_circle),
      label: 'Add Task',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navigationItems,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

/// App Configuration Class
class AppConfig {
  static const String appName = 'Task Manager';
  static const String version = '1.0.0';
  static const String author = 'SDA Lab Student';
  static const String description =
      'Cross-platform Task Manager demonstrating VIPER architecture';

  // Storage keys
  static const String tasksStorageKey = 'tasks';
  static const String preferencesStorageKey = 'user_preferences';
  static const String userStorageKey = 'user_data';

  // Default values
  static const int maxTaskTitleLength = 100;
  static const int maxTaskDescriptionLength = 500;
  static const int defaultTasksPerPage = 20;

  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color successColor = Colors.green;
  static const Color errorColor = Colors.red;
  static const Color warningColor = Colors.orange;

  /// Get app info for about screen
  static Map<String, String> getAppInfo() {
    return {
      'App Name': appName,
      'Version': version,
      'Author': author,
      'Description': description,
      'Architecture': 'VIPER Pattern',
      'Platform': 'Flutter Cross-Platform',
    };
  }
}
