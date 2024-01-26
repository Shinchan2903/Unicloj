<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="header.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
<style>
	.button{
		border-radius: 20px;
	}
	body{
		background-color: cadetblue;
	}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
String msg = request.getParameter("msg");

if("done".equals(msg)){
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%if("wrong".equals(msg)){ %>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
<input type="text" name="subject" class="input-style" placeholder="Subject" required>
<hr>
<textarea class="input-style" name="body" placeholder="Enter Your Message" required>
</textarea>
<hr>
<button class="button" type="submit">Send 	<i class="far fa-arrow-alt-circle-right"></i></button>
</form>
<br><br><br>
</body>
</html>
<!-- <%@ include file="footer.jsp" %> -->