<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<title>Login | Startat-Startup Statistics</title>
<%
if(session.getAttribute("username")!=null)
{
	response.sendRedirect("/dashboard.jsp");
}
%>
<style>
.empty {
clear:both;
padding-bottom:70px;
}
.top {
clear:both;
padding-top:50px;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/"><img src="images/startat-logo-navbar.png"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="page.jsp?name=about">About</a></li>
      <li><a href="#" id="login">Login/SignUp</a></li>
    </ul>
  </div>
</nav>
<div class="container-fluid">
	<div class="top empty"></div>
	<div class="alert alert-danger">${msg}</div>
	<div class="col-sm-8 col- md-8 col-lg-8">
		<h1>Sign Up:</h1>
		<div class="alert alert-danger">${msg1}</div>
		<form role="form" class="form-horizontal" action="Register" method="post">
			<div class="form-group">
				<label for="username" class="control-label">Username:</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
			</div>
			<div class="form-group">
				<label for="email" class="control-label">Email Address:</label>
				<input type="text" class="form-control" id="email" name="email" placeholder="Enter Email Address" required>
			</div>
			<div class="form-group">
				<label for="password" class="control-label">Password:</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
			</div>
			<div class="form-group">
				<label for="cpassword" class="control-label">Confirm Password:</label>
				<input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Confirm Password" required>
			</div>
			<div class="form-group" align="right">
				<button type="submit" class="btn btn-primary">Sign Up</button>
			</div>
		</form>
	</div>
	<div class="col-sm-4 col-md-4 col-lg-4">
		<h1>Login:</h1>
		<div class="alert alert-danger">${msg2}</div>
		<form role="form" class="form-horizontal" action="Login" method="post">
			<div class="form-group">
				<label for="lusername" class="control-label">Username:</label>
				<input type="text" id="lusername" class="form-control" name="lusername" placeholder="Enter Username" required>
			</div>
			<div class="form-group">
				<label for="ppassword" class="control-label">Password:</label>
				<input type="password" id="ppassword" name="ppassword" class="form-control" placeholder="Enter Password" required>
			</div>
			<div class="form-group" align="right">
				<button type="submit" class="btn btn-primary">Login</button>
			</div>
		</form>
	</div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>