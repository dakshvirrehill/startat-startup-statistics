<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Company" %>
<%@ page import="model.DBOperations" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
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
<title>Growth Prediction | <%=session.getAttribute("username") %></title>

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
<div class="container">
	<ol class="breadcrumb">
		<li><a href="dashboard.jsp">Dashboard</a></li>
		<li class="active">Growth Prediction</li>
	</ol>
</div>
<div class="empty"></div>
<div class="container-fluid">
<%
if(request.getParameter("name")==null)
{
	Vector<Company> company=DBOperations.getAllCompanyDetails((String) session.getAttribute("username"));
	Iterator i=company.iterator();
	if(!i.hasNext())
		{
			%>
			<div class="alert alert-info">No Companies added yet. <a href="addcomp.jsp">Add Now</a></div>
			<%
		}
		else {
			%>
			<div class="row">
				<div class="col-sm-2 col-md-2 col-lg-2">SNo.</div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-2 col-md-2 col-lg-2">Name</div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-2 col-md-2 col-lg-2">Domain</div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-3 col-md-3 col-lg-3">Verified</div>
			</div>
			<%
			Company c=new Company();
			int j=0;
			while(i.hasNext()) {
				c=(Company)i.next();
				j++;
			%>
			<div class="row">
				<div class="col-sm-2 col-md-2 col-lg-2"><%=j %></div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<%if(c.getVerification().equals("Yes")) { %><a href="growth.jsp?name=<%=c.getCId() %>"><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div></a><%} else { %><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div><%} %>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-2 col-md-2 col-lg-2"><%=c.getField_of_interest() %></div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-3 col-md-3 col-lg-3"><%=c.getVerification() %><%if(c.getVerification().equals("No")){%><a class="btn btn-primary" href="addveri.jsp?name=<%=c.getCId()%>">Get Verified</a><%} %></div>
			</div>
			<%	
			}
		}
}
else {
	String cid=request.getParameter("name");
	Company c=DBOperations.getCompanyDetails(Integer.parseInt(cid));
%>
<div class="jumbotron">
 <div align="right"><img src="<%=c.getLogo_path()%>"></div><h1><%=c.getName() %></h1><h3><a href="<%=c.getWebsite() %>"><%=c.getWebsite()%></a></h3><h3><a href="mailto:<%=c.getEmail() %>"><%=c.getEmail()%></a></h3>
<h2 align="center">Growth Prediction</h2> 
 </div>
 <div class="empty"></div>
 <form action="GrowthPrediction" role="form" class="form-horizontal" method="post">
 	<div class="form-group">
 		<label for="years" class="control-label">No. of Years:</label>
 		<input type="text" class="form-control" id="years" name="years" placeholder="Enter the number of years you want the prediction of including current year">
 	</div>
 	<div class="form-group">
 	<input type="text" name="cid" value="<%=cid %>" hidden>
 		<button type="submit" class="btn btn-primary">Submit</button>
 	</div>
 </form>
 <div class="empty"></div>
 <div class="empty"></div> 
 <img id="growthgraph" src="useruploads/<%=cid %>_<%=session.getAttribute("username") %>_growth.jpg">
<%
}
%>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
</body>
</html>