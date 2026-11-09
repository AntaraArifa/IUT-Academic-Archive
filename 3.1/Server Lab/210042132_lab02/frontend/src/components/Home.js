import React, { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom'; // Import useNavigate for navigation
import axios from 'axios';
import '../App.css';

// Available tags based on the genres from the movie list
const tags = ['Action', 'Sci-Fi', 'Romance', 'Drama', 'Crime', 'Adventure', 'Fantasy'];

const Home = () => {
  const [movies, setMovies] = useState([]);
  const [filteredMovies, setFilteredMovies] = useState([]);
  const [selectedTag, setSelectedTag] = useState(''); // State for selected tag
  const navigate = useNavigate(); // For navigation to profile page

  useEffect(() => {
    // Fetch movies from the backend
    axios
      .get('http://localhost:5000/api/movies') // Replace with your backend API route if needed
      .then((response) => {
        setMovies(response.data);
        setFilteredMovies(response.data); // Initially show all movies
      })
      .catch((error) => {
        console.error('Error fetching movies:', error);
      });
  }, []);

  const handleTagChange = (e) => {
    setSelectedTag(e.target.value); // Update the selected tag when user selects from dropdown
  };

  const handleFilter = () => {
    if (selectedTag) {
      const filtered = movies.filter((movie) =>
        movie.genres.includes(selectedTag)
      );
      setFilteredMovies(filtered); // Filter movies by the selected tag
    } else {
      setFilteredMovies(movies); // Show all movies if no tag is selected
    }
  };

  // Navigate to the UserProfile page
  const handleProfileClick = () => {
    navigate('/profile');
  };

  return (
    <div className="home-container">
      <h2>Welcome to MovieHub!</h2>
      <p>Select a movie to view details and post reviews.</p>

      {/* See Profile Button */}
      <button className="profile-button" onClick={handleProfileClick}>
        See Profile
      </button>

      {/* Dropdown for selecting tags */}
      <div className="filter-container">
        <select value={selectedTag} onChange={handleTagChange}>
          <option value="">-- Select a Tag --</option>
          {tags.map((tag, index) => (
            <option key={index} value={tag}>
              {tag}
            </option>
          ))}
        </select>
        <button onClick={handleFilter} className="filter-button">
          Filter Movies
        </button>
      </div>

      {/* Filtered Movie List */}
      <ul className="movie-list">
        {filteredMovies.map((movie) => (
          <li key={movie.id}>
            <img src={movie.image} alt={movie.name} className="movie-image" />
            <div className="movie-details">
              <Link to={`/movies/${movie.id}`}>
                {movie.name}
              </Link>{' '}
              - {movie.genres.join(', ')}
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Home;
