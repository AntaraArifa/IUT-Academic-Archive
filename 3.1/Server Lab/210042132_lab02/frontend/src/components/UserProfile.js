import React, { useEffect, useState } from 'react';
import movies from '../movies.json';
import '../App.css';

const UserProfile = () => {
  const [statuses, setStatuses] = useState({});
  const [username, setUsername] = useState('');
  const [favoriteMovies, setFavoriteMovies] = useState([]); // State for favorite movies

  useEffect(() => {
    // Get the username from localStorage and convert to uppercase
    const storedUsername = localStorage.getItem('username') || 'Guest';
    setUsername(storedUsername.toUpperCase());

    // Get favorite movies for the specific user
    const favoriteMoviesKey = `favoriteMovies_${storedUsername}`;
    const favoriteMovieIds = JSON.parse(localStorage.getItem(favoriteMoviesKey)) || [];

    // Filter movies based on favorite movie IDs
    const favoriteMovieList = movies.filter((movie) => favoriteMovieIds.includes(movie.id.toString()));
    setFavoriteMovies(favoriteMovieList);

    // Get user's movie statuses from localStorage
    const movieStatusesKey = `movieStatuses_${storedUsername}`;
    const userStatuses = JSON.parse(localStorage.getItem(movieStatusesKey)) || {};
    setStatuses(userStatuses);
  }, []);

  return (
    <div className="user-profile">
      <h2>Welcome, {username}!</h2> {/* Display username in all caps */}

      <div className="movie-status-section">
        <h3>Favorite Movies</h3>
        <ul>
          {favoriteMovies.length > 0 ? (
            favoriteMovies.map((movie) => (
              <li key={movie.id}>{movie.name}</li>
            ))
          ) : (
            <p>No favorite movies yet. Go mark some as favorite!</p>
          )}
        </ul>
      </div>

      <div className="movie-status-section">
        <h3>Watched</h3>
        <ul>
          {movies.filter((movie) => statuses[movie.id] === 'Watched').map((movie) => (
            <li key={movie.id}>{movie.name}</li>
          ))}
        </ul>
      </div>

      <div className="movie-status-section">
        <h3>Watching</h3>
        <ul>
          {movies.filter((movie) => statuses[movie.id] === 'Watching').map((movie) => (
            <li key={movie.id}>{movie.name}</li>
          ))}
        </ul>
      </div>

      <div className="movie-status-section">
        <h3>Wishlist</h3>
        <ul>
          {movies.filter((movie) => statuses[movie.id] === 'Wishlist').map((movie) => (
            <li key={movie.id}>{movie.name}</li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default UserProfile;
