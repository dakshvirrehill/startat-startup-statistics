<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User" %>
<%@ page import="model.DBOperations" %>
<%@ page import="java.util.Vector" %>
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
<title>Profile | <%=session.getAttribute("username") %></title>
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
          <li><a href="profile.jsp">profile</a></li>
          <li><a href="settings.jsp">Settings</a></li>
          <li><a href="logout">Logout</a></li> 
        </ul>
      </li>
    </ul>
  </div>
</nav>
<div class="empty top"></div>
<div class="container-fluid">
<% String username=(String) session.getAttribute("username");
	int status=DBOperations.checkStatus(username);
	User user=new User();
	user=DBOperations.getUserDetails(username);
	if(status==0){
%>
<form role="form" class="form-horizontal" action="Chprodet" method="post" enctype="multipart/form-data">
	<div id="profile-detail-form" class="carousel slide" data-ride="carousel" data-interval="false" data-wrap="false">
  <ol class="carousel-indicators">
    <li data-target="#profile-detail-form" data-slide-to="0" class="active"></li>
    <li data-target="#profile-detail-form" data-slide-to="1"></li>
    <li data-target="#profile-detail-form" data-slide-to="2"></li>
    <li data-target="#profile-detail-form" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active form-group">
    	<div class="empty"></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"></div>
      	<div class="col-sm-4 col-md-4 col-lg-4">
    	<label for="name" class="control-label">Name:</label>
		<input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" value="" required>
    	</div>
    	<div class="col-sm-4 col-md-4 col-lg-4"></div>
    	<div class="empty"></div>
    </div>
    <div class="item form-group">
    	<div class="empty"></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"></div>
      	<div class="col-sm-4 col-md-4 col-lg-4">
      	<label for="description" class="control-label">Short Description:</label>
		<textarea class="form-control" id="description" name="description" rows="4" placeholder="Enter something that describes your goals and achievements" required></textarea>
    	</div>
    	<div class="col-sm-4 col-md-4 col-lg-4"></div>
    	<div class="empty"></div>
    </div>
    <div class="item form-group">
      	<div class="empty"></div>
      	<div class="col-sm-4 col-md-4 col-lg-4"></div>
      	<div class="col-sm-4 col-md-4 col-lg-4">
      		<div id="profile-preview"></div>
      		<label for="profile-picture-upload" class="btn btn-primary" id="profile-picture">Upload Profile Picture</label>
			<input type="file" class="form-control" id="profile-picture-upload" name="profile-picture" required>
      		<h3><small>Kindly upload an image of size 800x600 or of the same ratio for best results</small></h3>
      	</div>
      	<div class="col-sm-4 col-md-4 col-lg-4"></div>
      	<div class="empty"></div>
    </div>
  </div>
  <div class="item form-group">
    	<div class="empty"></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"></div>
      	<div class="col-sm-4 col-md-4 col-lg-4">
      	<input type="text" name="username" value="<%=session.getAttribute("username") %>" hidden>
    		<button type="submit" class="btn btn-primary">Save Changes</button>
    	</div>
    	<div class="col-sm-4 col-md-4 col-lg-4"></div>
    	<div class="empty"></div>
    </div>
  <a class="left carousel-control" href="#profile-detail-form" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#profile-detail-form" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
</form>
<%}
  else {
%>
<div class="row">
 <div class="col-sm-1 col-md-1 col-lg-1"></div>
 <div class="col-sm-3 col-md-3 col-lg-3">
 	<img src="<%=user.getProfile_pic_path() %>" class="img-rounded profilepic">
 </div>
 <div class="col-sm-3 col-md-3 col-lg-3">
 	<h1><%=user.getName() %></h1><br>
 	<h3><%=user.getDescription() %></h3>
 </div>
 <div class="col-sm-4 col=md-2 col-lg-2">
 	<% %>
 </div>
 <div class="col-sm-1 col-md-1 col-lg-1"></div>
</div>
<%
}
%>
<form role="form" class="form-horizontal" action="StatusUpdate" method="post">
	<div class="form-group">
		<label for="status" class="control-label">Status:</label>
		<textarea class="form-control" id="status" name="status" rows="4" placeholder="Whats on your mind?"></textarea>
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary" align="right">Update</button>
	</div>
</form>
<% %>
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
	    label_default: "Upload Profile Picture", 
	    label_selected: "Change Profile Picture",
	    no_label: false 
	  });
	});
</script>
</body>
</html>