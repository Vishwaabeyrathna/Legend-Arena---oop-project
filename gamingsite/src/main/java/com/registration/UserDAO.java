package com.registration;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // Register a new user
    public static boolean registerUser(String name, String username, String email, String password, String user_role) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try { 
            // Establish a database connection
            con = DBCONNECT.getConnection();

            // SQL query for inserting a new user
            String sql = "INSERT INTO users (name, username, email, password, user_role) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            // Set query parameters
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, user_role);

            // Execute the query
            int result = pstmt.executeUpdate();
            isSuccess = result > 0; // Check if the insertion was successful
        } catch (Exception e) {
            e.printStackTrace(); // Log any errors
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }
    
    

    // Fetch user details by ID
    public static List<User> getCustomerDetails(String USER_ID) {
        List<User> users = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Convert USER_ID to an integer
            int convertedID = Integer.parseInt(USER_ID);

            // Establish a database connection
            con = DBCONNECT.getConnection();

            // SQL query to fetch user details
            String sql = "SELECT * FROM users WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convertedID);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                int user_id = rs.getInt("id");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String user_role = rs.getString("user_role");

                // Create a User object and add it to the list
                User user = new User(user_id, name, username, email, password, user_role);
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log any errors
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return users;
    }
    
    
    
    public static boolean updateUser(int user_id, String name, String username, String email, String password, String user_role) {
        boolean isUpdated = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            // Establish a database connection
            con = DBCONNECT.getConnection();

            // SQL query for updating a user's details
            String sql = "UPDATE users SET name = ?, username = ?, email = ?, password = ?, user_role = ? WHERE user_id = ?";
            pstmt = con.prepareStatement(sql);

            // Set query parameters
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, user_role);
            pstmt.setInt(6, user_id);

            // Execute the query
            int rows = pstmt.executeUpdate();
            isUpdated = rows > 0; // Check if the update was successful
        } catch (Exception e) {
            e.printStackTrace(); // Log any errors
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isUpdated;
    }

    public static boolean deleteUserById(int userId) {
        boolean isDeleted = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBCONNECT.getConnection();
            String sql = "DELETE FROM users WHERE user_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, userId);

            int rows = pstmt.executeUpdate();
            isDeleted = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isDeleted;
    }
    


        // Fetch all users from the database
        public static List<User> getAllUsers() {
            List<User> users = new ArrayList<>();
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // Establish a database connection
                con = DBCONNECT.getConnection();

                // SQL query to fetch all users
                String sql = "SELECT * FROM users";
                pstmt = con.prepareStatement(sql);

                // Execute the query
                rs = pstmt.executeQuery();

                // Process the result set
                while (rs.next()) {
                    int user_id = rs.getInt("user_id");
                    String name = rs.getString("name");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String user_role = rs.getString("user_role");

                    // Create a User object and add it to the list
                    User user = new User(user_id, name, username, email, password, user_role);
                    users.add(user);
                }
            } catch (Exception e) {
                e.printStackTrace(); // Log any errors
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            return users;
        }
        
        public static User getUserById(int userId) {
            User user = null;
            try {
                Connection con = DBCONNECT.getConnection();
                String query = "SELECT * FROM users WHERE user_id = ?";
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setInt(1, userId);
                
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    user = new User(
                        rs.getInt("user_id"),
                        rs.getString("name"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("user_role")
                    );
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return user;
        }
        
        public static boolean checkUserExists(String username, String email) {
            boolean exists = false;
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                con = DBCONNECT.getConnection();
                String sql = "SELECT * FROM users WHERE username = ? OR email = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, email);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    exists = true; // A user with the given username or email already exists
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            return exists;
        }


    }



