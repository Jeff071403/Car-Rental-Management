<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body { font-family: Arial, sans-serif; background:  #D3D3D3; text-align: center; padding: 50px; }
        .success { padding: 20px; background: #D3D3D3; color: #3c763d; border-radius: 8px; display: inline-block; }
        table { margin: 0 auto; border-collapse: collapse; }
        td { padding: 8px; }
    </style>
</head>
<body>

<%
    // Retrieve the form data passed from the booking form
    String customer_name = request.getParameter("customer_name");
    String phone = request.getParameter("phone");
    String car_id = request.getParameter("car_id");
    
    // Corrected: Retrieve rentPerDay value from the form
    String rentPerDayStr = request.getParameter("rentPerDay"); // Rent per day
    String daysStr = request.getParameter("days"); // Number of days
    String totalAmountStr = request.getParameter("totalAmount"); // Total amount (calculated)

    // Convert rentPerDay, days, and totalAmount to integers
    int rentPerDay = Integer.parseInt(rentPerDayStr);  // Rent per day
    int days = Integer.parseInt(daysStr);  // Number of days
    int totalAmount = Integer.parseInt(totalAmountStr);  // Total amount

    // Validate the input parameters
    if (customer_name != null && !customer_name.isEmpty() && phone != null && !phone.isEmpty() && car_id != null && !car_id.isEmpty()) {
        try {
            // Get the current system date for booking date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String currentDate = sdf.format(new Date());

            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");

            // Step 1: Insert the booking details into the transaction table
            PreparedStatement psInsert = con.prepareStatement(
                "INSERT INTO transaction (car_id, customer_name, phone, no_of_days, total_payment, booking_date) VALUES (?, ?, ?, ?, ?, ?)"
            );
            psInsert.setString(1, car_id);
            psInsert.setString(2, customer_name);
            psInsert.setString(3, phone);
            psInsert.setInt(4, days);
            psInsert.setInt(5, totalAmount);
            psInsert.setString(6, currentDate);
            psInsert.executeUpdate();

            // Step 2: Update the car table to set the car's availability to 'not available' and store customer details
            PreparedStatement psUpdate = con.prepareStatement(
                "UPDATE car SET customer_name=?, customer_phone=?, availablity='not available' WHERE id=?"
            );
            psUpdate.setString(1, customer_name);
            psUpdate.setString(2, phone);
            psUpdate.setString(3, car_id);
            psUpdate.executeUpdate();

            // Close the resources
            psInsert.close();
            psUpdate.close();
            con.close();
%>

<div class="success">
    <h2>Booking Confirmed!</h2>
    <table border="1">
        <tr><td><b>Customer Name:</b></td><td><%= customer_name %></td></tr>
        <tr><td><b>Phone:</b></td><td><%= phone %></td></tr>
        <tr><td><b>Number of Days:</b></td><td><%= days %> Days</td></tr>
        <tr><td><b>Rent Per Day:</b></td><td>₹ <%= rentPerDay %></td></tr>
        <tr><td><b>Total Amount:</b></td><td>₹ <%= totalAmount %></td></tr>
        <tr><td><b>Booking Date:</b></td><td><%= currentDate %></td></tr>
    </table>
</div>

<%
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;'>Missing required data! Please make sure all fields are filled.</p>");
    }
%>

</body>
</html>
