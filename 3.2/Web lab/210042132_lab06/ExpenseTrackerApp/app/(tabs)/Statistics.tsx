import React, { useState, useEffect } from "react";
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  RefreshControl,
  TouchableOpacity,
  Dimensions,
} from "react-native";
import { PieChart, BarChart } from "react-native-chart-kit";
import Icon from "react-native-vector-icons/MaterialIcons";
import { getExpenses } from "../database/database";
import { useFocusEffect } from "@react-navigation/native";

const screenWidth = Dimensions.get("window").width;
const colors = {
  background: "#FFFFFF",
  surface: "#fefafaff",
  text: "#212121",
  textSecondary: "#757575",
  primary: "#2aa5f2ff",
  secondary: "#ec1414ff",
  error: "#B00020",
  gray: "#9E9E9E",
};
const CATEGORIES = {
  Food: { icon: "🍔", color: "#FF6B6B" },
  Transportation: { icon: "🚗", color: "#4ECDC4" },
  Entertainment: { icon: "🎬", color: "#45B7D1" },
  Shopping: { icon: "🛍️", color: "#96CEB4" },
  Bills: { icon: "📄", color: "#FFEAA7" },
  Healthcare: { icon: "🏥", color: "#DDA0DD" },
  Education: { icon: "📚", color: "#98D8C8" },
  Other: { icon: "📦", color: "#F7DC6F" },
};

