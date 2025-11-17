<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Available Cars</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            text-align: center;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .select-container {
            margin: 20px;
            width: 50%;
            display: flex;
            justify-content: center;
        }
        .select-container select, .select-container button {
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .select-container button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        .select-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h2>Available Cars</h2>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM car WHERE availablity = 'available'");

            if(rs.next()) {
    %>

    <table>
        <tr>
            <th>Car Model</th>
            <th>Company</th>
            <th>Seater</th>
            <th>Rent Per Day</th>
            <th>Action</th>
        </tr>
        
        <%
            do {
        %>
        <tr>
            <td><%= rs.getString("model") %></td>
            <td><%= rs.getString("company") %></td>
            <td><%= rs.getString("seater") %> Seater</td>
            <td>₹<%= rs.getString("rent") %></td>
            <td>
                <!-- Dropdown for selecting the car -->
                <form action="bookform.jsp" method="get">
                    <input type="hidden" name="car_id" value="<%= rs.getString("id") %>">
                    <button type="submit">Book CAR</button>
                </form>
            </td>
        </tr>
        <%
            } while(rs.next());
        %>
    </table>

    <% 
            } else {
    %>
        <p>No cars are available for booking at the moment.</p>
    <%
            }

            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>

</body>
</html>


