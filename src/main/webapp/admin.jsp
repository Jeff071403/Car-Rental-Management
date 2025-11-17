
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .login-container {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        width: 300px;
        text-align: center;
    }
    .login-container h2 {
        margin-bottom: 20px;
    }
    .login-container input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        box-sizing: border-box;
    }
    .login-container button {
        width: 100%;
        padding: 10px;
        background-color: #D3D3D3;
        border: none;
        color: black;
        cursor: pointer;
    }
    .login-container button:hover {
        background-color: #45a049;
    }
    .login-container a {
        display: block;
        margin-top: 15px;
        text-decoration: none;
        color: #333;
        font-size: 14px;
    }
    .login-container a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="adminback.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <a href="user_page.jsp">User? Click here to login</a>
    </div>
</body>
</html>

