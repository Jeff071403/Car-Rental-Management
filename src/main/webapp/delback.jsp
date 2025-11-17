<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
    Statement st = con.createStatement(); 

    // Correcting the query to insert actual values
    st.executeUpdate("Delete from car where id='"+id+"'");
    
    out.println("Deleted");
%>