<%@page import="java.sql.*"%>
<%@page import="shop.ConnectionProvider"%>
<%@include file="header.jsp"%>
<html>
	<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Confirmation</title>
  <link rel="stylesheet" href="css/bootstrap2.min.css">
  <!-- css from bootstap -->
  <link rel="stylesheet" href="https://kit.fontawesome.com/bef727a88b.css" crossorigin="anonymous">
  <link rel="stylesheet" href="css/orders.css">
  <script src="js/main.js"></script>
  <script src="https://kit.fontawesome.com/e020a8362e.js" crossorigin="anonymous"></script>

  <!-- Favicon -->
  <link href="img/favicon.ico" rel="icon">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Aboreto&family=Andika&display=swap" rel="stylesheet">


  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Customized Bootstrap Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

	<style>
		.btn{
			margin: 10px;
		}
	</style>
</head>
	<body>
	<div class="d-flex h-100  position-fixed d-phone">
    <div class="col-lg-4 sticky-lg-top  bg-white mb-lg-0 d-block justify-content-around z-0">
      <img src="img/boatwatch.jpg" alt="Product Image" class="w-50 h-40 rounded mx-auto d-block">
      <div id="image-slider" class="carousel slide m-5" data-bs-ride="carousel">
        <div class="carousel-inner m-auto">
          <div class="carousel-item active">
            <img src="img/boatwatch2.jpg" alt="Product Image 1" class="w-10">
          </div>
          <div class="carousel-item">
            <img src="img/boatwatch3.jpg" alt="Product Image 2" class="w-10">
          </div>
          <div class="carousel-item">
            <img src="img/boatwatch4.jpg" alt="Product Image 3" class="w-10">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#image-slider" data-bs-slide="prev">
          <span class="carousel-control-prev-icon bg-black" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#image-slider" data-bs-slide="next">
          <span class="carousel-control-next-icon bg-black" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
     
  </div>


    <div class="col-lg-8 scroll container-review p-lg-5">
      
      <%
      	String email=session.getAttribute("email").toString();
      	String id = request.getParameter("id");
      	try{
      		Connection con = ConnectionProvider.getConn();
      		Statement st = con.createStatement();
      		ResultSet rs = st.executeQuery("select * from products where id='"+id+"'");
      		while(rs.next()){
      %>
      	<h3><%=rs.getString("name") %></h3>
      <span class="fs-4"><%=rs.getString("description") %></span>
      <h4><span class="stars star-checked">&#9733</span>
      <span class="stars star-checked">&#9733</span>
      <span class="stars star-checked">&#9733</span>
      <span class="stars">&#9734</span>
      <span class="stars">&#9734</span>
      </h4>
      <p class="h4">Cost: <%=rs.getString("price") %> <span class="h6">(20% discount)</span></p>
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <a href="addToCartAction.jsp?id=<%=id %>" ><button class="btn btn-primary me-md-2" type="button" >Add&nbsp;To&nbsp;Cart</button></a>
        <button class="btn btn-primary" type="button">Buy&nbsp;Now</button>
      </div>
      <br><br>
      <%
      		}
      	}
      	catch(Exception e){
      		System.out.println(e);
      	}
      %>
      <div class="comments">
        <span>Reviews and Ratings</span>
        <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);"> 

        <div class="comment-container">
           <img src="img/c1.jpg" alt="">
           <div class="com-details">
               <div class="date">17/03/2023</div>
               <h4 class="commenter-name">Sarada</h4>
                   <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span></div>
                   <p>"What a refreshing and unique album! The artist has created something truly special with their creativity and artistry. I'm hooked!"</p>
           </div>    
       </div>
       <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);"> 

       <div class="comment-container">
          <img src="img/c2.jpg" alt="">
          <div class="com-details">
              <div class="date">27/09/2022</div>
              <h4 class="commenter-name">Virat</h4>
                  <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span></div>
                  <p>"This album is a masterpiece! The combination of melodies, lyrics, and production is simply breathtaking. Well done!"</p>
          </div>    
      </div> 
                
         <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);"> 

         <div class="comment-container">
            <img src="img/c3.jpg" alt="">
            <div class="com-details">
                <div class="date">04/07/2022</div>
                <h4 class="commenter-name">Keshav</h4>
                    <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span></div>
                    <p>"I'm so impressed with this album! The artist's vocals are incredible, the production is flawless, and the songs are so well-crafted. I can't stop listening!"</p>
            </div>    
        </div>     
        <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);">  
        <div class="comment-container">
            <img src="img/c4.jpg" alt="">
            <div class="com-details">
                <div class="date">21/01/2023</div>
                <h4 class="commenter-name">Ritvik</h4>
                    <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span></div>
                    <p>I'm loving every second of this album! The artist's passion for music is palpable, and the album is a testament to their skill as a musician. A truly exceptional work of art."</p>
            </div>    
        </div>   
         
        <hr style="width: 100%;margin-top: 0.4vw;">   
        <div class="comment-container">
            <img src="img/c5.jpg" alt="">
            <div class="com-details">
                <div class="date">11/02/2022</div>
                <h4 class="commenter-name">Revanth</h4>
                    <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span></div>
                    <p>"I'm blown away by this album! The artist's voice is captivating, the instrumentals are top-notch, and the songwriting is superb. A must-listen for any music lover."</p>
            </div>    
        </div>     

        <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);"> 

        <div class="comment-container">
           <img src="img/c6.jpg" alt="">
           <div class="com-details">
               <div class="date">17/03/2023</div>
               <h4 class="commenter-name">Sarada</h4>
                   <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span></div>
                   <p>"What a refreshing and unique album! The artist has created something truly special with their creativity and artistry. I'm hooked!"</p>
           </div>    
       </div>
       <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);"> 

       <div class="comment-container">
          <img src="img/c7.jpg" alt="">
          <div class="com-details">
              <div class="date">27/09/2022</div>
              <h4 class="commenter-name">Virat</h4>
                  <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span></div>
                  <p>"This album is a masterpiece! The combination of melodies, lyrics, and production is simply breathtaking. Well done!"</p>
          </div>    
      </div> 
                
         <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);"> 

         <div class="comment-container">
            <img src="img/c8.jpg" alt="">
            <div class="com-details">
                <div class="date">04/07/2022</div>
                <h4 class="commenter-name">Keshav</h4>
                    <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span></div>
                    <p>"I'm so impressed with this album! The artist's vocals are incredible, the production is flawless, and the songs are so well-crafted. I can't stop listening!"</p>
            </div>    
        </div>     
        <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);">  
        <div class="comment-container">
            <img src="img/c3.jpg" alt="">
            <div class="com-details">
                <div class="date">21/01/2023</div>
                <h4 class="commenter-name">Ritvik</h4>
                    <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span></div>
                    <p>I'm loving every second of this album! The artist's passion for music is palpable, and the album is a testament to their skill as a musician. A truly exceptional work of art."</p>
            </div>    
        </div>   
         
        <hr style="width: 100%;margin-top: 0.4vw;">   
        <div class="comment-container">
            <img src="img/c5.jpg" alt="">
            <div class="com-details">
                <div class="date">11/02/2022</div>
                <h4 class="commenter-name">Revanth</h4>
                    <div class="rating-stars">Rating: <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span></div>
                    <p>"I'm blown away by this album! The artist's voice is captivating, the instrumentals are top-notch, and the songwriting is superb. A must-listen for any music lover."</p>
            </div>    
        </div>     
         <!-- <hr style="width: 100%;margin-top: 0.4vw;color: rgb(120, 120, 120);">  -->
     </div>
    </div>
        <div class="col-lg-4 sticky-lg-top  bg-white mb-lg-0 d-block justify-content-around z-0">
    		<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
                <p class="mb-4">No content available to me give me content so that i can write it here. And any changes to made let me know</p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>ONGOLE INDIA EARTH MILKYWAY GALAXY</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>Unicloja@gmail.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+91 9351891311</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                            <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                            <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                        <p>Give me content so that i can add here</p>
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Your Email Address">
                                <div class="input-group-append">
                                    <button class="btn btn-primary">Sign Up</button>
                                </div>
                            </div>
                        </form>
                        <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                        <div class="d-flex">
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-secondary">
                    &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                    by Unicloja </p>
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->
    	</div>
	</div>
	
	
  <!-- js from font-awesome -->
  <script src="https://kit.fontawesome.com/bef727a88b.js" crossorigin="anonymous"></script>
  <!-- js from boot strap  -->
  <script src="js/bootstrap.bundle.min.js"></script>
		
	</body>
</html>


