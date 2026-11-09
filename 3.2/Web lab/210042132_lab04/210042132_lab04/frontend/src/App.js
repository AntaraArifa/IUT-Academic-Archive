// src/App.js
import React, { useState } from 'react';
import UserForm from './components/UserForm';
import UserList from './components/UserList';
import { createUser, updateUser } from './api'
import './App.css';


function App() {
  const [editingUser, setEditingUser] = useState(null);

  const handleSubmit = async (user) => {
    if (editingUser) {
      await updateUser(editingUser._id, user);
      setEditingUser(null);
    } else {
      await createUser(user);
    }
    window.location.reload(); // Or better: re-fetch users using state
  };

  return (
    <div>
      <h1>User Management</h1>
      <UserForm onSubmit={handleSubmit} editingUser={editingUser} onCancel={() => setEditingUser(null)} />
      <UserList onEdit={setEditingUser} />
    </div>
  );
}

export default App;
