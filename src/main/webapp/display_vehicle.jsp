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

            ResultSet rs = st.executeQuery("SELECT * FROM car");
    %>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Model</th>
                    <th>Company</th>
                    <th>Seater</th>
                    <th>Availability</th>
                    <th>Customer name</th>
                    <th>Number Plate</th>
                    <th>Customer Phone</th>
                    <th>Rent</th>
                </tr>
                <%
                    while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("id") %></td>
                    <td><%= rs.getString("model") %></td>
                    <td><%= rs.getString("company") %></td>
                    <td><%= rs.getString("seater") %></td>
                    <td><%= rs.getString("availablity") %></td>
                    <td><%= rs.getString("customer_name") %></td>
                    <td><%= rs.getString("reg_no") %></td>
                    <td><%= rs.getString("Customer_Phone") %></td>
                    <td><%= rs.getString("rent") %></td>
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
