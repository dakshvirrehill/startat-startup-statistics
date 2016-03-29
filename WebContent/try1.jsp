<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>try</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style>

.background{
background:url("images/Untitled.png");
background-repeat:no-repeat;
position:fixed;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    margin-top:51px;
    margin-bottom:100px;
    }
.logo{
padding:250px;
padding-left:7px;
padding-right:5px;
}    
input[type=text] {
    width: 50%;
    padding: 12px 20px;
    margin: 10px 0;
    box-sizing: border-box;
    border: 2px solid red;
    border-radius: 10px;
}
textarea {
    width: 50%;
    height: 150px;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
    font-size: 16px;
    resize: none;
}
</style>
<body>
  
<nav class="navbar navbar-inverse">

    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="images/startat-logo-navabr.png"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="about.jsp"><span class="glyphicon glyphicon-user"></span> ABOUT</a></li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> LoGIN/SIGNUP</a></li>
    </ul>
 
</nav>
<div class="container-fluid">
  <div class="col-md-12 ">
    <div class="background">
       
        <h1><center><i><b>CONTACT</b></i></center></h1>    
          <form class="form-horizontal" role="form">
    <div class="form-group">
      <label class="control-label col-sm-2" for="fname">First Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="fname" placeholder="Enter first name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="lname">Last name:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="lname" placeholder="Enter last name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="email" placeholder="Enter email">
      </div>
    </div>
    <div class="form-group">        
      <label class="control-label col-sm-2" for="message">Message:</label>
        <div class="textarea">
          <textarea></textarea>
     <br>
     <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>     
        </div>
      </div>
    
    
  </form>
<div class="row">
    <div class="col-sm-4">
    <ul class="link">
 <li> <a href="#">link1</a></li>
 <li> <a href="#">link2</a></li>
 <li> <a href="#">link3</a></li>
</ul>
    </div>
<div class="col-sm-4">
    <ul class="link">
 <li><a href="#">link1</a>
  <li><a href="#">link2</a></li>
 <li><a href="#">link3</a></li>
</ul>
    </div>
<div class="col-sm-4">
    <ul class="link">
 <li><a href="#">link1</a></li>
 <li> <a href="#">link2</a></li>
  <li><a href="#">link3</a></li>
</ul>
    
</div>
   </div>    
   </div>
 </div>
    </div>
</body>
</head >
</html>    