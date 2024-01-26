<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="adminHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<link rel="stylesheet" href="./css/home.css">
<style>
body{
	background-color: #343a40;
}
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
<br><br>
 <h4><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></42> 
 <%
 String id=request.getParameter("id");
 try{
	 Connection con = ConnectionProvider.getConn();
	 Statement st = con.createStatement();
	 ResultSet rs =st.executeQuery("select * from products where id='"+id+"'");
	 
	 while(rs.next()){
 %>

<form action="editProductAction.jsp?id=<%=rs.getString("id") %>" method="post">
<input type="hidden" value="<% out.println(id); %>">
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" value="<%=rs.getString("name") %>" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" value="<%=rs.getString("category") %>" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" value="<%=rs.getString("price") %>" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Ratings_no: </h3>
 <input class="input-style" type="number" name="ratings_no" value="<%=rs.getString("ratings_no") %>" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Rating</h3>
 <input class="input-style" type="number" name="rating" value="<%=rs.getString("rating") %>" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Description</h3>
 <input class="input-style" type="text" name="desc" value="<%=rs.getString("description") %>" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Image Path</h3>
 <input class="input-style" type="text" name="pics" value="<%=rs.getString("image") %>" required>
<hr>
</div>

 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>

<%
	 }
 }
 catch(Exception e){
	 System.out.println(e);
 }
%>
</body>
<br><br><br>
</body>
</html>
