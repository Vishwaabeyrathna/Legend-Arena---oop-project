package com.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        if (userDAO == null) {
            throw new ServletException("UserDAO initialization failed.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Validate user credentials
            User user = userDAO.validateUser(username, password);
            if (user != null) {
                // Check if the user is an admin
                if ("admin".equals(user.getUserRole())) {
                    // Admin user: Redirect to admin dashboard
                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", user.getUserId());
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("name", user.getName());
                    session.setAttribute("role", "admin");

                    response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
                } else {
                    // Regular user: Redirect to homepage
                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", user.getUserId());
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("name", user.getName());

                    response.sendRedirect(request.getContextPath() + "/Homepage");
                }
            } else {
                // Login failed: Redirect to login page with error message
                response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid");
            }
        } catch (Exception e) {
            // Log error for debugging (use a logging framework in real applications)
            e.printStackTrace();

            // Redirect to a generic error page
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
