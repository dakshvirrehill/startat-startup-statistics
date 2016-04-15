<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Company" %>
<%@ page import="model.DBOperations" %>
<%@ page import="model.CompariScore" %>
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
<script src="js/jquery.countimator.js"></script>
<script src="js/jquery.countimator.wheel.js"></script>
<script data-example="examples">
$(document).ready(function(){
	$('.counter').countimator();
});
</script>
<%
if(session.getAttribute("username")==null)
{
String message="Kindly login before accessing this page";
request.setAttribute("msg",message);
response.sendRedirect("login.jsp");
}
%>
<title>Competitive Intelligence | <%=session.getAttribute("username") %></title>

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
		<li class="active">Competitive Intelligence</li>
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
				<%if(c.getVerification().equals("Yes")) { %><a href="competitive.jsp?name=<%=c.getCId() %>"><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div></a><%} else { %><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div><%} %>
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
 <% if(!DBOperations.isScoreSet(c.getCId())) {
%>
<h2 align="center">Competitive Intelligence</h2></div>
<div class="empty"></div>
<form class="form-horizontal" role="form" action="CompetitiveIntelligence" method="post">
	<div class="form-group">
		<label for="comparedwith" class="control-label">Compare To:</label>
		<select id="comparedwith" name="comparedwith" class="form-control">
			<option value="default">Select Company you would like to be compared to</option>
			<option value="myntra">Myntra</option>
		</select>
	</div>
	<div class="form-group">
		<label for="pop" class="control-label">Number of Customers:</label>
		<input type="text" id="pop" name="pop" class="form-control" placeholder="Enter the approximate number of customers that shop/visit your store/website on a daily basis">
	</div>
	<div class="form-group">
		<label for="custr" class="control-label">Number of Returning Customers:</label>
		<input type="text" id="custr" name="custr" class="form-control" placeholder="Enter the approximate number of returning customers that shop/visit your store/website on a daily basis">
	</div>
	<div class="form-group">
		<label for="cust18" class="control-label">Number of Visitors in the age group of 18-24:</label>
		<input type="text" id="cust18" name="cust18" class="form-control" placeholder="Enter the approximate number of visitors in the age group of 18-24(You can estimate this by the choice of clothing and the access method)">
	</div>
	<div class="form-group">
		<label for="cust25" class="control-label">Number of Visitors in the age group of 25-40:</label>
		<input type="text" id="cust25" name="cust25" class="form-control" placeholder="Enter the approximate number of visitors in the age group of 25-40(You can estimate this by the choice of clothing and the access method)">
	</div>
	<div class="form-group">
		<label for="cust40" class="control-label">Number of Visitors above the age of 40:</label>
		<input type="text" id="cust40" name="cust40" class="form-control" placeholder="Enter the approximate number of visitors above the age of 40(You can estimate this by the choice of clothing and the access method)">
	</div>
	<div class="form-group">
		<label for="value" class="control-label">Value Proposition:</label>
		<input type="text" id="value" name="value" class="form-control" placeholder="Enter your unique selling point(Separate each with semicolon)">
	</div>	
	<div class="form-group">
		<input type="text" name="cid" value="<%=cid %>" hidden>
		<button type="submit" class="btn btn-primary">Compare</button>
	</div>
</form>
<%	 	
 } else {
		CompariScore comp=DBOperations.getScore(Integer.parseInt(cid));
 %>
<h2 align="center">Competitive Intelligence <small>Compared With-<%=comp.getComparisionWith() %></small></h2> 
 </div>
 <div class="empty"></div>
 <h2>CompariScore</h2>
 <div class="row">
 	<div class="col-sm-2 col-md-2 col-lg-2"></div>
 	<div class="col-sm-4 col-md-4 col-lg-4"><a id="pp" href="#pop">
 <h3>Popularity</h3>
           <div data-example="example9">
             <div class="counter counter-wheel counter-wheel-themed" data-style="wheel" data-max="100" data-value="<%=comp.getPopularityScore() %>" data-pad="2" data-value-color="#E71232" data-max-color="#131432" data-vertical-align="justify" data-line-width="15">
               <script type="text/x-handlebars-template">
                 <div>
                   <div class="counter-values">
                     <span style="color: {{valueColor}}">{{count}}</span><span class="counter-separator">/</span><span style="color: {{maxColor}}">{{max}}</span>
                   </div>
                 </div>
               </script>
             </div>
           </div></a>      
 	</div>
 	<div class="col-sm-4 col-md-4 col-lg-4">
 <a id="cr" href="#cusr"><h3>Customer Relationships</h3>		
           <div data-example="example9">
             <div class="counter counter-wheel counter-wheel-themed" data-style="wheel" data-max="100" data-value="<%=comp.getCustomerRelationshipScore() %>" data-pad="2" data-value-color="#E71232" data-max-color="#131432" data-vertical-align="justify" data-line-width="15">
               <script type="text/x-handlebars-template">
                 <div>
                   <div class="counter-values">
                     <span style="color: {{valueColor}}">{{count}}</span><span class="counter-separator">/</span><span style="color: {{maxColor}}">{{max}}</span>
                   </div>
                 </div>
               </script>
             </div>
           </div></a> 
 	</div>
 	<div class="col-sm-2 col-md-2 col-lg-2"></div>
 </div>
 <div class="empty"></div>
  <div class="row">
 	<div class="col-sm-2 col-md-2 col-lg-2"></div>
 	<div class="col-sm-4 col-md-4 col-lg-4"><a href="#cuss" id="cs">
 <h3>Target Audience</h3>		
           <div data-example="example9">
             <div class="counter counter-wheel counter-wheel-themed" data-style="wheel" data-max="100" data-value="<%=comp.getCustomerSegmentScore() %>" data-pad="2" data-value-color="#E71232" data-max-color="#131432" data-vertical-align="justify" data-line-width="15">
               <script type="text/x-handlebars-template">
                 <div>
                   <div class="counter-values">
                     <span style="color: {{valueColor}}">{{count}}</span><span class="counter-separator">/</span><span style="color: {{maxColor}}">{{max}}</span>
                   </div>
                 </div>
               </script>
             </div>
           </div></a> 
 	</div>
 	<div class="col-sm-4 col-md-4 col-lg-4">
 <a href="#valp" id="vp"><h3>Value Proposition</h3>		
           <div data-example="example9">
             <div class="counter counter-wheel counter-wheel-themed" data-style="wheel" data-max="100" data-value="<%=comp.getValuePropositionsScore() %>" data-pad="2" data-value-color="#E71232" data-max-color="#131432" data-vertical-align="justify" data-line-width="15">
               <script type="text/x-handlebars-template">
                 <div>
                   <div class="counter-values">
                     <span style="color: {{valueColor}}">{{count}}</span><span class="counter-separator">/</span><span style="color: {{maxColor}}">{{max}}</span>
                   </div>
                 </div>
               </script>
             </div>
           </div></a> 
 	</div>
 	<div class="col-sm-2 col-md-2 col-lg-2"></div>
 </div>
 <div class="empty"></div>
 <div class="empty"></div>
 <div class="empty"></div>
<div class="row" id="pop">
<h3>Popularity</h3>
<div class="col-sm-2 col-md-2 col-lg-2">
           <div data-example="example9">
             <div class="counter counter-wheel counter-wheel-themed" data-style="wheel" data-max="100" data-value="<%=comp.getPopularityScore() %>" data-pad="2" data-value-color="#E71232" data-max-color="#131432" data-vertical-align="justify" data-line-width="15">
               <script type="text/x-handlebars-template">
                 <div>
                   <div class="counter-values">
                     <span style="color: {{valueColor}}">{{count}}</span><span class="counter-separator">/</span><span style="color: {{maxColor}}">{{max}}</span>
                   </div>
                 </div>
               </script>
             </div>
           </div>
</div>
<div class="col-sm-10 col-md-10 col-lg-10">
<p><%=comp.getPopularity() %></p>
</div> 			
</div>
<div class="row" id="cusr">
 <h3>Customer Relationships</h3>
<div class="col-sm-2 col-md-2 col-lg-2">		
           <div data-example="example9">
             <div class="counter counter-wheel counter-wheel-themed" data-style="wheel" data-max="100" data-value="<%=comp.getCustomerRelationshipScore() %>" data-pad="2" data-value-color="#E71232" data-max-color="#131432" data-vertical-align="justify" data-line-width="15">
               <script type="text/x-handlebars-template">
                 <div>
                   <div class="counter-values">
                     <span style="color: {{valueColor}}">{{count}}</span><span class="counter-separator">/</span><span style="color: {{maxColor}}">{{max}}</span>
                   </div>
                 </div>
               </script>
             </div>
           </div>
</div>
<div class="col-sm-10 col-md-10 col-lg-10">
<p><%=comp.getCustomerRelationship() %></p>
</div> 			 	
</div>
<div class="row" id="cuss">
<h3>Target Audience</h3>		
<div class="col-sm-2 col-md-2 col-lg-2">
          <div data-example="example9">
             <div class="counter counter-wheel counter-wheel-themed" data-style="wheel" data-max="100" data-value="<%=comp.getCustomerSegmentScore() %>" data-pad="2" data-value-color="#E71232" data-max-color="#131432" data-vertical-align="justify" data-line-width="15">
               <script type="text/x-handlebars-template">
                 <div>
                   <div class="counter-values">
                     <span style="color: {{valueColor}}">{{count}}</span><span class="counter-separator">/</span><span style="color: {{maxColor}}">{{max}}</span>
                   </div>
                 </div>
               </script>
             </div>
           </div>
</div>
<div class="col-sm-10 col-md-10 col-lg-10">
<p><%=comp.getCustomerSegment() %></p>
</div> 			  	
</div>
<div class="row" id="valp">
<h3>Value Proposition</h3>		
<div class="col-sm-2 col-md-2 col-lg-2">
          <div data-example="example9">
             <div class="counter counter-wheel counter-wheel-themed" data-style="wheel" data-max="100" data-value="<%=comp.getValuePropositionsScore() %>" data-pad="2" data-value-color="#E71232" data-max-color="#131432" data-vertical-align="justify" data-line-width="15">
               <script type="text/x-handlebars-template">
                 <div>
                   <div class="counter-values">
                     <span style="color: {{valueColor}}">{{count}}</span><span class="counter-separator">/</span><span style="color: {{maxColor}}">{{max}}</span>
                   </div>
                 </div>
               </script>
             </div>
           </div>
</div>
<div class="col-sm-10 col-md-10 col-lg-10">
<p><%=comp.getValueProposition() %></p>
</div> 			  	
</div>
           <style data-example="example9">
             .counter.counter-wheel.counter-wheel-themed {
               background-color: transparent;
               border: lightgray solid 10px;
               color: #000;
               width: 200px;
               padding: 15px;
               font-size: 14px;
               text-transform: uppercase;
               line-height: 1em;
             }
             
             .counter.counter-wheel.counter-wheel-themed .counter-values {
               font-size: 42px;
               font-weight: bold;
               line-height: 1.2em;
             }
             
             .counter.counter-wheel.counter-wheel-themed .counter-separator {
               margin: 0 2px 0 3px;
             }
             
             .counter.counter-wheel.counter-wheel-themed .counter-body {
               border: lightgray solid 10px;
               border-radius: 50%;
               padding: 25px 0;
             }
               
           </style>
<script type="text/javascript">
$(document).ready(function(){
	$('#pp').on('click',function(event){
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
	$('#cr').on('click',function(event){
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
	$('#cs').on('click',function(event){
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
	$('#vp').on('click',function(event){
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
<%
 }
}
%>
</div>
</body>
</html>