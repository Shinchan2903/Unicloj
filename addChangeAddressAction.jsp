<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
int check=0;
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next()){
		check=1;
		Statement st1 = con.createStatement();
		st1.executeUpdate("update users set address='"+address+"',city='"+city+"',state='"+state+"',country='"+country+"' where email='"+email+"'");
		response.sendRedirect("addChangeAddress.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("addChangeAddress.jsp?msg=wrong");
	}
}
catch(Exception e){
	System.out.println(e);
}
%>