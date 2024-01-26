<%@page import="shop.ConnectionProvider" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.UUID" %>

<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String number=request.getParameter("number");
	String password = request.getParameter("password");
	String state="";
	String country = "";
	String address = "";
	String city = "";
	
	try{
		Connection conn = ConnectionProvider.getConn();
		PreparedStatement ps = conn.prepareStatement("insert into users(name,email,password,number,address,city,state,pincode) values(?,?,?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2,email);
		ps.setString(3, password);
		ps.setString(4, number);
		ps.setString(5,address);
		ps.setString(6,city);
		ps.setString(7,state);
		ps.setString(8,country);
		ps.executeUpdate();
		
		response.sendRedirect("login.jsp?msg=valid");
	}
	catch(Exception e){
		System.out.print(e);
		response.sendRedirect("signup.jsp?msg=invalid");
	}
%>

