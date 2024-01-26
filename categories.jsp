<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="categoriesHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
   <!-- Bootstrap CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <style>
a:hover{
	text-decoration: none;
}
.card{
	transistion: transform 0.3s;
}
.card:hover{
	transform:scale(1.05);
	box-shadow: 0 0 10px rgba(0,0,0,0.2);
}
.card-title,.card-text{
	transistion: color 0.3s;
}
.card-title:hover{
	color:red;
}
.card-text:hover{
	color:blue;
}
.fix{
	z-index:1;
}
.card-img-top{
	object-fit: cover;
	height: 200px;
}
</style>
 </head>
 <body>
 	<div class="container">
 		<div class="row">
 <%
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from categories where id is not null");
	while(rs.next()){
		String imageSrc= rs.getString("image");
 %>
 			<div class="col-md-4">
 				<div class="card">
 					<a href="<%=rs.getString(6) %>"><img class="card-img-src" src="<%=imageSrc%>"></a>
 					<center><a href="<%=rs.getString(6) %>"><h3 class="card-title" style="font-size:20px;cursor:pointer"><%=rs.getString(2) %></h3></a></center>
 					<div class="card-body">
 						<p class="card-text"><%=rs.getString(3) %></p>
 						<p class="card-text"><%=rs.getString(4) %></p>
 					</div>
 				</div><br>
 			</div>
<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
 		</div>
 	</div>
 </body>
 </html>