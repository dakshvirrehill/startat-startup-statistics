<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Company" %>
<%@ page import="model.DBOperations" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Financials" %>
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
<title>Break Even Analysis | <%=session.getAttribute("username") %></title>

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
<div class="container">
	<ol class="breadcrumb">
		<li><a href="dashboard.jsp">Dashboard</a></li>
		<li class="active">Break Even Analysis</li>
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
				<%if(c.getVerification().equals("Yes")) { %><a href="breakeven.jsp?name=<%=c.getCId() %>"><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div></a><%} else { %><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div><%} %>
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
<h2 align="center">Break Even Analysis</h2> 
 </div>
 <div class="empty"></div>
 <div class="row">
		<div class="col-sm-1 col-md-1 col-lg-1"></div>
		<a href="#year" id="yr"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
			<div class="bigicon">
				<i class="fa fa-pie-chart fa-5x" aria-hidden="true"></i>
			</div></div>
			<div class="row">
				<h3 align="center">
					Yearly
					<br>
				</h3>
			</div>
		</div></a>
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
		<a href="#month" id="mo"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
				<div class="bigicon">
				<i class="fa fa-line-chart fa-5x" aria-hidden="true"></i>
			</div></div>
			<div class="row">
				<h3 align="center">
					Monthly
					<br>
				</h3>
			</div>
		</div></a>
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
	     <a href="#day" id="da"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
				<div class="bigicon">
				<i class="fa fa-bar-chart fa-5x" aria-hidden="true"></i>
			</div></div>
			<div class="row">
				<h3 align="center">
					Daily
					<br>
				</h3>
			</div>
		</div></a>
		</div>
<div class="empty"></div>
<div class="empty"></div>
<div class="row"><h2>Tabular Financial Data</h2></div>
<div class="row">
  <div class="col-sm-1 col-md-1 col-lg-1"><h3>Serial no</h3></div>
  <div class="col-sm-2 col-md-2 col-lg-2"><h3>Finance name</h3></div>
  <div class="col-sm-2 col-md-2 col-lg-2"><h3>Finance type</h3></div>
  <div class="col-sm-2 col-md-2 col-lg-2"><h3>Financial amount</h3></div>
  <div class="col-sm-1 col-md-1 col-lg-1"><h3>Date</h3></div>
  <div class="col-sm-2 col-md-2 col-lg-2"><h3>Total Cost</h3></div>
  <div class="col-sm-2 col-md-2 col-lg-2"><h3>Total Revenue</h3></div>
</div>
<% Vector<Financials> finance=DBOperations.getFinancials(Integer.parseInt(cid)); 
	Financials fin=new Financials();
	Iterator i=finance.iterator();
	int in=1;
	while(i.hasNext()) {
		fin=(Financials)i.next();
		if(fin.getTotalCost()==fin.getTotalRev()) {
%>
<div class="row" style="background:red">
<%	} else{%>
 <div class="row">
 <% } %>
	<div class="col-sm-1 col-md-1 col-lg-1"><%=in %></div>
	<div class="col-sm-2 col-md-2 col-lg-2"><%=fin.getFinancial_Name() %></div>
	<div class="col-sm-2 col-md-2 col-lg-2"><%=fin.getFinancial_Type() %></div>
	<div class="col-sm-2 col-md-2 col-lg-2"><%=fin.getFinancialAmount() %></div>
	<div class="col-sm-1 col-md-1 col-lg-1"><%=fin.getDate() %></div>
	<div class="col-sm-2 col-md-2 col-lg-2"><%=fin.getTotalCost() %></div>
	<div class="col-sm-2 col-md-2 col-lg-2"><%=fin.getTotalRev() %></div>
</div>
<%
in=in+1;
	}
%>
<div class="empty"></div>
<div class="empty"></div>
<div id="year">
	<ul class="nav nav-pills">
    	<li><a data-toggle="pill" href="#graphical-saleyr">Graphical-sale</a></li>
    	<li><a data-toggle="pill" href="#graphical-monetaryyr">Graphical-monetary</a></li>
	</ul>
	<div id="graphical-saleyr" class="tab-pane fade">
      <h3>Graphical-sale</h3>
      <img src="">
    </div>
    <div id="graphical-monetaryyr" class="tab-pane fade">
      <h3>Graphical-monetary</h3>
      <img src="">
    </div>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="month">
	<ul class="nav nav-pills">
    	<li><a data-toggle="pill" href="#graphical-salemo">Graphical-sale</a></li>
    	<li><a data-toggle="pill" href="#graphical-monetarymo">Graphical-monetary</a></li>
	</ul>
	<div id="graphical-salemo" class="tab-pane fade">
      <h3>Graphical-sale</h3>
      <img src="">
    </div>
    <div id="graphical-monetarymo" class="tab-pane fade">
      <h3>Graphical-monetary</h3>
      <img src="">
    </div>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="day">
	<ul class="nav nav-pills">
    	<li><a data-toggle="pill" href="#graphical-saleda">Graphical-sale</a></li>
    	<li><a data-toggle="pill" href="#graphical-monetaryda">Graphical-monetary</a></li>
	</ul>
	<div id="graphical-saleda" class="tab-pane fade">
      <h3>Graphical-sale</h3>
      <img src="">
    </div>
    <div id="graphical-monetaryda" class="tab-pane fade">
      <h3>Graphical-monetary</h3>
      <img src="">
    </div>	
</div>
<%
}
%>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
<script type="text/javascript">
$(document).ready(function(){
	$('#yr').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();

	    // Store hash
	    var hash = this.hash;

	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	   
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#mo').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();

	    // Store hash
	    var hash = this.hash;

	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	   
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#da').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();

	    // Store hash
	    var hash = this.hash;

	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	   
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
});
</script>
</body>
</html>