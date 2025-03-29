package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.registration.DBCONNECT;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Password match validation
        if (!password.equals(confirmPassword)) {
            response.getWriter().write("<script>alert('Passwords do not match.'); window.history.back();</script>");
            return;
        }

        // Check email existence and update username/password
        try (Connection connection = DBCONNECT.getConnection()) {
            String selectQuery = "SELECT * FROM Users WHERE email = ?";
            String updateQuery = "UPDATE Users SET username = ?, password = ? WHERE email = ?";

            try (PreparedStatement selectStmt = connection.prepareStatement(selectQuery)) {
                selectStmt.setString(1, email);
                ResultSet rs = selectStmt.executeQuery();

                if (rs.next()) {
                    try (PreparedStatement updateStmt = connection.prepareStatement(updateQuery)) {
                        updateStmt.setString(1, username);
                        updateStmt.setString(2, password); // Hash password in real-world applications
                        updateStmt.setString(3, email);

                        updateStmt.executeUpdate();
                        response.getWriter().write("<script>alert('Details updated successfully!'); window.location='login.jsp';</script>");
                    }
                } else {
                    response.getWriter().write("<script>alert('Email not found. Please try again.'); window.history.back();</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("<script>alert('An error occurred. Please try again later.'); window.history.back();</script>");
        }
    }
}
