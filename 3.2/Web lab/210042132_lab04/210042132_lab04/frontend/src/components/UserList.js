// src/components/UserList.js
import React, { useEffect, useState } from 'react';
import { getUsers, deleteUser } from '../api';

export default function UserList({ onEdit }) {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    refresh();
  }, []);

  function refresh() {
    getUsers().then(res => setUsers(res.data));
  }

  function handleDelete(id) {
    if (window.confirm('Delete this user?')) {
      deleteUser(id).then(refresh);
    }
  }

  return (
    <div>
      <h2>User List</h2>
      <table border="1" cellPadding="6">
        <thead>
          <tr>
            <th>Name</th><th>Email</th><th>Department</th><th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {users.map(u => (
            <tr key={u._id}>
              <td>{u.name}</td>
              <td>{u.email}</td>
              <td>{u.department}</td>
              <td>
                <button onClick={() => onEdit(u)}>Edit</button>
                <button onClick={() => handleDelete(u._id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
