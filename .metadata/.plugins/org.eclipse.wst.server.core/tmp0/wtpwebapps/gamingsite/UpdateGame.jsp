<%@ page import="com.addgame.Game" %>
<%@ page import="com.addgame.GameDAO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Game</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Update Game Details</h1>

<%-- Get the game ID from the request parameter --%>
<c:set var="game_id" value="${param.game_id}"/>

<%-- Fetch the game details using the game_id --%>
<%
    int id = Integer.parseInt(request.getParameter("game_id"));
    Game game = GameDAO.getGameById(id);
%>

<%-- Check if the game is found and populate the form with current data --%>
<% if (game != null) { %>

<!-- Display the game details in a form -->
<form action="updategame" method="POST">
    <input type="hidden" name="game_id" value="<%= game.getGame_id() %>">
    
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" value="<%= game.getTitle() %>" required><br><br>
    
    <label for="genre">Genre:</label>
    <input type="text" id="genre" name="genre" value="<%= game.getGenre() %>" required><br><br>
    
    <label for="description">Description:</label>
    <textarea id="description" name="description" required><%= game.getDescription() %></textarea><br><br>
    
    <label for="release_date">Release Date:</label>
    <input type="date" id="release_date" name="release_date" value="<%= game.getRelease_date() %>" required><br><br>
    
    <label for="developer">Developer:</label>
    <input type="text" id="developer" name="developer" value="<%= game.getDeveloper() %>" required><br><br>
    
    <label for="trailer_url">Trailer URL:</label>
    <input type="url" id="trailer_url" name="trailer_url" value="<%= game.getTrailer_url() %>"><br><br>
    
    <label for="cover_image_path">Cover Image Path:</label>
    <input type="text" id="cover_image_path" name="cover_image_path" value="<%= game.getCover_image_path() %>"><br><br>
    
    <input type="submit" value="Update Game">
</form>

<% } else { %>
    <p>Game not found.</p>
<% } %>

<a href="GameLibraryServlet">Back to Game Library</a>

</body>
</html>
