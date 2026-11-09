import { Tabs } from 'expo-router';
import React from 'react';
import { Platform } from 'react-native';

import { HapticTab } from '@/components/HapticTab';
import { IconSymbol } from '@/components/ui/IconSymbol';
import TabBarBackground from '@/components/ui/TabBarBackground';
import { Colors } from '@/constants/Colors';
import { useColorScheme } from '@/hooks/useColorScheme';
import { Ionicons } from '@expo/vector-icons';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import homeStack from './HomeStack';
import AddExpense from './AddExpense';
import Statistics from './Statistics';
import Settings from './Settings';
import Icon from 'react-native-vector-icons/MaterialIcons';
import { useTheme } from '@react-navigation/native';

export default function TabLayout() {
  const Tab=createBottomTabNavigator();
  const { colors } = useTheme();
  return (
    <Tab.Navigator
    screenOptions={({ route }) => ({
      headerStyle: { backgroundColor: "#2196F3" },
        headerTintColor: "#fff",
        headerTitleStyle: { fontWeight: "bold" },
        tabBarActiveTintColor: "#2196F3",
        tabBarInactiveTintColor: "gray",
        tabBarIcon: ({ focused, color, size }) => {
          let iconName;
          if (route.name === 'Home') iconName = 'list';
          else if (route.name === 'Add') iconName = 'add-circle';
          else if (route.name === 'Stats') iconName = 'bar-chart';
          else if (route.name === 'Settings') iconName = 'settings';
          
          
          return <Icon name={iconName} size={size} color={color} />;
        },
      })}>
      <Tab.Screen
        name="Home" 
        component={homeStack} 
        options={{ headerShown: false ,
          headerStyle: { backgroundColor: "#2196F3" },
        }}
      />
      <Tab.Screen
       name="Add" 
        component={AddExpense}
        options={{ title: 'Add Expense' ,
          headerStyle: { backgroundColor: "#2196F3" },
        }}
      />
      <Tab.Screen
        name="Stats" 
        component={Statistics}
        options={{ title: 'Statistics' ,
          headerStyle: { backgroundColor: "#2196F3" },
        }}
      />
      <Tab.Screen
        name="Settings" 
        component={Settings}
        options={{ title: 'Settings' ,
          headerStyle: { backgroundColor: "#2196F3" },
        }}
      />
    </Tab.Navigator>
  );
}
