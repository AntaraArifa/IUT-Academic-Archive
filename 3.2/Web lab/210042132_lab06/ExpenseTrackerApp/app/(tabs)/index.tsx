import React, { useState, useEffect, useCallback } from 'react';
import {
  View,
  Text,
  StyleSheet,
  FlatList,
  TouchableOpacity,
  RefreshControl,
  TextInput,
  Alert
} from 'react-native';
import Icon from 'react-native-vector-icons/MaterialIcons';
import { getExpenses, deleteExpense } from '../database/database';
import { useFocusEffect } from '@react-navigation/native';

const colors = {
  background: "#FFFFFF",
  surface: "#F5F5F5",
  text: "#212121",
  textSecondary: "#757575",
  primary: "#6200EE",
  secondary: "#ea0909ff",
  error: "#B00020",
  gray: "#9E9E9E"
};


export default function Home ({ navigation })  {
  const [expenses, setExpenses] = useState([]);
  const [filteredExpenses, setFilteredExpenses] = useState([]);
  const [refreshing, setRefreshing] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');

  useFocusEffect(
    useCallback(() => {
      loadExpenses();
    }, [])
  );

  useEffect(() => {
    filterExpenses();
  }, [searchQuery, expenses]);

  const loadExpenses = async () => {
    try {
      const data = await getExpenses();
      setExpenses(data);
    } catch (error) {
      Alert.alert('Error', 'Failed to load expenses');
      console.error(error);
    }
  };

  const filterExpenses = () => {
    if (searchQuery.trim() === '') {
      setFilteredExpenses(expenses);
    } else {
      const filtered = expenses.filter(expense =>
        expense.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        expense.category.toLowerCase().includes(searchQuery.toLowerCase())
      );
      setFilteredExpenses(filtered);
    }
  };

  const onRefresh = async () => {
    setRefreshing(true);
    await loadExpenses();
    setRefreshing(false);
  };

  

  const formatDate = (dateString) => {
    const date = new Date(dateString);
    const today = new Date();
    const yesterday = new Date(today);
    yesterday.setDate(yesterday.getDate() - 1);

    if (date.toDateString() === today.toDateString()) {
      return 'Today';
    } else if (date.toDateString() === yesterday.toDateString()) {
      return 'Yesterday';
    } else {
      const diffTime = today - date;
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
      if (diffDays <= 7) {
        return `${diffDays} days ago`;
      } else {
        return date.toLocaleDateString();
      }
    }
  };

  const renderExpenseItem = ({ item }) => (
    <TouchableOpacity
      style={[styles.expenseItem, { backgroundColor: colors.background }]}
      onPress={() => navigation.navigate('ExpenseDetails', { expense: item })}
    >
      <View style={styles.expenseHeader}>
        <View style={styles.expenseInfo}>
          <Text style={[styles.expenseTitle, { color: colors.text }]}>
            {item.title}
          </Text>
          <Text style={[styles.expenseCategory, { color: colors.textSecondary }]}>
             {item.category} • {formatDate(item.date)}
          </Text>
        </View>
        <View style={styles.expenseActions}>
          <Text style={[styles.expenseAmount, { color: colors.secondary }]}>
            ${parseFloat(item.amount).toFixed(2)}
          </Text>
        </View>
      </View>
    </TouchableOpacity>
  );

  const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: colors.background,
    },
    
    expenseItem: {
      marginHorizontal: 16,
      marginVertical: 4,
      padding: 16,
      borderRadius: 8,
      elevation: 2,
      shadowColor: '#000',
      shadowOffset: { width: 0, height: 1 },
      shadowOpacity: 0.2,
      shadowRadius: 2,
    },
    expenseHeader: {
      flexDirection: 'row',
      justifyContent: 'space-between',
      alignItems: 'center',
    },
    expenseInfo: {
      flex: 1,
    },
    expenseTitle: {
      fontSize: 16,
      fontWeight: '600',
      marginBottom: 4,
    },
    expenseCategory: {
      fontSize: 14,
    },
    expenseActions: {
      flexDirection: 'row',
      alignItems: 'center',
    },
    expenseAmount: {
      fontSize: 18,
      fontWeight: 'bold',
      marginRight: 12,
    },
    deleteButton: {
      padding: 4,
    },
    emptyContainer: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      padding: 32,
    },
    emptyText: {
      fontSize: 18,
      color: colors.textSecondary,
      textAlign: 'center',
      marginTop: 16,
    },
  });

  

  return (
    <View style={styles.container}>
      <FlatList
        data={filteredExpenses}
        renderItem={renderExpenseItem}
        keyExtractor={(item) => item.id.toString()}
        refreshControl={
          <RefreshControl
            refreshing={refreshing}
            onRefresh={onRefresh}
            colors={[colors.primary]}
          />
        }
      />
    </View>
  );
};

