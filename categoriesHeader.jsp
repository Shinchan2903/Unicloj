<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>
    <!--Header-->
    <br>
    <div class="topnav sticky fix">
    <%String email = session.getAttribute("email").toString(); %>
            <center><h2>Online shopping</h2></center>
            <h2><a href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h2>
            <a href="electronics.jsp">Electronics</a>
            <a href="clothes.jsp">Clothes</a>
            <a href="books.jsp">Books</a>
            <a href="vegetables.jsp">Vegetables  </a>
            <a href="farmersPage.jsp">Farmers Page</a>
            </div>
          </div>
           <br>
           <!--table-->
