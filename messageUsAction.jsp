<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%
String email = session.getAttribute("email").toString();
String subject = request.getParameter("subject");
String body = request.getParameter("body");
int check=0;
try{
	Connection con = ConnectionProvider.getConn();
	PreparedStatement ps = con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	ps.setString(1, email);
	ps.setString(2,subject);
	ps.setString(3,body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=done");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=wrong");
}
%>