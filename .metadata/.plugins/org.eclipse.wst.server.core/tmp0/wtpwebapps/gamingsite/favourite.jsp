<%@ page import="java.util.*, com.favourites.FavoriteDAO, com.favourites.Favorite, com.addgame.GameDAO, com.addgame.Game" %>
<%   

// Use a different variable name to avoid conflict with the implicit session object
HttpSession userSession = request.getSession();
Integer userId = (Integer) userSession.getAttribute("user_id");

    if (userId == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if the user is not authenticated
        return;
    }

    // Get the list of game IDs from the favorites table for the logged-in user
    FavoriteDAO favoriteDAO = new FavoriteDAO();
    List<Integer> favoriteGameIds = favoriteDAO.getFavoritesByUserId(userId);

    // Fetch game details for each favorite game
    List<Game> favoriteGames = new ArrayList<>();
    GameDAO gameDAO = new GameDAO();
    for (Integer gameId : favoriteGameIds) {
        Game game = gameDAO.getGameById(gameId);
        if (game != null) {
            favoriteGames.add(game);
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Favorite Games</title>
        <link rel="stylesheet" href="CSS/favourite.css">
   
</head>
<body>
<jsp:include page="header.jsp" />

<div class="fav-container">
    <h1 class="fav-page-title">Your Favorite Games</h1>

    <% if (favoriteGames.isEmpty()) { %>
        <div class="fav-no-favorites">You have no favorite games yet.</div>
    <% } else { %>
        <div class="fav-card-container">
            <% for (Game game : favoriteGames) { %>
                <div class="fav-game-card">
                    <img src="<%= game.getCover_image_path() %>" alt="<%= game.getTitle() %>">
                    <h3><%= game.getTitle() %></h3>
                    <p><%= game.getGenre() %></p>
                    <form action="removefavorite" method="POST">
                        <input type="hidden" name="game_id" value="<%= game.getGame_id() %>">
                        <button type="submit" class="fav-remove-btn">Remove from Favorites</button>
                    </form>
                    <form action="gameDetails" method="GET">
                        <input type="hidden" name="game_id" value="<%= game.getGame_id() %>">
                        <button type="submit" class="fav-view-details-btn">View Details</button>
                    </form>
                </div>
            <% } %>
        </div>
    <% } %>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
