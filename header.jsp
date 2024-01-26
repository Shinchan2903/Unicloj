<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>unicloja</title>
<link rel="stylesheet" href="css/home.css">
<script src="https://kit.fontawesome.com/e020a8362e.js" crossorigin="anonymous"></script>
<style>
.input-group-append{
	cursor:pointer;
}
</style>
</head>
<body>
    <div class="container-fluid">
        
        <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
            <div class="d-inline-flex align-items-center h-100">
                <div id="mySidebar" class="sidebar" style="width: 0px;">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><i class="fa-solid fa-xmark"></i></a>
                    <a href="myProfile.jsp">Yours Profile</a>
                    <a href="seller.jsp">Becomes a Sellers</a>
                    <a href="myOrders.jsp">Orders</a>
                    <a href="#">Languages</a>
                    <a href="#">Notifications</a>
                    <a href="#">Privacy and Policy</a>
                    <a href="#">Help Us</a>
                </div>
                
                <div id="main" style="margin-left: -60px; ">
                    <button class="openbtn" onclick="openNav()"><i class="fa-solid fa-bars"></i></button>
                </div>
            </div>
            <div class="col-lg-4" style="display:flex;">
                <a href="" class="text-decoration-none">
                    <img src="img/icon3.png" alt="icon" style="width: 60px; height: 60px;">
                </a>
                <div class="unicloja mt-2">
                    <a href="" class="text-decoration-none" style="margin-top: 10%;">
                        <span class="h1 text-uppercase text-primary bg-dark px-2" id="unic">UNIC</span>
                        <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1" id="loja">LOJA</span>
                    </a>
                </div>
               
            </div>
            <div class="col-lg-4 col-6 text-left">
               <form action="searchHome" method="get">
    			<div class="input-group">
        			<input type="text" name="search" class="form-control" placeholder="Search for products" style="border: solid 2px;">
        			<div class="input-group-append">
            			<span class="input-group-text bg-transparent text-primary">
                		<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            			</span>
        			</div>
    			</div>
			</form>
               

            </div>
            <div class="row bg-secondary py-1 px-xl-5" style="width: 300px;">
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center" style="margin-right: -100px;">
                    
                    <div class="btn-group mx-2">
                        
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button">EUR</button>
                            <button class="dropdown-item" type="button">GBP</button>
                            <button class="dropdown-item" type="button">CAD</button>
                            <button class="dropdown-item" type="button">USD</button>
                        </div>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle " data-toggle="dropdown">Location</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button">FR</button>
                            <button class="dropdown-item" type="button">AR</button>
                            <button class="dropdown-item" type="button">RU</button>
                        </div>
                    </div>
                     <a href="http://127.0.0.1:5500/ProfilePage/userProfile.html" style="margin-left:10px ; color:black; background-color: white; height: 30px; width: 70px; text-align: center;">profile</a>
                </div>
                
                <div class="d-inline-flex align-items-center d-block d-lg-none">
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-heart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                    </a>
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-shopping-cart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                    </a>
                </div>
            </div>
            </div>           
        </div>
    </div>
    <!-- Topbar End -->



        <!-- Navbar Start -->
        <div class="container-fluid bg-dark mb-30">
            <div class="row px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                        <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                        <div class="navbar-nav w-100">
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                    <a href="./dress.html" class="dropdown-item">Men's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Women's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Baby's Dresses</a>
                                </div>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                    <a href="./dress.html" class="dropdown-item">Men's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Women's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Baby's Dresses</a>
                                </div>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                    <a href="./dress.html" class="dropdown-item">Men's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Women's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Baby's Dresses</a>
                                </div>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                    <a href="./dress.html" class="dropdown-item">Men's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Women's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Baby's Dresses</a>
                                </div>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                    <a href="./dress.html" class="dropdown-item">Men's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Women's Dresses</a>
                                    <a href="./dress.html" class="dropdown-item">Baby's Dresses</a>
                                </div>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i class="fa fa-angle-right float-right mt-1"></i></a>
                                <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                    <a href="./dress.html" class="dropdown-item">Men's Dresses</a>
                                    <a href="" class="dropdown-item">Women's Dresses</a>
                                    <a href="" class="dropdown-item">Baby's Dresses</a>
                                </div>
                            </div>
                        
                            <a href="./footwear.html" class="nav-item nav-link">Footwear</a>
                            <a href="./dress.html" class="nav-item nav-link">Jewellery</a>
                        
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <span class="h1 text-uppercase text-dark bg-light px-2">UNIC</span>
                            <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">LOJA</span>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="home.jsp" class="nav-item nav-link ">Home</a>
                                <a href="myOrders.jsp" class="nav-item nav-link">Orders</a>
                                <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                                </div>
                                <a href="messageUs.jsp" class="nav-item nav-link">Contact Us</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <a href="wishlist.jsp" class="btn px-0">
                                    <i class="fas fa-heart text-primary"></i>
                                    
                                </a>
                                <a href="myCart.jsp" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    
                                </a>
                                <a href="address.jsp" class="btn px-0 ml-3">
                                    <i class='fas fa-map-marker-alt' style='color:rgb(60, 255, 0)'></i>
                                    
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->
        <script>
function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}
</script>
        
</body>
</html>
