<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String avail="Available";
    String cus=null;
    String phone="0";

    
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
        Statement st = con.createStatement();

        // Update Query
        st.executeUpdate("UPDATE car SET availablity = '" + avail + "', customer_name='"+cus+"', Customer_phone='"+phone+"'WHERE id = '" + id + "'");

        out.println("Availablity Updated Successfully!");

        st.close();
        con.close();
%>
