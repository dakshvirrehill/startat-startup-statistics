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
<title>Add Company | <%=session.getAttribute("username") %></title>
<style>
.empty {
clear:both;
padding-bottom:70px;
}
.top {
clear:both;
padding-top:50px;
}
#profile-preview {
margin:10px;
padding:310px;
height:auto;
width:auto;
}
#profile-picture-upload {
opacity:0;
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
<div class="empty top"></div>
<div class="container-fluid">
	<div class="alert alert-danger">${msg}</div>
	<form role="form" class="form-horizontal" method="post" action="Add_Comp" enctype="multipart/form-data">
		<div class="form-group">
			<label for="name" class="control-label">Company Name:</label>
			<input type="text" class="form-control" id="name" name="name" placeholder="Enter Company Name, Leave blank if not decided">
		</div>
		<div class="form-group">
			<label for="company_domain" class="control-label">Company Domain:</label>
			<select id="company_domain" name="company_domain" class="form-control" required>
				<option value="default">Select your company's domain of operations</option>
				<option value="Clothing">Clothing</option>
				<option value="Other">Others</option>
			</select>
		</div>
		<div class="form-group">
			<label for="email" class="control-label">Company's Official Email Address:</label>
			<input type="text" class="form-control" id="email" name="email" placeholder="Enter Email, Rewrite user email if not yet created" required>
		</div>
		<div class="form-group">
			<label for="website" class="control-label">Company's Official Website:</label>
			<input type="text" class="form-control" id="website" name="website" placeholder="Enter website, Leave blank if not yet created">
		</div>
		<div class="form-group">
			<label for="development_stage" class="control-label">Stage of Development:</label>
			<select id="development_stage" name="development_stage" class="form-control" required>
				<option value="default">Select the stage at which your company is right now</option>
				<option value="ideation">Ideation:Just thought of it</option>
				<option value="research">Research:Researching the domain</optiion>
				<option value="mvp">Minimum Viable Product/Customer Validation</option>
				<option value="established">Established:Has Initial customer base</option>
				<option value="higher">Higher Standing than the rest of the options</option>
			</select>
		</div>
		<div class="form-group">
			<label for="established" class="control-label">Launched In:(Select the date of ideation if not yet launched)</label>
			<input type="date" name="established" id="established" class="form-control" required>
		</div>
		<div class="form-group">
			<div id="profile-preview"></div>
      		<label for="profile-picture-upload" class="btn btn-primary" id="profile-picture">Upload Image Logo(upload a simple image with company name if logo not yet created)</label>
			<input type="file" class="form-control" id="profile-picture-upload" name="profile-picture" required>
      		<h3><small>Kindly upload an image of size 800x600 or of the same ratio for best results</small></h3>
		</div>
		<div class="form-group" align="right">
			<input type="text" name="username" value="<%=session.getAttribute("username") %>" hidden>
			<button type="submit" class="btn btn-primary">Add Company</button>
		</div>
	</form>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
<script src="js/jquery.uploadPreview.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  $.uploadPreview({
	    input_field: "#profile-picture-upload", 
	    preview_box: "#profile-preview",
	    label_field: "#profile-picture",  
	    label_default: "Upload Image Logo(upload a simple image with company name if logo not yet created)", 
	    label_selected: "Change Uploaded Image",
	    no_label: false 
	  });
	});
</script>
</body>
</html>