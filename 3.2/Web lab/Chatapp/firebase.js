import { initializeApp } from 'firebase/app';
import { initializeAuth, getReactNativePersistence } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';
import AsyncStorage from '@react-native-async-storage/async-storage';

const firebaseConfig = {
  apiKey: "AIzaSyB4hEhjTYDu8RqxO-a_0bCrhVwu6zFyopQ",
  authDomain: "chatapp-5a960.firebaseapp.com",
  projectId: "chatapp-5a960",
  storageBucket: "chatapp-5a960.firebasestorage.app",
  messagingSenderId: "14753808828",
  appId: "1:14753808828:web:5cb8751dee852638c2ebb9"
};


const app = initializeApp(firebaseConfig);

const auth = initializeAuth(app, {
  persistence: getReactNativePersistence(AsyncStorage),
});

const db = getFirestore(app);

export { app, auth, db };
