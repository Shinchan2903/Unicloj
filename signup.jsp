
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet" href="css/signup.css">
</head>
<body>
	
	<div class="signup">
	<h1>Shopping</h1>
		<form action="signupAction.jsp" method="post">
			<label>Name: </label>
			<input type="text" name="name" placeholder="Name" >
			<label>Mobile Number: </label>
			<input type="text" name="studId" placeholder="Mobile Number">
			<label>Email: </label>
			<input type="email" name="email" placeholder="Email">
			<label>Password: </label>
			<input type="password" name="password" placeholder="Password">
			<input type="submit" value="SignUp">
		</form>
		<h2>Already have an account! <a href="login.jsp">Login</a></h2>
	</div>
	<script>
	<%
		String msg = request.getParameter("msg");
		if("valid".equals(msg)){
	%>
		alert("Successfully Registered");
	<%} %>
	<%
		if("invalid".equals(msg)){
	%>
		alert("Something went wrong! Please try again")
	<%} %>
     </script>
	
</body>
</html>