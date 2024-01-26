<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<script src="https://kit.fontawesome.com/e020a8362e.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/home.css">
<style>

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
.quantity-actions {
  display: flex;
  justify-content: center;
  align-items: center;
}

.quantity-button {
  display: inline-block;
  font-size: 30px;
  cursor: pointer;
  margin: 0 35px;
}

.quantity-input {
  width: 40px;
  text-align: center;
}
.remove{
	padding: 4px;
	background-color: grey;
	border-radius: 20px;
	width: 100px;
}
.remove:hover{
	background-color: red;
	color:white;
	border-radius: 20px;
}
.remove a:hover{
	text-decoration:none;
}
.lastbtn:hover{
	cursor:pointer;
}
.lastbtn a:hover{
	text-decoration: none;
}
</style>
</head>
<body>

<div style="color: rgb(33,435,23); text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>


<%
String email= session.getAttribute("email").toString();
boolean hasProductsInCartlist = false;
int total=0;
int sno=0;
try {
    Connection con = ConnectionProvider.getConn();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select sum(total) from cart where email='" + email + "' and address is NULL");

    while (rs.next()) {
        total = rs.getInt(1);
    }
    %>
     
      

<div class="container">
<br>
		<div class="row">
    <%
    // Declare the ResultSet outside the try-catch block
    try {
        Statement st1 = con.createStatement(); // Create a new Statement object
        ResultSet rs1 = st1.executeQuery("select * from products inner join cart on products.id=cart.product_id and cart.email='" + email + "' and cart.address is NULL");

        while (rs1.next()) {
            String imageSrc = rs1.getString("image");
            hasProductsInCartlist = true;
            %>
            <div class="col-md-3 col-sm-6">
                <div class="card">
                    <img class="card-img-top" src="<%=imageSrc%>">
                    <div class="card-body">
                        <center><h5 class="card-title" style="cursor:pointer"><b><%=rs1.getString(2) %></b></h5></center>
                        <p class="card-text"><b>Category: </b><%=rs1.getString(3) %></p>
                        <p class="card-text"><b>Price: </b><i class="fa fa-inr"></i><%=rs1.getString(4) %></p>
                        <p class="card-text"><b>Quantity: </b>
                        <div class="quantity-actions">
  							<a href="IncDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=dec" class="quantity-button">&minus;</a>
  							<input type="text" class="quantity-input" value="<%=rs1.getString("quantity") %>" readonly>
  							<a href="IncDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=inc" class="quantity-button">&#43;</a>
						</div>
                        </p>
                        <p class="card-text"><b>Total: </b><i class="fa fa-inr"></i> <%=rs1.getString(11) %></p>
                        <div style="display:flex; justify-content:center;font-weight:600">
                        <button class="remove"><a href="removeFromCart.jsp?id=<%=rs1.getString(1)%>" style="color:white">Remove <i class='fas fa-trash-alt'></i></a></button>
                        </div>
                    </div>
                </div>
                <br>
            </div>
            <% }
       
    } catch (Exception e) {
        System.out.println(e);
    }
} catch (Exception e) {
    System.out.println(e);
}
if (!hasProductsInCartlist) {
    %>
            <div class="col-md-12">
                <div style="text-align: center; font-size: 18px;">
                    Your wishlist is empty.
                </div>
            </div>
    <%
        }
%>

</div>
</div>
<br>
<div class="row" style="text-align:center">
		<%if(total>0){ %>
      	<div class="col">
      		<h5><b>Total: </b> <i class="fa fa-inr"><% out.println(total); %></i></h5>
      	</div>
      	<div class="col">
            <button style="background-color:green;padding:10px;border-radius:20px" class="lastbtn"><a href="addressPaymentForOrder.jsp" style="color:white;font-size:16px;font-weight:bold;">Proceed to order</a></button>
      	</div>
      	<%} %>
      </div>
      


<!-- Include Bootstrap JS (optional) -->

</body>
</html>
<%@include file="footer.jsp"%>