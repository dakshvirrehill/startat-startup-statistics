<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.User" %>
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
response.sendRedirect("login.jsp");
}
%>
<title>Dashboard | <%=session.getAttribute("username") %></title>
<style>
.empty {
clear:both;
padding-bottom:70px;
}
.top {
clear:both;
padding-top:50px;
}
 .bigicon{
 font-size:32px;
 }
</style>
</head>
<body>
<nav class="navbar navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp"><img src="images/startat-logo-navbar.png"></a>
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
<div class="empty top"></div>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row"><a href="company.jsp" class="btn btn-primary">All Companies</a></div>
			<div class="row"><a href="financials.jsp" class="btn btn-primary">Add Financials</a></div>
		</div>
		<a href="competitive.jsp"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
<div class="bigicon"><i class="fa fa-binoculars fa-5x" aria-hidden="true"></i></div>
			</div>
			<div class="row">
				<h3 align="center">
					Competitive Intelligence
					<br>
					<small>
						This module is going to help you in creation of your competitor's profiles automatically and lets you review the key points.
					</small>
				</h3>
			</div>
		</div></a>
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
		<a href="breakeven.jsp"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
<div class="bigicon"><i class="fa fa-line-chart fa-5x" aria-hidden="true"></i></div>
			</div>
			<div class="row">
				<h3 align="center">
					Break Even Analysis
					<br>
					<small>
						This module is going to create a BreakEven point that would help you determine the predicted time by when your company starts to make profits.
					</small>
				</h3>
			</div>
		</div></a>
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
		<a href="investor.jsp"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
<div class="bigicon"><i class="fa fa-paypal fa-5x" aria-hidden="true"></i></div>
			</div>
			<div class="row">
				<h3 align="center">
					Investor/Startup Connections
					<br>
					<small>
						This module is an easy guide to connect with mutually beneficial startups and necessary investors.
					</small>
				</h3>
			</div>
		</div></a>
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
	</div>
<div class="row empty"></div>	
<div class="row">
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
		<a href="bmc.jsp"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
<div class="bigicon"><i class="fa fa-heartbeat fa-5x" aria-hidden="true"></i></div>
			</div>
			<div class="row">
				<h3 align="center">
					Business Model Creation
					<br>
					<small>
						With the help of Strategyzer's Business Model Canvas and Startat's BMC Algorithm, create a sustainable business model.
					</small>
				</h3>
			</div>
		</div></a>
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
		<a href="custmval.jsp"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
<div class="bigicon"><i class="fa fa-video-camera fa-5x" aria-hidden="true"></i></div>
			</div>
			<div class="row">
				<h3 align="center">
					Customer Validation
					<br>
					<small>
						With the help of a short video presentation and widely accessible sources you could use this tool for initial publicity as well as customer validation.
					</small>
				</h3>
			</div>
		</div></a>
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
		<a href="growth.jsp"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
<div class="bigicon"><i class="fa fa-bar-chart fa-5x" aria-hidden="true"></i></div>
			</div>
			<div class="row">
				<h3 align="center">
					Growth Prediction
					<br>
					<small>
						An analysis of your business model and current as well as historic data of your product domain using our state of the art algorithm, we predict a five to fifteen year growth model.
					</small>
				</h3>
			</div>
		</div></a>
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
	</div>	
</div>  
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
</body>
</html>