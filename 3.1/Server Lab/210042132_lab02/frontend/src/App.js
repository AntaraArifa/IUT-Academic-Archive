import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import QuestionPage from './components/QuestionPage';
import Registration from './components/Registration';
import Login from './components/Login';
import Home from './components/Home';
import MoviePage from './components/MoviePage';
import UserProfile from './components/UserProfile';

const PrivateRoute = ({ element: Element, ...rest }) => {
  const isLoggedIn = !!localStorage.getItem('username');  // Check if the user is logged in
  return isLoggedIn ? <Element {...rest} /> : <Navigate to="/login" />;
};

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <h1>MovieHub</h1> {/* Application Title */}
        </header>

        <Routes>
          {/* Default route redirects to QuestionPage */}
          <Route path="/" element={<QuestionPage />} />

          {/* Registration Page */}
          <Route path="/registration" element={<Registration />} />

          {/* Login Page */}
          <Route path="/login" element={<Login />} />

          {/* Home Page after login */}
          <Route path="/home" element={<PrivateRoute element={Home} />} />

          {/* Movie Page to view details and reviews */}
          <Route path="/movies/:id" element={<PrivateRoute element={MoviePage} />} />

          {/* Profile Page */}
          <Route path="/profile" element={<PrivateRoute element={UserProfile} />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
