import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  ScrollView,
  SafeAreaView,
  Dimensions,
} from 'react-native';
import { useRouter } from 'expo-router';

const { width } = Dimensions.get('window');

interface Action {
  icon: string;
  label: string;
  color: string;
}

interface Activity {
  icon: string;
  title: string;
  description: string;
  time: string;
}

const HomeTab = () => {
  const router = useRouter();
  
  const actions: Action[] = [
    { icon: "📊", label: "Analytics", color: "#ff6b6b" },
    { icon: "💰", label: "Payments", color: "#4ecdc4" },
    { icon: "📱", label: "Services", color: "#45b7d1" },
    { icon: "⚙️", label: "Settings", color: "#f9ca24" },
  ];

  const recentActivities: Activity[] = [
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
    }
  ];

  const handleActionPress = (action: Action) => {
    // Handle action press
    console.log(`${action.label} pressed`);
  };

  const handleViewAllActivities = () => {
    router.push('/(tabs)/recent');
  };

  const handleActivityPress = (activity: Activity) => {
    console.log(`Activity pressed: ${activity.title}`);
    // You can add specific activity handling here
  };

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.homeContainer} showsVerticalScrollIndicator={false}>
        {/* Header */}
        <View style={styles.header}>
          <View>
            <Text style={styles.greeting}>Good Morning</Text>
            <Text style={styles.userName}>John Doe</Text>
          </View>
          <View style={styles.profileContainer}>
            <View style={styles.profileIcon}>
              <Text style={styles.profileText}>JD</Text>
            </View>
            <View style={styles.notificationBadge}>
              <Text style={styles.badgeText}>3</Text>
            </View>
          </View>
        </View>

        {/* Search Bar */}
        <TouchableOpacity style={styles.searchContainer}>
          <Text style={styles.searchIcon}>🔍</Text>
          <Text style={styles.searchPlaceholder}>Search anything...</Text>
        </TouchableOpacity>

        {/* Quick Actions */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Quick Actions</Text>
          <View style={styles.actionsGrid}>
            {actions.map((action, index) => (
              <TouchableOpacity 
                key={index} 
                style={styles.actionItem}
                onPress={() => handleActionPress(action)}
              >
                <View style={[styles.actionIcon, { backgroundColor: action.color }]}>
                  <Text style={styles.actionEmoji}>{action.icon}</Text>
                </View>
                <Text style={styles.actionLabel}>{action.label}</Text>
              </TouchableOpacity>
            ))}
          </View>
        </View>

        {/* Recent Activity Preview */}
        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>Recent Activity</Text>
            <TouchableOpacity onPress={handleViewAllActivities}>
              <Text style={styles.viewAllText}>View All</Text>
            </TouchableOpacity>
          </View>
          
          <View style={styles.activitiesContainer}>
            {recentActivities.slice(0, 2).map((activity, index) => (
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
                  <Text style={styles.activityDescription} numberOfLines={1}>
                    {activity.description}
                  </Text>
                  <Text style={styles.activityTime}>{activity.time}</Text>
                </View>
              </TouchableOpacity>
            ))}
            
            <TouchableOpacity 
              style={styles.viewMoreButton}
              onPress={handleViewAllActivities}
            >
              <Text style={styles.viewMoreText}>View More Activities</Text>
            </TouchableOpacity>
          </View>
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
  homeContainer: {
    flex: 1,
    paddingHorizontal: 20,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 20,
    marginBottom: 30,
  },
  greeting: {
    fontSize: 16,
    color: '#888',
    marginBottom: 5,
  },
  userName: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#333',
  },
  profileContainer: {
    position: 'relative',
  },
  profileIcon: {
    width: 50,
    height: 50,
    backgroundColor: '#6c5ce7',
    borderRadius: 25,
    justifyContent: 'center',
    alignItems: 'center',
  },
  profileText: {
    color: 'white',
    fontSize: 16,
    fontWeight: 'bold',
  },
  notificationBadge: {
    position: 'absolute',
    top: -5,
    right: -5,
    backgroundColor: '#ff4757',
    borderRadius: 10,
    width: 20,
    height: 20,
    justifyContent: 'center',
    alignItems: 'center',
  },
  badgeText: {
    color: 'white',
    fontSize: 12,
    fontWeight: 'bold',
  },
  searchContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
    borderRadius: 25,
    paddingHorizontal: 20,
    paddingVertical: 12,
    marginBottom: 30,
  },
  searchIcon: {
    fontSize: 18,
    marginRight: 10,
  },
  searchPlaceholder: {
    fontSize: 16,
    color: '#999',
  },
  section: {
    marginBottom: 30,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 15,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 15,
  },
  viewAllText: {
    color: '#6c5ce7',
    fontSize: 14,
    fontWeight: '500',
  },
  actionsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
  },
  actionItem: {
    alignItems: 'center',
    width: (width - 60) / 2,
    marginBottom: 20,
  },
  actionIcon: {
    width: 60,
    height: 60,
    borderRadius: 30,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 10,
  },
  actionEmoji: {
    fontSize: 24,
  },
  actionLabel: {
    fontSize: 16,
    fontWeight: '500',
    color: '#333',
  },
  activitiesContainer: {
    backgroundColor: '#f8f9fa',
    borderRadius: 12,
    padding: 15,
  },
  activityItem: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  activityIcon: {
    width: 35,
    height: 35,
    backgroundColor: '#ffffff',
    borderRadius: 17.5,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 1,
    },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  activityEmoji: {
    fontSize: 16,
  },
  activityContent: {
    flex: 1,
  },
  activityTitle: {
    fontSize: 14,
    fontWeight: '600',
    color: '#333',
    marginBottom: 3,
  },
  activityDescription: {
    fontSize: 12,
    color: '#666',
    marginBottom: 3,
  },
  activityTime: {
    fontSize: 11,
    color: '#999',
  },
  viewMoreButton: {
    marginTop: 10,
    paddingVertical: 8,
    alignItems: 'center',
    borderTopWidth: 1,
    borderTopColor: '#e0e0e0',
  },
  viewMoreText: {
    color: '#6c5ce7',
    fontSize: 14,
    fontWeight: '500',
  },

});

export default HomeTab;