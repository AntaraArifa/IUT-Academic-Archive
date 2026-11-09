// VIPER Architecture - Profile Module View

import 'package:flutter/material.dart';
import 'profile_entity.dart';

/// Profile View - User profile and account management page
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  static Widget create() {
    return const ProfileView();
  }

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late UserProfile _userProfile;

  @override
  void initState() {
    super.initState();
    _setupProfile();
  }

  void _setupProfile() {
    // Sample user profile data
    _userProfile = UserProfile(
      id: 'user_001',
      fullName: 'Rifah',
      email: 'rifah@gmail.com',
      joinDate: DateTime(2024, 1, 15),
      preferences: UserPreferences(
        darkMode: false,
        language: 'en',
        notifications: true,
        emailDigest: false,
        defaultPriority: 'medium',
        dailyGoal: 5,
      ),
      stats: UserStats(
        totalTasksCreated: 25,
        totalTasksCompleted: 18,
        currentStreak: 3,
        longestStreak: 7,
        averageCompletionTime: 2.5,
        monthlyCompletions: {
          'Jan': 8,
          'Feb': 10,
          'Mar': 0,
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('👤 Profile'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            onPressed: _editProfile,
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profile',
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 18),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, size: 18, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Delete Account', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildStatsSection(),
            const SizedBox(height: 20),
            _buildPreferencesSection(),
            const SizedBox(height: 20),
            _buildAccountSection(),
            const SizedBox(height: 20),
            _buildAboutSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple.withOpacity(0.2),
              child: _userProfile.avatarUrl != null
                  ? ClipOval(
                      child: Image.network(
                        _userProfile.avatarUrl!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Text(
                      _userProfile.fullName.split(' ').map((n) => n[0]).join(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            Text(
              _userProfile.fullName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              _userProfile.email,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Member since ${_formatDate(_userProfile.joinDate)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[500],
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Statistics',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Tasks Created',
                    '${_userProfile.stats.totalTasksCreated}',
                    Icons.add_circle_outline,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Completed',
                    '${_userProfile.stats.totalTasksCompleted}',
                    Icons.check_circle_outline,
                    Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Current Streak',
                    '${_userProfile.stats.currentStreak} days',
                    Icons.local_fire_department,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Best Streak',
                    '${_userProfile.stats.longestStreak} days',
                    Icons.emoji_events,
                    Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.speed, color: Colors.indigo),
              title: const Text('Average Completion Time'),
              trailing: Text(
                '${_userProfile.stats.averageCompletionTime.toStringAsFixed(1)} hours',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: color.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preferences',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: const Text('Use dark theme'),
              value: _userProfile.preferences.darkMode,
              onChanged: _toggleDarkMode,
              secondary: const Icon(Icons.dark_mode),
              contentPadding: EdgeInsets.zero,
            ),
            SwitchListTile(
              title: const Text('Notifications'),
              subtitle: const Text('Receive push notifications'),
              value: _userProfile.preferences.notifications,
              onChanged: _toggleNotifications,
              secondary: const Icon(Icons.notifications),
              contentPadding: EdgeInsets.zero,
            ),
            SwitchListTile(
              title: const Text('Email Digest'),
              subtitle: const Text('Weekly progress email'),
              value: _userProfile.preferences.emailDigest,
              onChanged: _toggleEmailDigest,
              secondary: const Icon(Icons.email),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('Default Priority'),
              trailing: DropdownButton<String>(
                value: _userProfile.preferences.defaultPriority,
                items: const [
                  DropdownMenuItem(value: 'low', child: Text('Low')),
                  DropdownMenuItem(value: 'medium', child: Text('Medium')),
                  DropdownMenuItem(value: 'high', child: Text('High')),
                ],
                onChanged: _changeDefaultPriority,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.track_changes),
              title: const Text('Daily Goal'),
              trailing: Text(
                '${_userProfile.preferences.dailyGoal} tasks',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: _changeDailyGoal,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _changePassword,
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.backup),
              title: const Text('Backup Data'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _backupData,
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Export Data'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _exportData,
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _viewPrivacyPolicy,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('App Version'),
              trailing: const Text('1.0.0'),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Built with Flutter'),
              trailing: const Text('VIPER Architecture'),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _getHelp,
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title: const Text('Rate App'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _rateApp,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  void _editProfile() {
    print('🔧 ProfileView: Edit profile requested');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit profile functionality coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'logout':
        _logout();
        break;
      case 'delete':
        _deleteAccount();
        break;
    }
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              print('🚪 ProfileView: User logged out');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text('This action cannot be undone. Are you sure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              print('🗑️ ProfileView: Account deletion requested');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account deletion is not available in demo'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _userProfile = _userProfile.copyWith(
        preferences: _userProfile.preferences.copyWith(darkMode: value),
      );
    });
    print('🌙 ProfileView: Dark mode ${value ? 'enabled' : 'disabled'}');
  }

  void _toggleNotifications(bool value) {
    setState(() {
      _userProfile = _userProfile.copyWith(
        preferences: _userProfile.preferences.copyWith(notifications: value),
      );
    });
    print('🔔 ProfileView: Notifications ${value ? 'enabled' : 'disabled'}');
  }

  void _toggleEmailDigest(bool value) {
    setState(() {
      _userProfile = _userProfile.copyWith(
        preferences: _userProfile.preferences.copyWith(emailDigest: value),
      );
    });
    print('📧 ProfileView: Email digest ${value ? 'enabled' : 'disabled'}');
  }

  void _changeDefaultPriority(String? value) {
    if (value != null) {
      setState(() {
        _userProfile = _userProfile.copyWith(
          preferences:
              _userProfile.preferences.copyWith(defaultPriority: value),
        );
      });
      print('🚩 ProfileView: Default priority changed to $value');
    }
  }

  void _changeDailyGoal() {
    showDialog(
      context: context,
      builder: (context) {
        int newGoal = _userProfile.preferences.dailyGoal;
        return StatefulBuilder(
          builder: (context, setDialogState) => AlertDialog(
            title: const Text('Daily Goal'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Current goal: $newGoal tasks per day'),
                Slider(
                  value: newGoal.toDouble(),
                  min: 1,
                  max: 20,
                  divisions: 19,
                  label: '$newGoal',
                  onChanged: (value) {
                    setDialogState(() {
                      newGoal = value.round();
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _userProfile = _userProfile.copyWith(
                      preferences:
                          _userProfile.preferences.copyWith(dailyGoal: newGoal),
                    );
                  });
                  Navigator.pop(context);
                  print('🎯 ProfileView: Daily goal changed to $newGoal');
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _changePassword() {
    print('🔐 ProfileView: Change password requested');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Password change functionality coming soon!')),
    );
  }

  void _backupData() {
    print('💾 ProfileView: Backup data requested');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data backup functionality coming soon!')),
    );
  }

  void _exportData() {
    print('📤 ProfileView: Export data requested');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data export functionality coming soon!')),
    );
  }

  void _viewPrivacyPolicy() {
    print('📋 ProfileView: Privacy policy requested');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Opening privacy policy...')),
    );
  }

  void _getHelp() {
    print('❓ ProfileView: Help requested');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Help & support functionality coming soon!')),
    );
  }

  void _rateApp() {
    print('⭐ ProfileView: Rate app requested');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you for wanting to rate our app!')),
    );
  }
}
