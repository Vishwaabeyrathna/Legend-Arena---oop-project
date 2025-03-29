package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.registration.DBCONNECT;

public class UserDAO {
    // Validate user credentials
    public User validateUser(String username, String password) throws Exception {
        String query = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try (Connection con = DBCONNECT.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password); // Use hashed password for real-world applications
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setName(rs.getString("name"));
                user.setUserRole(rs.getString("user_role"));
                return user; // User found
            }
        }
        return null; // User not found
    }
    
    public boolean emailExists(String email) throws Exception {
        String query = "SELECT * FROM Users WHERE email = ?";
        try (Connection con = DBCONNECT.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

    public void updateUserDetails(String email, String username, String password) throws Exception {
        String query = "UPDATE Users SET username = ?, password = ? WHERE email = ?";
        try (Connection con = DBCONNECT.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password); // Hash the password in real-world applications
            ps.setString(3, email);
            ps.executeUpdate();
        }
    }
}
