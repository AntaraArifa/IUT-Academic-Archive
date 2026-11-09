import React from 'react';
import { useNavigate } from 'react-router-dom';
import '../App.css';

const QuestionPage = () => {
  const navigate = useNavigate();

  const handleYes = () => {
    navigate('/login');  // Redirect to login page if the user has an account
  };

  const handleNo = () => {
    navigate('/registration');  // Redirect to registration page if the user does not have an account
  };

  return (
    <div className="container question-page">
      <h2>Do you have an account?</h2>
      <button onClick={handleYes}>Yes</button>
      <button onClick={handleNo}>No</button>
    </div>
  );
};

export default QuestionPage;
