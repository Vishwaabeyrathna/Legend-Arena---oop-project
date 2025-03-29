package com.addgame;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;
import com.registration.DBCONNECT;

public class GameDAO {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Method to add a new game to the database
    public static boolean addgame(String title, String genre, String description, String release_date, String developer, String trailer_url, String cover_image_path) {
        boolean isSuccess = false;

        try {
            con = DBCONNECT.getConnection();
            String sql = "INSERT INTO games (title, genre, description, release_date, developer, trailer_url, cover_image_path) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, genre);
            pstmt.setString(3, description);
            pstmt.setString(4, release_date);
            pstmt.setString(5, developer);
            pstmt.setString(6, trailer_url);
            pstmt.setString(7, cover_image_path);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                isSuccess = true;
            }
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }

    // Method to retrieve all games
    public static List<Game> getAllGames() {
        List<Game> games = new ArrayList<>();
        try {
            con = DBCONNECT.getConnection();
            stmt = con.createStatement();
            String query = "SELECT * FROM games";
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                int game_id = rs.getInt("game_id");
                String title = rs.getString("title");
                String genre = rs.getString("genre");
                String description = rs.getString("description");
                String release_date = rs.getString("release_date");
                String developer = rs.getString("developer");
                String trailer_url = rs.getString("trailer_url");
                String cover_image_path = rs.getString("cover_image_path");

                games.add(new Game(game_id, title, genre, description, release_date, developer, trailer_url, cover_image_path));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return games;
    }

    // Method to get a game by game_id
    public static Game getGameById(int game_id) {
        Game game = null;
        try {
            con = DBCONNECT.getConnection();
            String sql = "SELECT * FROM games WHERE game_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, game_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                String genre = rs.getString("genre");
                String description = rs.getString("description");
                String release_date = rs.getString("release_date");
                String developer = rs.getString("developer");
                String trailer_url = rs.getString("trailer_url");
                String cover_image_path = rs.getString("cover_image_path");

                game = new Game(game_id, title, genre, description, release_date, developer, trailer_url, cover_image_path);
            }
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return game;
    }
    
    public static boolean updateGame(int game_id, String title, String genre, String description, String release_date, String developer, String trailer_url, String cover_image_path) {
        boolean isSuccess = false;

        try {
            con = DBCONNECT.getConnection();
            String sql = "UPDATE games SET title = ?, genre = ?, description = ?, release_date = ?, developer = ?, trailer_url = ?, cover_image_path = ? WHERE game_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, genre);
            pstmt.setString(3, description);
            pstmt.setString(4, release_date);
            pstmt.setString(5, developer);
            pstmt.setString(6, trailer_url);
            pstmt.setString(7, cover_image_path);
            pstmt.setInt(8, game_id);

            int rows = pstmt.executeUpdate();
            isSuccess = rows > 0;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }

    public static boolean deleteGame(int game_id) {
        boolean isSuccess = false;

        try {
            con = DBCONNECT.getConnection();
            String sql = "DELETE FROM games WHERE game_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, game_id);

            int rows = pstmt.executeUpdate();
            isSuccess = rows > 0;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }
    public static double getMedianRatingByGameId(int game_id) {
        List<Integer> ratings = new ArrayList<>();

        String sql = "SELECT rating FROM reviews WHERE game_id = ?";

        try (Connection conn = DBCONNECT.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, game_id);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ratings.add(rs.getInt("rating"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching ratings: " + e.getMessage());
            e.printStackTrace();
        }

        if (ratings.isEmpty()) {
            return 0; // No reviews
        }

        // Sort ratings and calculate median
        ratings.sort(Integer::compareTo);
        int size = ratings.size();
        if (size % 2 == 0) {
            return (ratings.get(size / 2 - 1) + ratings.get(size / 2)) / 2;
        } else {
            return ratings.get(size / 2);
        }
    }

    public static List<Game> getTopRatedGames() {
        List<Game> games = new ArrayList<>();
        String sql = """
            SELECT g.game_id, g.title, g.genre, g.description, g.release_date, g.developer, g.trailer_url, g.cover_image_path
            FROM games g
            JOIN (
                SELECT game_id, AVG(rating) AS avg_rating
                FROM reviews
                GROUP BY game_id
                HAVING avg_rating BETWEEN 8 AND 10
            ) r ON g.game_id = r.game_id
        """;

        try (Connection con = DBCONNECT.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int gameId = rs.getInt("game_id");
                String title = rs.getString("title");
                String genre = rs.getString("genre");
                String description = rs.getString("description");
                String release_date = rs.getString("release_date");
                String developer = rs.getString("developer");
                String trailer_url = rs.getString("trailer_url");
                String cover_image_path = rs.getString("cover_image_path");

                // Fetch the median rating for this game
                double medianRating = getMedianRatingByGameId(gameId);

                // Create a Game object
                Game game = new Game(gameId, title, genre, description, release_date, developer, trailer_url, cover_image_path);

                // Set the median rating for the game
                game.setMedianRating(medianRating);

                // Add the game to the list
                games.add(game);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching top-rated games: " + e.getMessage());
            e.printStackTrace();
        }

        return games;
    }



    
    
   

}
