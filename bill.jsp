<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>

<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email = session.getAttribute("email").toString();
try{
	int total=0;
	int  sno=0;
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs.next()){
		total = rs.getInt(1);
	}
	ResultSet rs1 = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs1.next()){
%>
<h3 style="font-variant:small-caps">UnicLoja</h3>
<hr>
<div style="text-align:center">
	
<div class="left-div"><h3>Name: <%=rs1.getString(1) %></h3></div>
<div class="right-div-right"><h3>Email:	<%out.println(email); %></h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs1.getString("number") %></h3></div>  

<div class="left-div"><h3>Order Date:  <%=rs1.getString("orderDate") %></h3></div>
<div class="right-div-right"><h3>Payment Method:  <%=rs1.getString("paymentMethod") %></h3></div>
<div class="right-div"><h3>Expected Delivery:  <%=rs1.getString("deliveryDate") %></h3></div> 

<div class="right-div-right"><h3>Country: <%=rs1.getString("country") %></h3></div> 
<div class="left-div"><h3>Address:  <%=rs1.getString("address") %>,<%=rs1.getString("city") %></h3></div> 
 <div class="right-div"><h3>State: <%=rs1.getString("state") %></h3></div>
 
</div>

<hr>
<% break; }%>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs3 = st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs3.next()){
	  sno=sno+1;
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs3.getString("name") %></td>
    <td><%=rs3.getString("category") %></td>
    <td><%=rs3.getString("price") %></td>
    <td><%=rs3.getString("quantity") %></td>
     <td><%=rs3.getString("total") %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total: <%out.println(total); %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>