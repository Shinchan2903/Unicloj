<%@page import="java.sql.*"%>
<%@page import="shop.ConnectionProvider"%>
<%
	String email = session.getAttribute("email").toString();
	String id = request.getParameter("id");
	try{
		Connection con = ConnectionProvider.getConn();
		Statement st = con.createStatement();
		st.executeUpdate("update cart set status='cancelled' where email='"+email+"' and product_id='"+id+"'");
		response.sendRedirect("myOrders.jsp?msg=done");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("myOrders.jsp?msg=invalid");
	}
%>