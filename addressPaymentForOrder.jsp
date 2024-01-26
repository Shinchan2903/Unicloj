<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
h3{
	color:white;
	font-size:25px;
}
form{
	background-color: grey;
}
.button{
	font-weight: bold;
	letter-spacing: 1.5px;
}
</style>
<script>
if(window.history.forward(1) !=null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<%
String email = session.getAttribute("email").toString();
int total=0;
int sno=0;
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs.next()){
		total = rs.getInt(1);
	}
%>
<table>
	<thead>
		<tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
          <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
         </tr>
  	</thead>
</table>
<div class="container">
	<div class="row">
<%
ResultSet rs1 = st.executeQuery("select * from products inner join cart on products.id=cart.product_id where email='"+email+"' and address is NULL");
while(rs1.next()){
	String imageSrc = rs1.getString("image");
%>
		<div class="col-md-4 col-sm-6"><br>
			<div class="card" >
				<img class="card-img-top" src="<%=imageSrc%>">
				<div class="card-body">
					<h5 class="card-title" style="text-align:center;"><%=rs1.getString("name") %></h5>
					<p class="card-text"><b>Category: </b><%=rs1.getString("category") %></p>
					<p class="card-text"><b>Quantity: </b> <%=rs1.getString("quantity") %></p>
					<p class="card-text"><i class="fa fa-inr"></i><b>Ratings: </b> <%=rs1.getString("rating") %>( <%=rs1.getString("ratings_no") %> reviews)</p>
					<p class="card-text"><b>Price: </b><i class="fa fa-inr"></i><%=rs1.getString("price") %></p>
				</div>
				
			
			</div>
			<br>
		</div>
<%
}
%>
	</div>
</div>
<%
ResultSet rs2 = st.executeQuery("select * from users where email='"+email+"'");
System.out.println(rs2);
while(rs2.next()){
%>
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
	<div class="left-div">
		<h3>Enter Address</h3>
		<input type="text" name="address" class="input-style" placeholder="Address" value="<%=rs2.getString("address") %>" required>
	</div>
	<div class="right-div">
		<h3>Enter City</h3>
		<input type="text" name="city" class="input-style" placeholder="City" value="<%=rs2.getString("city") %>" required>
	</div>
	<div class="left-div">
		<h3>Enter State</h3>
		<input type="text" name="state" class="input-style" placeholder="State" value="<%=rs2.getString("state") %>" required>
	</div>
	<div class="right-div">
		<h3>Enter Country</h3>
		<input type="text" name="country" class="input-style" placeholder="Country" value="<%=rs2.getString("country") %>" required>
	</div>
	<hr style="width: 100%">
 <div class="left-div">
   <h3>Select payment method</h3>
   <select class="input-style" name="paymentMethod">
     <option value="Cash on Delivery(COD)">Cash on Delivery(COD)</option>
     <option value="Online Payment">Online Payment</option>
   </select>
 </div>

 <div class="right-div">
   <h3>Pay online to 9110588755@ibl(Phonepe,Google Pay,Paytm)</h3>
   <input type="text" name="transactionId" class="input-style" placeholder="Enter Transaction ID">
 </div>
 <hr style="width: 100%">
 <div class="left-div">
   <h3>Mobile Number</h3>
   <input inputmode="numeric" name="number" class="input-style" value="<%=rs2.getString("number") %>" placeholder="Enter Mobile number" required>
 </div>
 <div class="right-div">
 <br><br>
    <button class="button" type="submit">Confirm Order<i class='far fa-arrow-alt-circle-right'></i></button>
 </div>
 <br><br>
 
</form>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>

<br>
<br>
<br>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
