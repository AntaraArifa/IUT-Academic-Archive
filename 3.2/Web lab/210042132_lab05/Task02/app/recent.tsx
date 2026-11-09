import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  SafeAreaView,
  TouchableOpacity,
} from 'react-native';

interface Activity {
  icon: string;
  title: string;
  description: string;
  time: string;
}

interface StatItem {
  number: string;
  label: string;
}

const RecentActivityTab = () => {
  const activities: Activity[] = [
    {
      icon: "📰",
      title: "New Feature Released",
      description: "Check out our latest mobile update",
      time: "2 hours ago"
    },
    {
      icon: "🎉",
      title: "Welcome to the Team!",
      description: "5 new members joined today",
      time: "4 hours ago"
    },
    {
      icon: "📊",
      title: "Weekly Report Generated",
      description: "Your analytics report is ready to view",
      time: "6 hours ago"
    },
    {
      icon: "💰",
      title: "Payment Processed",
      description: "Monthly subscription payment completed",
      time: "8 hours ago"
    },
    {
      icon: "⚙️",
      title: "Settings Updated",
      description: "Your notification preferences have been saved",
      time: "1 day ago"
    },
    {
      icon: "📱",
      title: "Mobile App Sync",
      description: "Data synchronized across all devices",
      time: "1 day ago"
    },
    {
      icon: "🔔",
      title: "Reminder Set",
      description: "Task reminder scheduled for tomorrow",
      time: "2 days ago"
    },
    {
      icon: "👥",
      title: "Team Meeting",
      description: "Weekly standup meeting completed",
      time: "2 days ago"
    }
  ];

  const stats: StatItem[] = [
    { number: "24", label: "Tasks" },
    { number: "8.5h", label: "Hours" },
    { number: "92%", label: "Progress" },
  ];

  const handleActivityPress = (activity: Activity) => {
    console.log(`Activity pressed: ${activity.title}`);
  };

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.activityContainer} showsVerticalScrollIndicator={false}>
        {/* Daily Summary */}
        <View style={styles.section}>
          <View style={styles.summaryHeader}>
            <Text style={styles.sectionTitle}>Daily Summary</Text>
            <Text style={styles.todayText}>Today</Text>
          </View>
          
          <View style={styles.summaryStats}>
            {stats.map((stat, index) => (
              <View key={index} style={styles.statItem}>
                <Text style={styles.statNumber}>{stat.number}</Text>
                <Text style={styles.statLabel}>{stat.label}</Text>
              </View>
            ))}
          </View>
          
          <View style={styles.progressContainer}>
            <View style={styles.progressBar}>
              <View style={[styles.progressFill, { width: '92%' }]} />
            </View>
          </View>
        </View>

        {/* Latest Updates */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Latest Updates</Text>
          {activities.map((activity, index) => (
            <TouchableOpacity 
              key={index} 
              style={styles.activityItem}
              onPress={() => handleActivityPress(activity)}
            >
              <View style={styles.activityIcon}>
                <Text style={styles.activityEmoji}>{activity.icon}</Text>
              </View>
              <View style={styles.activityContent}>
                <Text style={styles.activityTitle}>{activity.title}</Text>
                <Text style={styles.activityDescription}>{activity.description}</Text>
                <Text style={styles.activityTime}>{activity.time}</Text>
              </View>
            </TouchableOpacity>
          ))}
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#ffffff',
  },
  activityContainer: {
    flex: 1,
    paddingHorizontal: 20,
  },
  section: {
    marginBottom: 30,
    marginTop: 20,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 15,
  },
  summaryHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 20,
  },
  todayText: {
    fontSize: 16,
    color: '#666',
  },
  summaryStats: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 20,
  },
  statItem: {
    alignItems: 'center',
  },
  statNumber: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 5,
  },
  statLabel: {
    fontSize: 14,
    color: '#666',
  },
  progressContainer: {
    marginBottom: 20,
  },
  progressBar: {
    height: 8,
    backgroundColor: '#e0e0e0',
    borderRadius: 4,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
    backgroundColor: '#6c5ce7',
    borderRadius: 4,
  },
  activityItem: {
    flexDirection: 'row',
    backgroundColor: '#f8f9fa',
    borderRadius: 12,
    padding: 15,
    marginBottom: 15,
    alignItems: 'flex-start',
  },
  activityIcon: {
    width: 40,
    height: 40,
    backgroundColor: '#e0e0e0',
    borderRadius: 20,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 15,
  },
  activityEmoji: {
    fontSize: 18,
  },
  activityContent: {
    flex: 1,
  },
  activityTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#333',
    marginBottom: 5,
  },
  activityDescription: {
    fontSize: 14,
    color: '#666',
    marginBottom: 5,
  },
  activityTime: {
    fontSize: 12,
    color: '#999',
  },
});

export default RecentActivityTab;