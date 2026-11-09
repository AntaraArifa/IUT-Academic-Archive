import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import '../App.css';

const Registration = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState('');
  const navigate = useNavigate();

  const handleRegister = () => {
    axios.post('http://localhost:5000/api/register', { username, password })
      .then(() => {
        setMessage('Successfully registered!');
      })
      .catch(() => {
        setMessage('Registration failed. Try again.');
      });
  };

  const handleLoginRedirect = () => {
    navigate('/login');
  };

  return (
    <div>
      <h2>Register</h2>
      <input
        type="text"
        placeholder="Username"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
      />
      <input
        type="password"
        placeholder="Password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />
      <button onClick={handleRegister}>Register</button>
      {message && <p>{message}</p>}
      {message === 'Successfully registered!' && (
        <button onClick={handleLoginRedirect}>Go to Login</button>
      )}
    </div>
  );
};

export default Registration;
