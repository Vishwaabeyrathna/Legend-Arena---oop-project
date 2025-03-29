package com.userprofile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserProfileServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Fetch existing session

        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        try {
            User user = userDAO.getUserById(userId);
            if (user != null) {
                request.setAttribute("user", user); // Add user details to the request
                RequestDispatcher dispatcher = request.getRequestDispatcher("userprofile.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("error.jsp"); // Redirect to error page if user not found
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
