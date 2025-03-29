package com.favourites;

import com.registration.DBCONNECT;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FavoriteDAO {
    private static final String ADD_FAVORITE_QUERY = "INSERT IGNORE INTO Favorites (user_id, game_id) VALUES (?, ?)";
    private static final String GET_FAVORITES_BY_USER_QUERY = "SELECT game_id FROM Favorites WHERE user_id = ?";

    public void addFavorite(Favorite favorite) throws SQLException {
        try (Connection connection = DBCONNECT.getConnection();
             PreparedStatement stmt = connection.prepareStatement(ADD_FAVORITE_QUERY)) {

            // Set the parameters for the INSERT statement
            stmt.setInt(1, favorite.getUserId());
            stmt.setInt(2, favorite.getGameId());
            stmt.executeUpdate();
        }
    }

    public List<Integer> getFavoritesByUserId(int userId) throws SQLException {
        List<Integer> favoriteGames = new ArrayList<>();
        try (Connection connection = DBCONNECT.getConnection();
             PreparedStatement stmt = connection.prepareStatement(GET_FAVORITES_BY_USER_QUERY)) {

            // Set the user ID parameter
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    favoriteGames.add(rs.getInt("game_id"));
                }
            }
        }
        return favoriteGames;
    }
    
    public void removeFavorite(int userId, int gameId) throws SQLException {
        String removeFavoriteQuery = "DELETE FROM Favorites WHERE user_id = ? AND game_id = ?";
        try (Connection connection = DBCONNECT.getConnection();
             PreparedStatement stmt = connection.prepareStatement(removeFavoriteQuery)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, gameId);
            stmt.executeUpdate();
        }
    }

    
    
}
