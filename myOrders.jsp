<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders</title>
<script src="https://kit.fontawesome.com/e020a8362e.js" crossorigin="anonymous"></script>
 
<style>
.cancel{
	background-color:orange;
	border-radius: 20px;
}
.fix,.footer{
  z-index:1;
}
a:hover{
	text-decoration:none;
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
.card-img-top{
	object-fit: cover;
	height: 200px;
	cursor:pointer;
}
  </style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<div class="container">
	<div class="row">
<%
String email = session.getAttribute("email").toString();
	int count=0;
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.email='"+email+"' and cart.orderDate is not null");
	while(rs.next()){
		count++;
		String imageSrc=rs.getString("image");
%>
		<div class="col-md-4 col-sm-6">
			<div class="card">
				<img class="card-img-top" src="<%=imageSrc%>">
				<div class="card-body">
					<center><h5 class="card-title"><b><%=rs.getString("name") %></b></h5></center>
					<p class="card-text"><b>Category: </b><%=rs.getString("category") %></p>
					<p class="card-text"><b>Price: </b> <i class="fa fa-inr"></i><%=rs.getString("price") %></p>
					<p class="card-text"><b>Quantity: </b> <%=rs.getString("quantity") %></p>
					<p class="card-text"><b>Total: </b> <i class="fa fa-inr"></i><%=rs.getString("total") %></p>
					<p class="card-text"><b>Ordered Date: </b><%=rs.getString("orderDate") %></p>
					<p class="card-text"><b>Expected Delivery Date: </b><%=rs.getString("deliveryDate") %></p>
					<p class="card-text"><b>Payment Method: </b><%=rs.getString("paymentMethod") %></p>
					<p class="card-text"><b>Status: <%=rs.getString("status") %></b></p>
					<%
					String status = rs.getString("status");
					if(!status.equals("cancelled")){
					 %>
					 <a href="cancelOrder.jsp?id=<%=rs.getString("id")%>"><button class="cancel">Cancel order</button></a>					 
					 <%} %>
				</div>
				
				<br>
			</div>
			<br>
		</div>
		 <%
 }
	if (count == 0) {
        %>
        <div class="col-md-12 text-center">
            <h2 id="emptyMessage"><b>Orders List is empty &#128515;</b></h2>
        </div>
        <%
    }
}
catch(Exception e){
	
}
%>
  	</div>     
</div>


  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
<%@include file="footer.jsp"%>