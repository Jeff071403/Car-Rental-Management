<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }
    .container {
        width: 60%;
        margin: 50px auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        border-radius: 8px;
        text-align: center;
    }
    .welcome {
        font-size: 24px;
        margin-bottom: 20px;
    }
    .options a {
        display: block;
        margin: 10px 0;
        text-decoration: none;
        color: black;
        background: #D3D3D3;
        padding: 10px;
        border-radius: 5px;
        width: 200px;
        margin-left: auto;
        margin-right: auto;
    }
    .options a:hover {
        background: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="welcome">
            Welcome ADMIN!
        </div>
        <div class="options">
            <a href="add_vehicle.jsp">Add Vehicle</a>
            <a href="update_vehicle.jsp">Update Vehicle</a>
            <a href="del_vehicle.jsp">Delete Vehicle</a>
            <a href="display_vehicle.jsp">Display Vehicle</a>
            <a href="display_transaction.jsp">Transaction</a>
              <a href="update_available.jsp">Vehicle returned</a>
            <a href="admin.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
