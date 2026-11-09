import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
import "../App.css";

const MoviePage = () => {
  const { id } = useParams(); // Get the movie ID from the route
  const [movie, setMovie] = useState(null); // State for movie details
  const [reviews, setReviews] = useState([]); // State for reviews
  const [newReview, setNewReview] = useState(""); // State for new review
  const [isFavorite, setIsFavorite] = useState(false); // State for favorite status
  const [movieStatus, setMovieStatus] = useState(""); // State for the selected movie status
  const username = localStorage.getItem("username"); // Get the logged-in username

  useEffect(() => {
    // Fetch movie details by ID
    axios
      .get(`http://localhost:5000/api/movies`)
      .then((response) => {
        const selectedMovie = response.data.find(
          (movie) => movie.id === parseInt(id)
        );
        setMovie(selectedMovie);

        // Check if the movie is already in the user's favorites
        const favoriteMovies =
          JSON.parse(localStorage.getItem(`favoriteMovies_${username}`)) || [];
        if (favoriteMovies.includes(id)) {
          setIsFavorite(true);
        }

        // Fetch the current status for this movie
        const movieStatuses =
          JSON.parse(localStorage.getItem(`movieStatuses_${username}`)) || {};
        if (movieStatuses[id]) {
          setMovieStatus(movieStatuses[id]);
        }
      })
      .catch((error) => console.error("Error fetching movie:", error));

    // Fetch reviews for the movie
    axios
      .get(`http://localhost:5000/api/reviews/${id}`)
      .then((response) => {
        setReviews(response.data); // Set the reviews to state
      })
      .catch((error) => console.error("Error fetching reviews:", error));
  }, [id, username]);

  // Handle review submission
  const handleReviewSubmit = () => {
    // Check if the review is not empty
    if (newReview.trim() === "") {
      alert("Please write a review before submitting.");
      return;
    }

    // Post the review to the backend
    axios
      .post("http://localhost:5000/api/review", {
        movieId: id.toString(),
        review: newReview,
        username,
      })
      .then(() => {
        // Add the new review to the state to display it immediately
        setReviews([
          ...reviews,
          { movieId: id.toString(), review: newReview, username },
        ]);
        setNewReview(""); // Clear the textarea
      })
      .catch((error) => console.error("Error submitting review:", error));
  };

  // Handle adding the movie to favorites
  const handleAddToFavorites = () => {
    const favoriteMoviesKey = `favoriteMovies_${username}`; // Key for storing favorite movies for this user
    let favoriteMovies =
      JSON.parse(localStorage.getItem(favoriteMoviesKey)) || [];

    if (!favoriteMovies.includes(id)) {
      favoriteMovies.push(id); // Add the movie to the favorites
      localStorage.setItem(favoriteMoviesKey, JSON.stringify(favoriteMovies));
      setIsFavorite(true); // Mark as favorite
    }
  };

  // Handle movie status change
  const handleStatusChange = (e) => {
    const selectedStatus = e.target.value;
    setMovieStatus(selectedStatus);

    // Save the status in localStorage for this user
    const movieStatusesKey = `movieStatuses_${username}`;
    let movieStatuses =
      JSON.parse(localStorage.getItem(movieStatusesKey)) || {};
    movieStatuses[id] = selectedStatus; // Update the status of the current movie
    localStorage.setItem(movieStatusesKey, JSON.stringify(movieStatuses));
  };

  // If movie details are still being loaded
  if (!movie) return <div>Loading...</div>;

  return (
    <div className="movie-page-container">
      <div className="movie-details-wrapper">
        <h2>{movie.name}</h2>
        <p>{movie.description}</p>

        {/* Button to add the movie to the user's favorite list */}
        <button onClick={handleAddToFavorites} className="favorite-button">
          {isFavorite ? "Marked as Favorite" : "Mark as Favorite"}
        </button>

        {/* Dropdown to select movie status */}
        <div className="movie-status-container">
          <label htmlFor="movie-status">Movie Status:</label>
          <select
            className="movie-status-dropdown"
            value={movieStatus}
            onChange={handleStatusChange}
          >
            <option value="">-- Select Status --</option>
            <option value="Watched">Watched</option>
            <option value="Watching">Watching</option>
            <option value="Wishlist">Wishlist</option>
          </select>
        </div>

        <h3>Reviews:</h3>
        <ul className="review-list-container">
          {reviews.length > 0 ? (
            reviews.map((review, index) => (
              <li key={index}>
                <strong>{review.username}:</strong> {review.review}
              </li>
            ))
          ) : (
            <p>No reviews yet. Be the first to review this movie!</p>
          )}
        </ul>

        <div className="review-form">
          <h3>Submit a Review:</h3>
          <textarea
            placeholder="Write your review here..."
            value={newReview}
            onChange={(e) => setNewReview(e.target.value)}
          />
          <button onClick={handleReviewSubmit}>Submit Review</button>
        </div>
      </div>
    </div>
  );
};

export default MoviePage;
