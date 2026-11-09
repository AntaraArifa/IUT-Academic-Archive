import { Stack } from 'expo-router';
import { StyleSheet } from 'react-native';

export default function RootLayout() {
  return (
    <Stack
      screenOptions={{
        headerShown: false,
        contentStyle: { backgroundColor: '#ffffff' },
      }}
    >
      <Stack.Screen 
        name="index" 
        options={{
          title: 'Login',
        }}
      />
      <Stack.Screen 
        name="(tabs)" 
        options={{
          title: 'Home',
        }}
      />
    </Stack>
  );
}