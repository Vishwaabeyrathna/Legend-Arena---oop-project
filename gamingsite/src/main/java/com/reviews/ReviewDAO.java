package com.reviews;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.registration.DBCONNECT;

public class ReviewDAO {

    public List<Review> getReviewsByGameId(int gameId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.review_id, r.user_id, r.rating, r.comment, r.created_at, u.name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "WHERE r.game_id = ?";
        try (Connection conn = DBCONNECT.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, gameId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Review review = new Review();
                    review.setReviewId(rs.getInt("review_id"));
                    review.setUserId(rs.getInt("user_id"));
                    review.setUserName(rs.getString("name"));
                    review.setRating(rs.getDouble("rating"));
                    review.setComment(rs.getString("comment"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    reviews.add(review);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching reviews by game ID: " + e.getMessage());
            e.printStackTrace();
        }
        return reviews;
    }

    public boolean insertReview(Review review) {
        String sql = "INSERT INTO reviews (user_id, game_id, rating, comment) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBCONNECT.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, review.getUserId());
            stmt.setInt(2, review.getGameId());
            stmt.setDouble(3, review.getRating());
            stmt.setString(4, review.getComment());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error inserting review: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateReview(Review review) {
        String sql = "UPDATE reviews SET rating = ?, comment = ? WHERE review_id = ?";
        try (Connection conn = DBCONNECT.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDouble(1, review.getRating());
            stmt.setString(2, review.getComment());
            stmt.setInt(3, review.getReviewId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error updating review: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteReview(int reviewId) {
        String sql = "DELETE FROM reviews WHERE review_id = ?";
        try (Connection conn = DBCONNECT.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, reviewId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting review: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        String query = "SELECT r.review_id, r.user_id, r.rating, r.comment, r.created_at, u.name AS user_name " +
                       "FROM reviews r " +
                       "JOIN users u ON r.user_id = u.user_id"; // Assuming you're joining the 'users' table to get the user name

        try (Connection conn = DBCONNECT.getConnection();
             PreparedStatement statement = conn.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Review review = new Review();
                review.setReviewId(resultSet.getInt("review_id"));
                review.setUserId(resultSet.getInt("user_id"));
                review.setRating(resultSet.getInt("rating"));
                review.setComment(resultSet.getString("comment"));
                review.setCreatedAt(resultSet.getTimestamp("created_at"));// Formatting if necessary
                review.setUserName(resultSet.getString("user_name"));  // Setting user name from the joined table
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }


}
