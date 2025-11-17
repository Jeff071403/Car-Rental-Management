<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id"); // assuming you pass the car id to identify the car

    String rent = "";
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("SELECT rent FROM car WHERE id = '" + id + "'");
        if(rs.next()) {
            rent = rs.getString("rent");
        }
        rs.close();
        st.close();
        con.close();
%>

<form action="updateback2.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    Previous Rent: <input type="text" name="rent" value="<%= rent %>">
    <br><br>
    New Rent: <input type="text" name="newRent">
    <br><br>
    <input type="submit" value="Update Rent">
</form>
