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
	response.sendRedirect("dashboard.jsp");
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
      <a class="navbar-brand" href="index.jsp"><img src="images/startat-logo-navbar.png"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="page.jsp?name=about">About</a></li>
      <li><a  href="#signup" data-toggle="modal" data-target=".bs-modal-sm" id="login">Login/SignUp</a></li>
    </ul>
  </div>
</nav>
<!-- Modal -->
<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <br>
        <div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#signin" data-toggle="tab">Log In</a></li>
              <li class=""><a href="#signup" data-toggle="tab">Sign Up</a></li>
              <li class=""><a href="#why" data-toggle="tab">Why?</a></li>
            </ul>
        </div>
      <div class="modal-body">
        <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in" id="why">
        <p>We need this information so that you can receive access to the site and its content. Rest assured your information will not be sold, traded, or given to anyone.</p>
        <p></p><br> Please contact <a mailto:href="dakshvirr@gmail.com"></a>dakshvirr@gmail.com</a> for any other inquiries.</p>
        </div>
        <div class="tab-pane fade active in" id="signin">
            <form class="form-horizontal" action="Login" method="post">
            <fieldset>
            <!-- Sign In Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="lusername">Username:</label>
              <div class="controls">
                <input required="" id="lusername" name="lusername" type="text" class="form-control" placeholder="Enter your username" class="input-medium" required>
              </div>
            </div>

            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="ppassword">Password:</label>
              <div class="controls">
                <input required id="ppassword" name="ppassword" class="form-control" type="password" placeholder="********" class="input-medium">
              </div>
            </div>

            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button id="signin" name="signin" class="btn btn-success" type="submit">Sign In</button>
              </div>
            </div>
            </fieldset>
            </form>
        </div>
        <div class="tab-pane fade" id="signup">
            <form class="form-horizontal" action="Register" method="post">
            <fieldset>
            <!-- Sign Up Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="email">Email:</label>
              <div class="controls">
                <input id="email" name="email" class="form-control" type="text" placeholder="Enter a valid email address" class="input-large" required>
              </div>
            </div>
            
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="username">Username:</label>
              <div class="controls">
                <input id="username" name="username" class="form-control" type="text" placeholder="Enter your username" class="input-large" required>
              </div>
            </div>
            
            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="password">Password:</label>
              <div class="controls">
                <input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required>
                <em>1-8 Characters</em>
              </div>
            </div>
            
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="cpassword">Re-Enter Password:</label>
              <div class="controls">
                <input id="cpassword" class="form-control" name="cpassword" type="password" placeholder="********" class="input-large" required="">
              </div>
            </div>
            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="confirmsignup"></label>
              <div class="controls">
                <button id="confirmsignup" name="confirmsignup" class="btn btn-success" type="submit">Sign Up</button>
              </div>
            </div>
            </fieldset>
            </form>
      </div>
    </div>
      </div>
      <div class="modal-footer">
      <center>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </center>
      </div>
    </div>
  </div>
</div>

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