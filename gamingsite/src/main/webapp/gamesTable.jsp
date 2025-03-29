<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Library</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="CSS/gamesTable.css">
    
    
</head>
<body>
<jsp:include page="header.jsp" />
    <div class="container table-wrapper">
        <h2>Game Library</h2>
        <table class="table table-dark table-striped table-hover">
            <thead>
                <tr>
                    <th>Game ID</th>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Description</th>
                    <th>Release Date</th>
                    <th>Developer</th>
                    <th>Trailer</th>
                    <th>Cover</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="game" items="${games}">
                    <tr>
                        <td>${game.game_id}</td>
                        <td>${game.title}</td>
                        <td>${game.genre}</td>
                        <td>${game.description}</td>
                        <td>${game.release_date}</td>
                        <td>${game.developer}</td>
                        <td><a href="${game.trailer_url}" target="_blank" class="btn btn-link">Watch</a></td>
                        <td>
                            <img src="${game.cover_image_path}" alt="Cover Image" class="cover-img">
                        </td>
                        <td class="action-links">
                            <a href="UpdateGame.jsp?game_id=${game.game_id}" class="btn btn-sm btn-warning">Update</a>
                            <br>
                            <a href="deletegame?game_id=${game.game_id}" class="btn btn-sm btn-danger"
                               onclick="return confirm('Are you sure you want to delete this game?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <br>
<jsp:include page="footer.jsp" />
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
