<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Vehicle</title>
</head>
<body>
    <h2>Add Vehicle Details</h2>
    <form action="addback.jsp" method="POST">
        <label for="id">Vehicle ID:</label><br>
        <input type="text" id="id" name="id" required><br><br>

        <label for="model">Car Model:</label><br>
        <input type="text" id="model" name="model" required><br><br>

        <label for="company">Car Company:</label><br>
        <input type="text" id="company" name="company" required><br><br>

        <label for="seater">Seater:</label><br>
        <input type="number" id="seater" name="seater" required><br><br>

        <label for="numberplate">Number Plate:</label><br>
        <input type="text" id="numberplate" name="numberplate" required><br><br>
        
        <label for="rent">Per Day rent:</label><br>
        <input type="text" id="rent" name="rent" required><br><br>

        <input type="submit" value="Add Vehicle">
    </form>
</body>
</html>