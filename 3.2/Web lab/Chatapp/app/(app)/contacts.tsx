// app/(app)/contacts.tsx
import { Ionicons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import { signOut } from 'firebase/auth';
import { collection, onSnapshot, orderBy, query } from 'firebase/firestore';
import React, { useEffect, useMemo, useState } from 'react';
import { FlatList, SafeAreaView, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { auth, db } from '../../firebase';
import { useAuth } from '../../providers/AuthProvider';
import { emailToUsername } from '../../utils/convo';

type UserDoc = {
  uid: string;
  email?: string;
  name?: string;
  createdAt?: any;
};

export default function Contacts() {
  const router = useRouter();
  const { user } = useAuth();
  const [users, setUsers] = useState<UserDoc[]>([]);

  useEffect(() => {
    const q = query(collection(db, 'users'), orderBy('createdAt', 'desc'));
    const unsub = onSnapshot(q, (snap) => {
      const arr: UserDoc[] = [];
      snap.forEach((d) => arr.push(d.data() as UserDoc));
      setUsers(arr);
    });
    return () => unsub();
  }, []);

  const others = useMemo(() => users.filter((u) => u.uid !== user?.uid), [users, user?.uid]);

  const displayName = (u: UserDoc) => u.name || emailToUsername(u.email) || 'User';

  return (
    <SafeAreaView style={styles.screen}>
      <View style={styles.header}>
        <View style={styles.headerContent}>
          <Text style={styles.title}>Contacts</Text>
          <Text style={styles.subtitle}>Start a conversation</Text>
        </View>
      </View>

      <View style={styles.content}>
        {others.length === 0 ? (
          <View style={styles.emptyState}>
            <Text style={styles.emptyTitle}>No contacts yet</Text>
            <Text style={styles.emptyText}>When other users join, they&apos;ll appear here</Text>
          </View>
        ) : (
          <FlatList
            data={others}
            keyExtractor={(item) => item.uid}
            keyboardShouldPersistTaps="handled"
            showsVerticalScrollIndicator={false}
            renderItem={({ item }) => (
              <TouchableOpacity
                style={styles.contactCard}
                onPress={() => router.push(`/(app)/chat/${item.uid}`)}
                activeOpacity={0.7}
              >
                <View style={styles.avatar}>
                  <Text style={styles.avatarText}>
                    {displayName(item).charAt(0).toUpperCase()}
                  </Text>
                </View>
                <View style={styles.contactInfo}>
                  <Text style={styles.name}>{displayName(item)}</Text>
                  {!!item.email && <Text style={styles.email}>{item.email}</Text>}
                </View>
                <View style={styles.chevron}>
                  <Ionicons name="chevron-forward-outline" size={20} color="#94a3b8" />
                </View>
              </TouchableOpacity>
            )}
            contentContainerStyle={styles.listContainer}
          />
        )}
      </View>

      <TouchableOpacity 
        style={styles.signOutBtn}
        onPress={() => signOut(auth).then(() => router.replace('/(auth)/login'))}
      >
        <Ionicons name="log-out-outline" size={20} color="#fff" />
        <Text style={styles.signOutText}>Sign out</Text>
      </TouchableOpacity>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  screen: { 
    flex: 1, 
    backgroundColor: '#f8fafc' 
  },
  header: {
    backgroundColor: '#4CAF50', 
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 20,
    borderBottomWidth: 1,
    borderBottomColor: '#e2e8f0',
    flexDirection: 'row',
    alignItems: 'flex-end',
    justifyContent: 'space-between',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 6,
    elevation: 4,
  },
  headerContent: {
    flex: 1,
  },
  title: { 
    fontSize: 28, 
    fontWeight: '800',
    color: '#fff',
    marginBottom: 4,
  },
  subtitle: {
    fontSize: 14,
    color: '#d1d5db',
  },
  content: {
    flex: 1,
  },
  emptyState: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 32,
  },
  emptyTitle: {
    fontSize: 20,
    fontWeight: '700',
    color: '#374151',
    marginBottom: 8,
  },
  emptyText: {
    fontSize: 16,
    color: '#64748b',
    textAlign: 'center',
    lineHeight: 24,
  },
  listContainer: {
    padding: 16,
  },
  contactCard: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
    flexDirection: 'row',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 4,
  },
  avatar: {
    width: 50,
    height: 50,
    borderRadius: 25,
    backgroundColor: '#4CAF50', 
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 16,
  },
  avatarText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '700',
  },
  contactInfo: {
    flex: 1,
  },
  name: { 
    fontSize: 17, 
    fontWeight: '600', 
    color: '#1e293b',
    marginBottom: 2,
  },
  email: { 
    fontSize: 14, 
    color: '#64748b',
  },
  chevron: {
    marginLeft: 12,
  },
  
  signOutBtn: {
  position: 'absolute',
  bottom: 48,
    alignSelf: 'center',
    backgroundColor: '#ef4444',
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: 8,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 4,
  },
  signOutText: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 14,
    marginLeft: 8,
  },
});
