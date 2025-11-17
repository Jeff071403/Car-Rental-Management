<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String model = request.getParameter("model");
    String company = request.getParameter("company");
    String seater = request.getParameter("seater");
    String numberplate = request.getParameter("numberplate");
    String availability = "Available"; 
    String phone="0000000";
    String rent=request.getParameter("rent");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeff", "root", "");
    Statement st = con.createStatement(); 

    // Correcting the query to insert actual values
    st.executeUpdate("INSERT INTO car (id, model, company, seater, availablity, reg_no,Customer_Phone,rent) " +
                     "VALUES ('" + id + "', '" + model + "', '" + company + "', '" + seater + "', '" + availability + "', '" + numberplate + "','"+phone+"','"+rent+"')");
    
    out.println("Inserted");
%>
