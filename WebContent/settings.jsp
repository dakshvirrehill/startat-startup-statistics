<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User" %>
<%@ page import="model.DBOperations" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<%
if(session.getAttribute("username")==null)
{
String message="Kindly login before accessing this page";
request.setAttribute("msg",message);
response.sendRedirect("/login.jsp");
}
%>
<title>Settings | <%=session.getAttribute("username") %></title>
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
<nav class="navbar navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/"><img src="images/startat-logo-navbar.png"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="page.jsp?name=about">About</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="addcomp.jsp">Add a Company</a>
          <li><a href="profile.jsp">Profile</a></li>
          <li><a href="settings.jsp">Settings</a></li>
          <li><a href="logout">Logout</a></li> 
        </ul>
      </li>
    </ul>
  </div>
</nav>
<%
User u=DBOperations.getUserDetails((String)session.getAttribute("username"));
String email=u.getEmail();
%>
<div class="empty top"></div>
<div class="container-fluid">
<h1>Account Settings</h1><br>
<div class="alert alert-danger">{$msg}</div>
<form class="form-horizontal" role="form" action="Acc_settings" method="post">
	<div class="form-group">
		<label for="username" class="control-label">Username:</label>
		<input type="text" class="form-control" id="username" name="username" value="<%=session.getAttribute("username") %>" disabled>
	</div>
	<div class="form-group">
		<label for="password" class="control-label">Password:</label>
		<input type="password" class="form-control" id="password" name="password" placeholder="Change Password" required>
	</div>
	<div class="form-group">
		<label for="cpassword" class="control-label">Confirm Password:</label>
		<input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Confirm Change Password" required>
	</div>
	<div class="form-group">
		<label for="email" class="control-label">Email:</label>
		<input type="text" class="form-control" id="email" name="email" value="<%=email %>" required>
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary">Save Changes</button>
	</div>
</form>
<div class="alert alert-success">{$msg2}</div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
</body>
</html>