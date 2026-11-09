// app/_layout.tsx
import { Stack } from 'expo-router';
import React from 'react';
import { AuthProvider } from '../providers/AuthProvider';

export default function RootLayout() {
  return (
    <AuthProvider>
      <Stack screenOptions={{ headerShadowVisible: false }}>
        <Stack.Screen name="index" options={{ headerShown: false }} />
        <Stack.Screen name="(auth)/login" options={{ title: 'Welcome' }} />
        <Stack.Screen name="(app)/contacts" options={{ title: 'Contacts' }} />
        <Stack.Screen name="(app)/chat/[uid]" options={{ title: 'Chat' }} />
      </Stack>
    </AuthProvider>
  );
}
