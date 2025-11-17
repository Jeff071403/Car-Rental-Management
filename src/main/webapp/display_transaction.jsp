<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Car Table Display</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2 align="center">Car Table Data</h2>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM transaction");
    %>
            <table>
                <tr>
                    <th>CAR ID</th>
                    <th>CUSTOMER NAME</th>
                    <th>PHONE</th>
                    <th>NO OF DAYS</th>
                    <th>TOTAL PAYMENT</th>
                    <th>BOOKING DATE</th>
                </tr>
                <%
                    while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("car_id") %></td>
                    <td><%= rs.getString("customer_name") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("no_of_days") %></td>
                    <td><%= rs.getString("total_payment") %></td>
                    <td><%= rs.getString("booking_date") %></td>
                </tr>
                <% } %>
            </table>
    <%
            rs.close();
            st.close();
            con.close();
        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
</html>