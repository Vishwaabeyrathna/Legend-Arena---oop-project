package com.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve user_id parameter
            String userIdStr = request.getParameter("user_id");

            // Validate if user_id is not null or empty
            if (userIdStr != null && !userIdStr.isEmpty()) {
                int user_id = Integer.parseInt(userIdStr); // Parse user_id

                // Retrieve other form data
                String name = request.getParameter("name");
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String user_role = request.getParameter("user_role");

                // Update the user in the database
                boolean isUpdated = UserDAO.updateUser(user_id, name, username, email, password, user_role);

                // Redirect based on update result
                if (isUpdated) {
                    response.sendRedirect("DisplayUsersServlet");  // Redirect to the users display page
                } else {
                    response.sendRedirect("error.jsp");  // Redirect to error page
                }
            } else {
                // If user_id is invalid, redirect to error page
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format for user_id
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
