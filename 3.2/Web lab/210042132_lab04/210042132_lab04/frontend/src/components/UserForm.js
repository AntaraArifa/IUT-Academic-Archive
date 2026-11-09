// src/components/UserForm.js
import React, { useState, useEffect } from 'react';

const deptOptions = ['CSE', 'EEE'];

export default function UserForm({ onSubmit, editingUser, onCancel }) {
  const [form, setForm] = useState({
    name: '',
    email: '',
    password: '',
    department: 'CSE',
  });

  useEffect(() => {
    if (editingUser) {
      setForm({ ...editingUser, password: '' });
    }
  }, [editingUser]);

  const handleChange = e => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = e => {
    e.preventDefault();
    onSubmit(form);
    if (!editingUser) setForm({ name: '', email: '', password: '', department: 'CSE' });
  };

  return (
    <form onSubmit={handleSubmit}>
      <input name="name" value={form.name} onChange={handleChange} placeholder="Name" required />
      <input name="email" value={form.email} onChange={handleChange} placeholder="Email" required />
      <input name="password" value={form.password} onChange={handleChange} placeholder="Password" type="password" required={!editingUser} />
      <select name="department" value={form.department} onChange={handleChange}>
        {deptOptions.map(d => <option key={d} value={d}>{d}</option>)}
      </select>
      <button type="submit">{editingUser ? 'Update' : 'Create'}</button>
      {editingUser && <button type="button" onClick={onCancel}>Cancel</button>}
    </form>
  );
}
