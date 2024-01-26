<%@page import="shop.ConnectionProvider" %>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	st.executeUpdate("delete from wishlist where email='"+email+"' and id='"+product_id+"' ");
	response.sendRedirect("wishlist.jsp?msg=removed");
}
catch(Exception e){
	System.out.println(e);
}
%>