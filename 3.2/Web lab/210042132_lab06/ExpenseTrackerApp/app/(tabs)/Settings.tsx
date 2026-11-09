import React, { useState, useEffect } from "react";
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Switch,
  Alert,
  ScrollView,
  Share,
  ActionSheetIOS,
  Platform,
} from "react-native";
import AsyncStorage from "@react-native-async-storage/async-storage";
import * as SecureStore from "expo-secure-store";
import Icon from "react-native-vector-icons/MaterialIcons";
import { clearAllExpenses, getExpenses } from "../database/database";

const lightTheme = {
  primary: "#2196F3",
  secondary: "#FF5722",
  background: "#F5F5F5",
  surface: "#FFFFFF",
  text: "#212121",
  textSecondary: "#757575",
  gray: "#9E9E9E",
  white: "#FFFFFF",
  error: "#F44336",
};

const darkTheme = {
  primary: "#2196F3",
  secondary: "#FF5722",
  background: "#121212",
  surface: "#1E1E1E",
  text: "#FFFFFF",
  textSecondary: "#B3B3B3",
  gray: "#757575",
  white: "#FFFFFF",
  error: "#CF6679",
};

const CURRENCIES = [
  { label: "USD ($)", value: "USD" },
  { label: "EUR (€)", value: "EUR" },
  { label: "GBP (£)", value: "GBP" },
  { label: "JPY (¥)", value: "JPY" },
  { label: "CAD (C$)", value: "CAD" },
  { label: "AUD (A$)", value: "AUD" },
];

const CATEGORIES = [
  "Food",
  "Transportation",
  "Entertainment",
  "Shopping",
  "Bills",
  "Healthcare",
  "Education",
  "Other",
];

