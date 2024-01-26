<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="header.jsp" %>
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
.remove,.success{
	padding: 4px;
	background-color: grey;
	border-radius: 20px;
	width: 100px;
	color:white;
	margin: 10px;
}
.remove:hover{
	background-color: red;
	border-radius: 20px;
}
.success a:hover{
	text-decoration: none;
}
.success:hover{
	background-color:green;
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
<%String email = session.getAttribute("email").toString(); %>
<div style="color: rgb(33,435,23); text-align: center; font-size: 30px;">My Wishlist <i class='fas fa-cart-arrow-down'></i></div>

<div class="container">
<br>
	<div class="row">
    <%
    boolean hasProductsInWishlist = false;
    try {
    	Connection con = ConnectionProvider.getConn();
        Statement st1 = con.createStatement(); // Create a new Statement object
        ResultSet rs1 = st1.executeQuery("select * from wishlist where email='"+email+"' ");
        
        while (rs1.next()) {
            String imageSrc = rs1.getString("image");
            hasProductsInWishlist = true;
            %>
            <div class="col-md-3 col-sm-6">
                <div class="card">
                    <img class="card-img-top" src="img/c1.jpg">
                    <div class="card-body">
                        <center><h5 class="card-title" style="cursor:pointer"><b><%=rs1.getString("name") %></b></h5></center>
                        <p class="card-text"><b>Category: </b><%=rs1.getString("category") %></p>
                        <p class="card-text"><b>Price: </b><i class="fa fa-inr"></i><%=rs1.getString("price") %></p>
                        <p class="card-text"><b>Ratings: </b><%=rs1.getString("ratings") %>(<%=rs1.getString("ratings_no") %> reviews)</p>                        
                        <div style="display:flex; justify-content:center;font-weight:600;margin: 10p">
                        <button class="remove"><a href="removeFromWishlist.jsp?id=<%=rs1.getString("id")%>" style="color:white">Remove </a></button>
                        <button class="success"><a href="addToCartAction.jsp?id=<%=rs1.getString("id")%>" style="color:white">Buy Now </a></button>
                        </div>
                    </div>
                </div>
                <br>
            </div>
            <% 
            }
        if (!hasProductsInWishlist) {
            %>
                    <div class="col-md-12">
                        <div style="text-align: center; font-size: 18px;">
                            Your wishlist is empty.
                        </div>
                    </div>
            <%
                }
       
        
} catch (Exception e) {
    System.out.println(e);
}
%>

</div>
</div>
<br>

</body>
</html>
<%@include file="footer.jsp" %>
