<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
         <link rel="stylesheet" href="CSS/userprofile.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
   
</head>
<body>
<jsp:include page="header.jsp" />

    <div class="container profile-container">
        <div class="profile-header">
            <img src="https://pbs.twimg.com/media/DYPzb6bWAAAdmk_.jpg" alt="User Picture" class="profile-picture">
            <h1 class="text-white">User Profile</h1>
        </div>
        <table class="table table-hover">
            <tbody>
                <tr>
                    <th scope="row">User ID:</th>
                    <td>${user.userId}</td>
                </tr>
                <tr>
                    <th scope="row">Name:</th>
                    <td>${user.name}</td>
                </tr>
                <tr>
                    <th scope="row">Username:</th>
                    <td>${user.username}</td>
                </tr>
                <tr>
                    <th scope="row">Email:</th>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th scope="row">Role:</th>
                    <td>${user.userRole}</td>
                </tr>
            </tbody>
        </table>
        <div class="text-center">
            <a href="logout.jsp" class="btn btn-custom mt-3">Logout</a>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
    

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
