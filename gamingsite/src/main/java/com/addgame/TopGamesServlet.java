package com.addgame;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/TopGamesServlet")
public class TopGamesServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch top-rated games using the DAO
		List<Game> topRatedGames = GameDAO.getTopRatedGames();

        // Set games as request attribute
		request.setAttribute("topGames", topRatedGames);

        // Forward to the JSP
        request.getRequestDispatcher("Homepage.jsp").forward(request, response);
    }
}
