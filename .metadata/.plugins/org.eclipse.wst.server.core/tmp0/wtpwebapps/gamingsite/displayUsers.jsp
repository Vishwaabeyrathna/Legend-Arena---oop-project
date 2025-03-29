<%@ page import="java.util.List" %>
<%@ page import="com.registration.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>User Management</h2>

    <%-- Display all users in a table --%>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Password</th>
                <th>User Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Retrieve the list of users passed from the servlet
                List<User> userList = (List<User>) request.getAttribute("userList");
                if (userList != null && !userList.isEmpty()) {
                    for (User user : userList) {
            %>
            <tr>
                <td><%= user.getUser_id() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getPassword() %></td>
                <td><%= user.getUser_role() %></td>
                <td>
                    <%-- Update and Delete buttons --%>
                    <a href="UpdateUser.jsp?user_id=<%= user.getUser_id() %>">Update</a> |
                    <a href="deleteuser?user_id=<%= user.getUser_id() %>"onclick="return confirm('Are you sure you want to delete this game?')">Delete</a>
                </td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="6">No users found</td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
    
</body>
</html>
