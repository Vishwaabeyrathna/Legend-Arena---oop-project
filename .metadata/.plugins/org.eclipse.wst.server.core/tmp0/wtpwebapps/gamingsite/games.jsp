<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Library</title>
     <link rel="stylesheet" href="CSS/games.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<jsp:include page="header.jsp" />
    <div class="container mt-5">
        <h1 class="text-center mb-4">Game Library</h1>
        <div class="row mt-4">
            <!-- Loop through games and display them as cards -->
            <c:forEach var="game" items="${games}">
                <div class="col-md-4 mb-4">
                    <div class="card game-card">
                        <img src="${game.cover_image_path}" class="card-img-top" alt="${game.title}">
                        <div class="card-body">
                            <h5 class="card-title">${game.title}</h5>
                            <h6 class="card-subtitle">${game.genre}</h6>
                            
                            <br>
                           
                            <div class="card-buttons">
                                <!-- Add to Cart button -->
                                <!-- Example Add to Cart button -->
<form action="addtocart" method="POST">
    <input type="hidden" name="game_id" value="${game.game_id}">

    <button type="submit" class="btn btn-primary">Add to Favorites</button>
</form>
             
                                <!-- View Details button on the right -->
                                <form action="gameDetails" method="GET">
                                    <input type="hidden" name="game_id" value="${game.game_id}"> <!-- Updated parameter name -->
                                    <button type="submit" class="btn btn-secondary">View Details</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
<jsp:include page="footer.jsp" />
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
