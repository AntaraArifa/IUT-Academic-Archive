// app/(app)/chat/[uid].tsx
import { useHeaderHeight } from '@react-navigation/elements';
import { useLocalSearchParams, useNavigation } from 'expo-router';
import {
  addDoc, collection, doc, getDoc, limit, onSnapshot,
  orderBy, query, serverTimestamp, setDoc
} from 'firebase/firestore';
import React, { useEffect, useLayoutEffect, useMemo, useRef, useState } from 'react';
import {
  Animated,
  FlatList,
  Keyboard,
  Platform,
  SafeAreaView,
  StyleSheet,
  Text, TextInput, TouchableOpacity,
  View
} from 'react-native';
import { db } from '../../../firebase';
import { useAuth } from '../../../providers/AuthProvider';
import { convoIdFor, emailToUsername } from '../../../utils/convo';
import { Ionicons } from '@expo/vector-icons'; 

type Message = {
  id?: string;
  text: string;
  createdAt: any;
  uid: string;
  name?: string;
};

export default function ChatWithUser() {
  const { uid: otherUidParam } = useLocalSearchParams<{ uid: string }>();
  const navigation = useNavigation();
  const headerHeight = useHeaderHeight();

  const { user } = useAuth();
  const [messages, setMessages] = useState<Message[]>([]);
  const [text, setText] = useState('');
  const [myName, setMyName] = useState<string>('Me');
  const [otherName, setOtherName] = useState<string>('User');
  const [keyboardHeight, setKeyboardHeight] = useState(0);
  const sending = useRef(false);
  const inputBottomAnim = useRef(new Animated.Value(0)).current;

  const myUid = user?.uid!;
  const otherUid = useMemo(
    () => (Array.isArray(otherUidParam) ? otherUidParam[0] : otherUidParam),
    [otherUidParam]
  );
  const convoId = useMemo(() => convoIdFor(myUid, otherUid), [myUid, otherUid]);

  useEffect(() => {
    const keyboardWillShow = (event: any) => {
      const keyboardHeight = event.endCoordinates.height;
      setKeyboardHeight(keyboardHeight);
      Animated.timing(inputBottomAnim, {
        toValue: keyboardHeight,
        duration: event.duration || 250,
        useNativeDriver: false,
      }).start();
    };

    const keyboardWillHide = (event: any) => {
      setKeyboardHeight(0);
      Animated.timing(inputBottomAnim, {
        toValue: 0,
        duration: event.duration || 250,
        useNativeDriver: false,
      }).start();
    };

    const showEvent = Platform.OS === 'ios' ? 'keyboardWillShow' : 'keyboardDidShow';
    const hideEvent = Platform.OS === 'ios' ? 'keyboardWillHide' : 'keyboardDidHide';

    const showSubscription = Keyboard.addListener(showEvent, keyboardWillShow);
    const hideSubscription = Keyboard.addListener(hideEvent, keyboardWillHide);

    return () => {
      showSubscription?.remove();
      hideSubscription?.remove();
    };
  }, [inputBottomAnim]);

  // Fetch both users' profile names
  useEffect(() => {
    let mounted = true;

    const loadNames = async () => {
      // My profile
      const myDoc = await getDoc(doc(db, 'users', myUid));
      const meEmail = user?.email ?? (myDoc.exists() ? (myDoc.data() as any).email : '');
      const meName = (myDoc.exists() ? (myDoc.data() as any).name : '') || emailToUsername(meEmail);
      if (mounted) setMyName(meName || 'Me');

      // Other profile
      const otherDoc = await getDoc(doc(db, 'users', otherUid));
      const otherEmail = otherDoc.exists() ? (otherDoc.data() as any).email : '';
      const oName = (otherDoc.exists() ? (otherDoc.data() as any).name : '') || emailToUsername(otherEmail) || 'User';
      if (mounted) setOtherName(oName);
    };

    loadNames();
    return () => { mounted = false; };
  }, [myUid, otherUid, user?.email]);

  useLayoutEffect(() => {
    navigation.setOptions({ title: otherName || 'Chat' });
  }, [navigation, otherName]);

  
  useEffect(() => {
    const convRef = doc(db, 'conversations', convoId);
    setDoc(
      convRef,
      { participants: [myUid, otherUid], updatedAt: serverTimestamp() },
      { merge: true }
    );
  }, [convoId, myUid, otherUid]);

  // Live messages
  useEffect(() => {
    const q = query(
      collection(db, 'conversations', convoId, 'messages'),
      orderBy('createdAt', 'desc'),
      limit(50)
    );
    const unsub = onSnapshot(q, (snap) => {
      const arr: Message[] = [];
      snap.forEach((d) => {
        const data = d.data() as Message;
        if (!data.createdAt) return; 
        arr.push({ id: d.id, ...data });
      });
      setMessages(arr);
    });
    return () => unsub();
  }, [convoId]);

  const send = async () => {
    const t = text.trim();
    if (!t || sending.current) return;
    sending.current = true;
    try {
      // add message
      await addDoc(collection(db, 'conversations', convoId, 'messages'), {
        text: t,
        createdAt: serverTimestamp(),
        uid: myUid,
        name: myName, 
      });

      
      await setDoc(
        doc(db, 'conversations', convoId),
        { lastMessage: t, lastMessageAt: serverTimestamp() },
        { merge: true }
      );

      setText('');
    } catch (e: any) {
      console.warn('send failed:', e.message);
    } finally {
      sending.current = false;
    }
  };

  const renderItem = ({ item }: { item: Message }) => {
    const mine = item.uid === myUid;
    const display = mine ? myName : otherName;
    return (
      <View style={[styles.messageContainer, mine ? styles.messageRight : styles.messageLeft]}>
        <View style={[styles.messageBubble, mine ? styles.bubbleMine : styles.bubbleOther]}>
          <Text style={[styles.senderName, mine ? styles.myName : styles.otherName]}>
            {display}
          </Text>
          <Text style={[styles.messageText, mine ? styles.myText : styles.otherText]}>
            {item.text}
          </Text>
          <Text style={styles.timeStamp}>
            {new Date(item.createdAt.seconds * 1000).toLocaleTimeString([], { 
              hour: '2-digit', 
              minute: '2-digit' 
            })}
          </Text>
        </View>
      </View>
    );
  };

  return (
    <SafeAreaView style={styles.screen}>
      <View style={[styles.messagesContainer, { marginBottom: keyboardHeight > 0 ? 0 : 80 }]}>
        <FlatList
          data={messages}
          keyExtractor={(item) => item.id!}
          renderItem={renderItem}
          inverted
          keyboardShouldPersistTaps="handled"
          showsVerticalScrollIndicator={false}
          contentContainerStyle={styles.messagesList}
        />
      </View>
      
      <Animated.View style={[styles.inputContainer, { bottom: inputBottomAnim }]}>
        <View style={styles.inputWrapper}>
          <TextInput
            value={text}
            onChangeText={setText}
            placeholder="Type a message…"
            style={styles.textInput}
            maxLength={2000}
            returnKeyType="send"
            onSubmitEditing={send}
            multiline
            placeholderTextColor="#94a3b8"
          />
          <TouchableOpacity 
            style={[styles.sendButton, text.trim() ? styles.sendButtonActive : styles.sendButtonInactive]} 
            onPress={send}
            disabled={!text.trim()}
          >
            <Text style={[styles.sendButtonText, text.trim() ? styles.sendTextActive : styles.sendTextInactive]}>
              Send
            </Text>
          </TouchableOpacity>
        </View>
      </Animated.View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  screen: { 
    flex: 1, 
    backgroundColor: '#f8fafc' 
  },
  messagesContainer: {
    flex: 1,
    paddingHorizontal: 16,
  },
  messagesList: {
    paddingTop: 16,
    paddingBottom: 16,
  },
  messageContainer: { 
    marginVertical: 4, 
    flexDirection: 'row',
    paddingHorizontal: 4,
  },
  messageLeft: { 
    justifyContent: 'flex-start' 
  },
  messageRight: { 
    justifyContent: 'flex-end' 
  },
  messageBubble: {
    maxWidth: '75%',
    paddingHorizontal: 16, 
    paddingVertical: 12, 
    borderRadius: 20,
    shadowColor: '#000', 
    shadowOpacity: 0.1, 
    shadowRadius: 6, 
    shadowOffset: { width: 0, height: 2 },
    elevation: 3,
  },
  bubbleMine: { 
    backgroundColor: '#4CAF50',
    borderBottomRightRadius: 6,
    marginLeft: 40,
  },
  bubbleOther: { 
    backgroundColor: '#fff',
    borderBottomLeftRadius: 6,
    marginRight: 40,
    borderWidth: 1,
    borderColor: '#e2e8f0',
  },
  senderName: { 
    fontSize: 12, 
    fontWeight: '600',
    marginBottom: 4,
    textTransform: 'capitalize',
  },
  myName: {
    color: '#dbeafe',
  },
  otherName: {
    color: '#64748b',
  },
  messageText: { 
    fontSize: 16, 
    lineHeight: 22,
  },
  myText: {
    color: '#ffffff',
  },
  otherText: {
    color: '#1e293b',
  },
  timeStamp: { 
    fontSize: 11, 
    marginTop: 6,
    fontWeight: '500',
  },
  inputContainer: {
    position: 'absolute',
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: '#fff',
    paddingHorizontal: 16,
    paddingVertical: 12,
    paddingBottom: 12,
    borderTopWidth: 1,
    borderTopColor: '#e2e8f0',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: -2 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 5,
  },
  inputWrapper: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    gap: 12,
  },
  textInput: {
    flex: 1,
    borderWidth: 1,
    borderColor: '#e2e8f0',
    borderRadius: 20,
    paddingHorizontal: 20,
    paddingVertical: 20,
    fontSize: 16,
    backgroundColor: '#f8fafc',
    maxHeight: 100,
    minHeight: 44,
  },
  sendButton: {
    borderRadius: 20,
    paddingHorizontal: 20,
    paddingVertical: 12,
    minWidth: 70,
    alignItems: 'center',
    justifyContent: 'center',
  },
  sendButtonActive: {
    backgroundColor: '#4CAF50',
  },
  sendButtonInactive: {
    backgroundColor: '#e2e8f0',
  },
  sendButtonText: {
    fontSize: 16,
    fontWeight: '700',
  },
  sendTextActive: {
    color: '#fff',
  },
  sendTextInactive: {
    color: '#94a3b8',
  },
});