export default function Statistics() {
  const [expenses, setExpenses] = useState([]);
  const [refreshing, setRefreshing] = useState(false);
  const [selectedPeriod, setSelectedPeriod] = useState("month");

  useFocusEffect(
    React.useCallback(() => {
      loadExpenses();
    }, [])
  );

  const loadExpenses = async () => {
    try {
      const data = await getExpenses();
      setExpenses(data);
    } catch (error) {
      console.error("Error loading expenses:", error);
    }
  };

  const onRefresh = async () => {
    setRefreshing(true);
    await loadExpenses();
    setRefreshing(false);
  };

  const getFilteredExpenses = () => {
    const now = new Date();
    const filtered = expenses.filter((expense) => {
      const expenseDate = new Date(expense.date);

      switch (selectedPeriod) {
        case "week":
          const weekAgo = new Date(now);
          weekAgo.setDate(weekAgo.getDate() - 7);
          return expenseDate >= weekAgo;
        case "month":
          const monthAgo = new Date(now);
          monthAgo.setMonth(monthAgo.getMonth() - 1);
          return expenseDate >= monthAgo;
        default:
          return true;
      }
    });

    return filtered;
  };

  const calculateTotalAmount = () => {
    const filtered = getFilteredExpenses();
    return filtered.reduce(
      (sum, expense) => sum + parseFloat(expense.amount),
      0
    );
  };

  const calculateCategoryData = () => {
    const filtered = getFilteredExpenses();
    const categoryTotals = {};

    filtered.forEach((expense) => {
      if (categoryTotals[expense.category]) {
        categoryTotals[expense.category] += parseFloat(expense.amount);
      } else {
        categoryTotals[expense.category] = parseFloat(expense.amount);
      }
    });

    return Object.entries(categoryTotals)
      .map(([category, amount]) => ({
        name: category,
        amount: amount,
        color: CATEGORIES[category]?.color || "#95A5A6",
        legendFontColor: colors.text,
        legendFontSize: 14,
      }))
      .sort((a, b) => b.amount - a.amount);
  };

  const calculateDailyAverage = () => {
    const filtered = getFilteredExpenses();
    if (filtered.length === 0) return 0;

    const days =
      selectedPeriod === "week" ? 7 : selectedPeriod === "month" ? 30 : 365;
    return calculateTotalAmount() / days;
  };

  const getMonthlyTrend = () => {
    const monthlyData = {};
    const now = new Date();

    // Get last 6 months
    for (let i = 5; i >= 0; i--) {
      const date = new Date(now);
      date.setMonth(date.getMonth() - i);
      const key = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(
        2,
        "0"
      )}`;
      monthlyData[key] = 0;
    }

    expenses.forEach((expense) => {
      const expenseDate = new Date(expense.date);
      const key = `${expenseDate.getFullYear()}-${String(
        expenseDate.getMonth() + 1
      ).padStart(2, "0")}`;
      if (monthlyData.hasOwnProperty(key)) {
        monthlyData[key] += parseFloat(expense.amount);
      }
    });

    return {
      labels: Object.keys(monthlyData).map((key) => {
        const [year, month] = key.split("-");
        return new Date(year, month - 1).toLocaleDateString("en", {
          month: "short",
        });
      }),
      datasets: [
        {
          data: Object.values(monthlyData),
        },
      ],
    };
  };

  const totalAmount = calculateTotalAmount();
  const categoryData = calculateCategoryData();
  const dailyAverage = calculateDailyAverage();
  const transactionCount = getFilteredExpenses().length;
  const monthlyTrend = getMonthlyTrend();

  const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: colors.background,
    },
    scrollContainer: {
      flexGrow: 1,
      padding: 16,
    },
    periodSelector: {
      flexDirection: "row",
      backgroundColor: colors.surface,
      borderRadius: 8,
      padding: 4,
      marginBottom: 20,
    },
    periodButton: {
      flex: 1,
      paddingVertical: 8,
      alignItems: "center",
      borderRadius: 6,
    },
    periodButtonActive: {
      backgroundColor: colors.primary,
    },
    periodButtonText: {
      color: colors.textSecondary,
      fontWeight: "600",
    },
    periodButtonTextActive: {
      color: colors.white,
    },
    summaryCard: {
      backgroundColor: colors.surface,
      borderRadius: 12,
      padding: 20,
      marginBottom: 20,
      elevation: 2,
      shadowColor: "#000",
      shadowOffset: { width: 0, height: 2 },
      shadowOpacity: 0.1,
      shadowRadius: 4,
    },
    totalAmount: {
      fontSize: 32,
      fontWeight: "bold",
      color: colors.primary,
      textAlign: "center",
      marginBottom: 8,
    },
    totalLabel: {
      fontSize: 16,
      color: colors.textSecondary,
      textAlign: "center",
      marginBottom: 16,
    },
    statsRow: {
      flexDirection: "row",
      justifyContent: "space-evenly",
      marginBottom: 20,
    },

    statItem: {
      alignItems: "center",
    },
    statNumber: {
      fontSize: 20,
      fontWeight: "bold",
      color: colors.primary,
    },
    statLabel: {
      fontSize: 14,
      color: colors.textSecondary,
      marginTop: 4,
    },
    chartCard: {
      backgroundColor: colors.background,
      borderRadius: 12,
      padding: 20,
      marginBottom: 20,
      elevation: 2,
      shadowColor: "#000",
      shadowOffset: { width: 0, height: 2 },
      shadowOpacity: 0.1,
      shadowRadius: 4,
    },
    chartTitle: {
      fontSize: 18,
      fontWeight: "bold",
      color: colors.text,
      marginBottom: 16,
      textAlign: "center",
    },
    categoryList: {
      marginTop: 16,
    },
    categoryItem: {
      flexDirection: "row",
      justifyContent: "space-between",
      alignItems: "center",
      paddingVertical: 8,
    },
    categoryInfo: {
      flexDirection: "row",
      alignItems: "center",
    },
    categoryIcon: {
      fontSize: 24,
      marginRight: 12,
    },
    categoryName: {
      fontSize: 16,
      color: colors.text,
      fontWeight: "500",
    },
    categoryAmount: {
      fontSize: 16,
      fontWeight: "bold",
      color: colors.secondary,
    },
    emptyContainer: {
      flex: 1,
      justifyContent: "center",
      alignItems: "center",
      padding: 32,
    },
    emptyText: {
      fontSize: 18,
      color: colors.textSecondary,
      textAlign: "center",
      marginTop: 16,
    },

    statCard: {
      flex: 1,
      backgroundColor: colors.surface,
      borderRadius: 12,
      padding: 16,
      marginHorizontal: 4,
      alignItems: "center",
      justifyContent: "center",
      elevation: 2,
      shadowColor: "#000",
      shadowOffset: { width: 0, height: 2 },
      shadowOpacity: 0.1,
      shadowRadius: 4,
      aspectRatio: 1, // 👈 makes it a square
      minWidth: 120, // 👈 ensures decent size on small screens
    },
  });

  if (expenses.length === 0) {
    return (
      <View style={styles.container}>
        <ScrollView
          contentContainerStyle={styles.scrollContainer}
          refreshControl={
            <RefreshControl
              refreshing={refreshing}
              onRefresh={onRefresh}
              colors={[colors.primary]}
            />
          }
        >
          <View style={styles.emptyContainer}>
            <Icon name="bar-chart" size={64} color={colors.gray} />
            <Text style={styles.emptyText}>
              No expenses to analyze yet{"\n"}Add some expenses to see
              statistics
            </Text>
          </View>
        </ScrollView>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <ScrollView
        contentContainerStyle={styles.scrollContainer}
        refreshControl={
          <RefreshControl
            refreshing={refreshing}
            onRefresh={onRefresh}
            colors={[colors.primary]}
          />
        }
      >
        <View style={styles.periodSelector}>
          {[
            { key: "week", label: "Week" },
            { key: "month", label: "Month" },
            { key: "all", label: "All Time" },
          ].map((period) => (
            <TouchableOpacity
              key={period.key}
              style={[
                styles.periodButton,
                selectedPeriod === period.key && styles.periodButtonActive,
              ]}
              onPress={() => setSelectedPeriod(period.key)}
            >
              <Text
                style={[
                  styles.periodButtonText,
                  selectedPeriod === period.key &&
                    styles.periodButtonTextActive,
                ]}
              >
                {period.label}
              </Text>
            </TouchableOpacity>
          ))}
        </View>

        {/* Total Section */}
        <View style={styles.summaryCard}>
          <Text style={styles.totalAmount}>${totalAmount.toFixed(2)}</Text>
          <Text style={styles.totalLabel}>
            Total{" "}
            {selectedPeriod === "week"
              ? "This Week"
              : selectedPeriod === "month"
              ? "This Month"
              : "All Time"}
          </Text>
        </View>

        {/* Stats Row Section */}
        <View style={styles.statsRow}>
          <View style={styles.statCard}>
            <Text style={styles.statNumber}>{transactionCount}</Text>
            <Text style={styles.statLabel}>Transactions</Text>
          </View>
          <View style={styles.statCard}>
            <Text style={styles.statNumber}>${dailyAverage.toFixed(2)}</Text>
            <Text style={styles.statLabel}>Daily Average</Text>
          </View>
        </View>

        {categoryData.length > 0 && (
          <View style={styles.chartCard}>
            <Text style={styles.chartTitle}>Spending by Category</Text>

            <View style={styles.categoryList}>
              {categoryData.map((category, index) => (
                <View key={index} style={styles.categoryItem}>
                  <View style={styles.categoryInfo}>
                    <Text style={styles.categoryIcon}>
                      {CATEGORIES[category.name]?.icon || "📦"}
                    </Text>
                    <Text style={styles.categoryName}>{category.name}</Text>
                  </View>
                  <Text style={styles.categoryAmount}>
                    ${category.amount.toFixed(2)}
                  </Text>
                </View>
              ))}
            </View>
          </View>
        )}

        {selectedPeriod === "all" &&
          monthlyTrend.datasets[0].data.some((val) => val > 0) && (
            <View style={styles.chartCard}>
              <Text style={styles.chartTitle}>Monthly Trend</Text>
              <BarChart
                data={monthlyTrend}
                width={screenWidth - 72}
                height={220}
                chartConfig={{
                  backgroundColor: colors.surface,
                  backgroundGradientFrom: colors.surface,
                  backgroundGradientTo: colors.surface,
                  decimalPlaces: 0,
                  color: (opacity = 1) => `rgba(33, 150, 243, ${opacity})`,
                  labelColor: (opacity = 1) => colors.text,
                  style: {
                    borderRadius: 16,
                  },
                  propsForLabels: {
                    fontSize: 12,
                  },
                }}
                style={{
                  marginVertical: 8,
                  borderRadius: 16,
                }}
              />
            </View>
          )}
      </ScrollView>
    </View>
  );
}