export default function Settings() {
  const [currency, setCurrency] = useState("USD");
  const [defaultCategory, setDefaultCategory] = useState("Food");
  const [biometricAuth, setBiometricAuth] = useState(false);
  const [pinProtection, setPinProtection] = useState(false);
  const [isDarkTheme, setIsDarkTheme] = useState(false);
  const [colors, setColors] = useState(lightTheme);

  useEffect(() => {
    loadThemePreference();
    loadSettings();
  }, []);

  useEffect(() => {
    setColors(isDarkTheme ? darkTheme : lightTheme);
  }, [isDarkTheme]);

  const loadThemePreference = async () => {
    const theme = await AsyncStorage.getItem("darkTheme");
    if (theme !== null) setIsDarkTheme(JSON.parse(theme));
  };

  const toggleTheme = async () => {
    const newTheme = !isDarkTheme;
    setIsDarkTheme(newTheme);
    await AsyncStorage.setItem("darkTheme", JSON.stringify(newTheme));
  };

  const loadSettings = async () => {
    const savedCurrency = await AsyncStorage.getItem("currency");
    if (savedCurrency) setCurrency(savedCurrency);

    const savedCategory = await AsyncStorage.getItem("defaultCategory");
    if (savedCategory) setDefaultCategory(savedCategory);

    const savedBiometric = await SecureStore.getItemAsync("biometricAuth");
    if (savedBiometric) setBiometricAuth(JSON.parse(savedBiometric));

    const savedPin = await SecureStore.getItemAsync("pinProtection");
    if (savedPin) setPinProtection(JSON.parse(savedPin));
  };

  const saveSetting = async (key, value, isSecure = false) => {
    if (isSecure) {
      await SecureStore.setItemAsync(key, JSON.stringify(value));
    } else {
      await AsyncStorage.setItem(key, value);
    }
  };

  // ----- Currency Picker -----
  const handleCurrencyPress = () => {
    const options = [...CURRENCIES.map((c) => c.label), "Cancel"];
    ActionSheetIOS.showActionSheetWithOptions(
      {
        options,
        cancelButtonIndex: options.length - 1,
      },
      (buttonIndex) => {
        if (buttonIndex < CURRENCIES.length) {
          setCurrency(CURRENCIES[buttonIndex].value);
          saveSetting("currency", CURRENCIES[buttonIndex].value);
        }
      }
    );
  };

  // ----- Category Picker -----
  const handleCategoryPress = () => {
    const options = [...CATEGORIES, "Cancel"];
    ActionSheetIOS.showActionSheetWithOptions(
      {
        options,
        cancelButtonIndex: options.length - 1,
      },
      (buttonIndex) => {
        if (buttonIndex < CATEGORIES.length) {
          setDefaultCategory(CATEGORIES[buttonIndex]);
          saveSetting("defaultCategory", CATEGORIES[buttonIndex]);
        }
      }
    );
  };

  const handleBiometricToggle = (value) => {
    setBiometricAuth(value);
    saveSetting("biometricAuth", value, true);
  };

  const handlePinToggle = (value) => {
    if (value) {
      Alert.alert(
        "Set PIN",
        "PIN protection feature would be implemented here with a proper setup screen",
        [
          { text: "Cancel", style: "cancel" },
          {
            text: "Set PIN",
            onPress: () => {
              setPinProtection(true);
              saveSetting("pinProtection", true, true);
            },
          },
        ]
      );
    } else {
      setPinProtection(false);
      saveSetting("pinProtection", false, true);
    }
  };

  const handleExportData = async () => {
    const expenses = await getExpenses();
    if (expenses.length === 0) {
      Alert.alert("No Data", "There are no expenses to export");
      return;
    }
    const csvHeader = "Date,Title,Category,Amount,Description\n";
    const csvData = expenses
      .map(
        (e) =>
          `${e.date},"${e.title}","${e.category}",${e.amount},"${
            e.description || ""
          }"`
      )
      .join("\n");
    await Share.share({
      message: csvHeader + csvData,
      title: "Expense Data Export",
    });
  };

  const handleClearAllData = () => {
    Alert.alert("Clear All Data", "This action cannot be undone.", [
      { text: "Cancel", style: "cancel" },
      {
        text: "Clear All",
        style: "destructive",
        onPress: async () => {
          await clearAllExpenses();
          Alert.alert("Success", "All data has been cleared");
        },
      },
    ]);
  };

  const styles = StyleSheet.create({
    container: { flex: 1, backgroundColor: colors.background },
    scrollContainer: { flexGrow: 1, padding: 16 },
    section: {
      backgroundColor: colors.surface,
      borderRadius: 12,
      marginBottom: 16,
      elevation: 2,
      shadowColor: "#000",
      shadowOffset: { width: 0, height: 2 },
      shadowOpacity: 0.1,
      shadowRadius: 4,
    },
    sectionTitle: {
      fontSize: 18,
      fontWeight: "bold",
      color: colors.text,
      padding: 16,
      paddingBottom: 8,
    },
    settingItem: {
      flexDirection: "row",
      alignItems: "center",
      justifyContent: "space-between",
      paddingHorizontal: 16,
      paddingVertical: 12,
      borderBottomWidth: 1,
      borderBottomColor: colors.gray + "20",
    },
    lastSettingItem: { borderBottomWidth: 0 },
    settingLabel: { fontSize: 16, color: colors.text },
    settingValue: {
      fontSize: 16,
      color: colors.primary,
      fontWeight: "600",
    },
    actionButton: {
      flexDirection: "row",
      alignItems: "center",
      justifyContent: "space-between", // pushes text left, icon right
      paddingHorizontal: 16,
      paddingVertical: 12,
      borderBottomWidth: 1,
      borderBottomColor: colors.gray + "20",
    },
    
    lastActionButton: { borderBottomWidth: 0 },
    actionButtonText: { fontSize: 16, color: colors.text},
    actionButtonTextDanger: { color: colors.error },
    version: {
      textAlign: "center",
      color: colors.textSecondary,
      fontSize: 14,
      marginTop: 32,
      marginBottom: 16,
    },
  });

  return (
    <View style={styles.container}>
      <ScrollView style={styles.scrollContainer}>
        {/* Preferences Section */}

        <View style={styles.settingItem}>
          <Text style={styles.settingLabel}>Currency</Text>
          <TouchableOpacity onPress={handleCurrencyPress}>
            <Text style={styles.settingValue}>
              {CURRENCIES.find((c) => c.value === currency)?.label}
            </Text>
          </TouchableOpacity>
        </View>

        <View style={styles.settingItem}>
          <Text style={styles.settingLabel}>Default Category</Text>
          <TouchableOpacity onPress={handleCategoryPress}>
            <Text style={styles.settingValue}>{defaultCategory}</Text>
          </TouchableOpacity>
        </View>

        <View style={[styles.settingItem, styles.lastSettingItem]}>
          <Text style={styles.settingLabel}>Dark Theme</Text>
          <Switch
            value={isDarkTheme}
            onValueChange={toggleTheme}
            trackColor={{ false: colors.gray, true: colors.primary }}
            thumbColor={colors.white}
          />
        </View>

        <View style={styles.settingItem}>
          <Text style={styles.settingLabel}>Biometric Authentication</Text>
          <Switch
            value={biometricAuth}
            onValueChange={handleBiometricToggle}
            trackColor={{ false: colors.gray, true: colors.primary }}
            thumbColor={colors.white}
          />
        </View>

        <View style={[styles.settingItem, styles.lastSettingItem]}>
          <Text style={styles.settingLabel}>PIN Protection</Text>
          <Switch
            value={pinProtection}
            onValueChange={handlePinToggle}
            trackColor={{ false: colors.gray, true: colors.primary }}
            thumbColor={colors.white}
          />
        </View>

        {/* Data Management Section */}

        <TouchableOpacity
          style={styles.actionButton}
          onPress={handleExportData}
        >
          
          <Text style={styles.actionButtonText}>Export Data</Text>
          <Icon name="file-download" size={24} color={colors.primary} />
        </TouchableOpacity>

        <TouchableOpacity
          style={[styles.actionButton, styles.lastActionButton]}
          onPress={handleClearAllData}
        >
          
          <Text
            style={[styles.actionButtonText, styles.actionButtonTextDanger]}
          >
            Clear All Data
          </Text>
          <Icon name="delete-forever" size={24} color={colors.error} />
        </TouchableOpacity>
      </ScrollView>
    </View>
  );
}
