<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Search Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 50px;
    }
    .filter-container {
        max-width: 400px;
        margin: auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .filter-container label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    .filter-container select, .filter-container button {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        border-radius: 4px;
        border: 1px solid #ccc;
    }
    .filter-container button {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
    .filter-container button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<div class="filter-container">
    <form action="userback.jsp" method="get">
        <label for="seater">Seater</label>
        <select name="seater" id="seater">
            <option value="">--Select Seater--</option>
            <option value="4">4 Seater</option>
            <option value="5">5 Seater</option>
            <option value="7">7 Seater</option>
        </select>

        <label for="availability">Availability</label>
        <select name="availability" id="availability">
            <option value="">--Select Availability--</option>
            <option value="available">Available</option>
            <option value="not available">Not Available</option>
        </select>

        <button type="submit">Search</button>
    </form>
</div>

</body>
</html>