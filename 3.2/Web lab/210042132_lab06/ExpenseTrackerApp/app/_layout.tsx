import { DarkTheme, DefaultTheme, ThemeProvider } from '@react-navigation/native';
import { useFonts } from 'expo-font';
import { Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';``
import 'react-native-reanimated';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import { useColorScheme } from '@/hooks/useColorScheme';
import { useEffect } from 'react';
import { initDatabase } from './database/database';

export default function RootLayout() {
  useEffect(() => {
    (async () => {
      try {
        await initDatabase();
      } catch (e) {
        console.error("DB init failed", e);
      }
    })();
  }, []);
  return (
      <Stack>
        <Stack.Screen name="(tabs)" options={{ headerShown: false}} />
        <Stack.Screen name="+not-found" />
      </Stack>
  );
}
