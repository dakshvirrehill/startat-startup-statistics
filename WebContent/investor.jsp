<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Connections" %>
<%@ page import="model.Company" %>
<%@ page import="model.Investor" %>
<%@ page import="model.Startup" %>
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
<title>InvStart | <%=session.getAttribute("username") %></title>

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
		<li class="active">InvStart</li>
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
				<%if(c.getVerification().equals("Yes")) { %><a href="investor.jsp?name=<%=c.getField_of_interest() %>&CId=<%=c.getCId() %>"><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div></a><%} else { %><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div><%} %>
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
	String need=DBOperations.getNeed(Integer.parseInt((String)request.getParameter("CId")));
%>
<div class="jumbotron">
 <h1 align="center">Investor/Startup Connections</h1> 
 </div>
 <div class="empty"></div>
<%
	if(need=="unset"){
%>
<form action="AddNeed" method="post" role="form" class="form-horizontal">
	<div class="form-group">
		<label for="need" class="control-label">Need:</label>
		<input id="need" name="need" class="form-control" placeholder="Enter your need if any(for startup bonding not for investors)" required>
	</div>
	<div class="form-group">
		<input type="text" name="name" value="<%=request.getParameter("name") %>" hidden>
		<input type="text" name="CId" value="<%=request.getParameter("CId") %>" hidden>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>
<%		
	}
	else
	{
	Connections c=DBOperations.getPossibleConnections((String)request.getParameter("name"),need);
	Vector<Investor> i=c.getInvestor();
	Vector<Startup> s=c.getStartup();
	%>
 <div class="col-sm-6 col-md-6 col-lg-6">
 	<div class="row"><h2>Investors <small>you might be interested in</small></h2></div>
 	<div class="empty"></div>
 	<div class="row">
 		<div class="col-sm-2 col-md-2 col-lg-2">S.No.</div>
 		<div class="col-sm-3 col-md-3 col-lg 3">Name</div>
 		<div class="col-sm-3 col-md-3 col-lg-3">Max Investment</div>
 		<div class="col-sm-4 col-md-4 col-lg-4">Contact</div>
 	</div>
<% 
Iterator j=i.iterator();
if(!j.hasNext()) {
%>
<h3>None for now. Stay tuned... we update are list frequently</h3>
<%
}
int count=0;
while(j.hasNext()) {
	count++;
	Investor inv=(Investor)j.next();
%>
<div class="row">
	<div class="col-sm-2 col-md-2 col-lg-2"><%=count %></div>
	<div class="col-sm-3 col-md-3 col-lg 3"><%=inv.getName() %></div>
	<div class="col-sm-3 col-md-3 col-lg-3"><%=inv.getMax_investment() %></div>
	<div class="col-sm-4 col-md-4 col-lg-4"><a href="<%=inv.getWebsite() %>"><%=inv.getWebsite() %></a></div>
</div>
<%	
}
%>
 </div>
 <div class="col-sm-6 col-md-6 col-lg-6">
 	<div class="row"><h2>Startups <small>that can be mutually beneficial</small></h2></div>
 	<div class="empty"></div>
 	<div class="row">
 		<div class="col-sm-1 col-md-1 col-lg-1">S.No.</div>
 		<div class="col-sm-2 col-md-2 col-lg 2">Name</div>
 		<div class="col-sm-3 col-md-3 col-lg-3">Domain</div>
 		<div class="col-sm-3 col-md-3 col-lg-3">Need</div>
 		<div class="col-sm-3 col-md-3 col-lg-3">Contact</div>
 	</div>
<% 
j=s.iterator();
if(!j.hasNext())
{
%>
<h3>None for now. Stay tuned... we update are list frequently</h3>
<%
}
count=0;
while(j.hasNext()) {
	count++;
	Startup str=(Startup)j.next();
%>
<div class="row">
	<div class="col-sm-1 col-md-1 col-lg-1"><%=count %></div>
	<div class="col-sm-2 col-md-2 col-lg 2"><%=str.getName() %></div>
	<div class="col-sm-3 col-md-3 col-lg-3"><%=str.getField_of_interest() %></div>
	<div class="col-sm-3 col-md-3 col-lg-3"><%=str.getNeed() %></div>
	<div class="col-sm-3 col-md-3 col-lg-3"><a href="<%=str.getWebsite() %>"><%=str.getWebsite() %></a></div>
</div>
<% 
}
%>
 </div>
<%
	}
}
%>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
</body>
</html>