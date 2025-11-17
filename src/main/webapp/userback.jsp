<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Car Table Display with Filters</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .filter-container {
            width: 300px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .filter-container select, .filter-container button {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        table {
            border-collapse: collapse;
            width: 90%;
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
        /* Styling for the Book button */
        .book-btn {
            display: inline-block;
            background-color: #D3D3D3;
            color: black;
            padding: 10px 25px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .book-btn:hover {
            background-color: #45a049;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

    <div class="filter-container">
        <form method="get">
            <label for="seater">Seater</label>
            <select name="seater" id="seater">
                <option value="">--Select Seater--</option>
                <option value="4" <%= "4".equals(request.getParameter("seater")) ? "selected" : "" %>>4 Seater</option>
                <option value="5" <%= "5".equals(request.getParameter("seater")) ? "selected" : "" %>>5 Seater</option>
                <option value="7" <%= "7".equals(request.getParameter("seater")) ? "selected" : "" %>>7 Seater</option>
            </select>

            <label for="availability">Availability</label>
            <select name="availability" id="availability">
                <option value="">--Select Availability--</option>
                <option value="available" <%= "available".equals(request.getParameter("availability")) ? "selected" : "" %>>Available</option>
                <option value="not available" <%= "not available".equals(request.getParameter("availability")) ? "selected" : "" %>>Not Available</option>
            </select>

            <button type="submit">Search</button>
        </form>
    </div>

    <%
        String seater = request.getParameter("seater");
        String availability = request.getParameter("availability");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
            Statement st = con.createStatement();

            String query = "SELECT * FROM car WHERE 1=1";

            if (seater != null && !seater.isEmpty()) {
                query += " AND seater = '" + seater + "'";
            }
            if (availability != null && !availability.isEmpty()) {
                query += " AND availablity = '" + availability + "'";
            }

            ResultSet rs = st.executeQuery(query);
    %>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Model</th>
                    <th>Company</th>                                                       
                    <th>Number Plate</th>                 
                    <th>Rent</th>
                </tr>
                <%
                    boolean hasResults = false;
                    while(rs.next()) {
                        hasResults = true;
                %>
                <tr>
                    <td><%= rs.getString("id") %></td>
                    <td><%= rs.getString("model") %></td>
                    <td><%= rs.getString("company") %></td>                                                  
                    <td><%= rs.getString("reg_no") %></td>
                    <td><%= rs.getString("rent") %></td>
                </tr>
                <% } %>
            </table>
            <%
                if (hasResults) {
            %>
                <center><a href="Book.jsp" class="book-btn">Book Now</a></center>
            <%
                } else {
            %>
                <p style="text-align:center;">No records found based on the filter!</p>
            <%
                }
                rs.close();
                st.close();
                con.close();
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>

</body>
</html>

