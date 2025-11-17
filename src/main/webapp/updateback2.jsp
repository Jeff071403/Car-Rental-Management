<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String newRent = request.getParameter("newRent");

    
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
        Statement st = con.createStatement();

        // Update Query
        st.executeUpdate("UPDATE car SET rent = '" + newRent + "' WHERE id = '" + id + "'");

        out.println("Rent Updated Successfully!");

        st.close();
        con.close();
%>
