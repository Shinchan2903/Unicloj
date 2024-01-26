
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div>
		<h1>Login</h1>
		<form action="loginAction.jsp" method="post">
			<input type="email" name="email" placeholder="Email">
			<input type="password" name="password" placeholder="Password">
			<input type="submit" value="Login">
		</form>
		<div class="extra-links">
			<p>Don't have an account? <a href="signup.jsp">SignUp</a></p>
			<p><a href="#">Forgot password</a></p>
		</div>
	</div>
	<div class="whysignLogin">
  	<%
  	String msg = request.getParameter("msg");
 	if("notexist".equals(msg)){
  	%>
  	<h1>Incorrect Username or Password</h1>
  	<%} %>
 	<%
  	if("invalid".equals(msg)){
  	%>
	<h1>Some thing Went Wrong! Try Again !</h1>
 	<%} %>
  </div>
  </div>

</body>
</html>