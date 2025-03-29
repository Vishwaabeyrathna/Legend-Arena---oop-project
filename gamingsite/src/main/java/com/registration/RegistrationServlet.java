package com.registration;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Retrieve form data
	    String name = request.getParameter("name");
	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String user_role = request.getParameter("user_role");

	    // Check if the username or email already exists
	    if (UserDAO.checkUserExists(username, email)) {
	        request.setAttribute("errorMessage", "Username or email already exists. Please choose a different one.");
	        RequestDispatcher dispatcher = request.getRequestDispatcher("Registration.jsp");
	        dispatcher.forward(request, response);
	    } else {
	        // Call the UserDAO to register the user
	        boolean isTrue = UserDAO.registerUser(name, username, email, password, user_role);

	        if (isTrue) {
	            request.setAttribute("name", name);
	            request.setAttribute("username", username);
	            request.setAttribute("email", email);
	            request.setAttribute("password", password);
	            request.setAttribute("user_role", user_role);
	            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
	            dis.forward(request, response);
	        } else {
	            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
	            dis2.forward(request, response);
	        }
	    }
	}}




