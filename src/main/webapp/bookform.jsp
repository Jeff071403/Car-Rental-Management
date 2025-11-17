<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<html>
<head>
    <title>Booking Form</title>
    <script type="text/javascript">
        function calculateTotal() {
            var rentPerDay = parseInt(document.getElementById('rentPerDay').value);
            var days = parseInt(document.getElementById('days').value);
            var totalAmount = rentPerDay * days;
            
            // Display total amount
            document.getElementById('totalAmount').innerText = "₹ " + totalAmount;
            
            // Set the hidden totalAmount field
            document.getElementById('totalAmountHidden').value = totalAmount;
        }
    </script>
</head>
<body>

<%
    String car_id = request.getParameter("car_id");
    String rentPerDay = "";
    String carModel = "";
    String companyName = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT model, company, rent FROM car WHERE id = ?");
        ps.setString(1, car_id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            carModel = rs.getString("model");
            companyName = rs.getString("company");
            rentPerDay = rs.getString("rent");
        }
        
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<p>Error fetching car details: " + e.getMessage() + "</p>");
    }
%>

<h2>Booking Form for <%= carModel %> by <%= companyName %></h2>

<form action="bookaction.jsp" method="post">
    <label>Full Name:</label>
    <input type="text" name="customer_name" required><br><br>

    <label>Phone Number:</label>
    <input type="text" name="phone" required><br><br>

    <label>Number of Days:</label>
    <input type="number" name="days" id="days" required min="1" onchange="calculateTotal()"><br><br>

    <input type="hidden" name="car_id" value="<%= car_id %>">
    <input type="hidden" id="rentPerDay" value="<%= rentPerDay %>">

    
    <input type="hidden" name="rentPerDay" id="rentPerDay" value="<%= rentPerDay %>">


    <h3>Total Amount: <span id="totalAmount">₹ 0</span></h3><br>

    <input type="hidden" name="totalAmount" id="totalAmountHidden">

    <label>Booking Date:</label>
    <input type="text" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>" disabled><br><br>

    <button type="submit">Confirm Booking</button>
</form>

</body>
</html>
