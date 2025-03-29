package com.userprofile;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.registration.DBCONNECT;

public class UserDAO {
    // Validate user credentials (already implemented)

    // Fetch user details by user_id
    public User getUserById(int userId) throws Exception {
        String query = "SELECT * FROM Users WHERE user_id = ?";
        try (Connection con = DBCONNECT.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setUserRole(rs.getString("user_role"));
                return user;
            }
        }
        return null; // User not found
    }
}
