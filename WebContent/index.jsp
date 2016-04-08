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
<title>Startat-Startup Statistics</title>
<style>
.empty {
clear:both;
padding-bottom:70px;
}
.top {
clear:both;
padding-top:50px;
}
.logo{
padding:350px;
padding-left:7px;
padding-right:5px;
}
.background {
margin-bottom:-1800px;
z-index:-5;
}

</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/"><img src="images/startat-logo-navbar.png"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="page.jsp?name=about">About</a></li>
      <li><a  href="#signup" data-toggle="modal" data-target=".bs-modal-sm" id="logins">Login/SignUp</a></li>
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
	<div class="row" id="landing">
	   <img src="images/cd.jpg" class="background" width="1900px">
       <div class="logo">
            <center><img src="images/startat-logo-large.png" width="400px" height="200px"> </center>
            <h2><center><a href="#module" class="btn btn-success btn-lg" id="km"><span class="fa fa-chevron-down"></span>Know More</a></center></h2>
       </div>
    </div>
    <div class="row empty"></div>
   <div class="row module" id="module">   
     <img src="images/cd.jpg" class="background" width="1900px" style="margin-top:-20px">
     <div class="row empty"></div>
     <div class="row empty"></div>
     <div class="row empty"></div>
     <div class="row">
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
		<a href="page.jsp?name=competitive"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
				<img src="images/startat-logo-navbar.png" class="img-circle">
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
		<a href="page.jsp?name=breakeven"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
				<img src="images/startat-logo-navbar.png" class="img-circle">
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
		<a href="page.jsp?name=investor"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
				<img src="images/startat-logo-navbar.png" class="img-circle">
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
		<a href="page.jsp?name=bmc"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
				<img src="images/startat-logo-navbar.png" class="img-circle">
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
		<a href="page.jsp?name=custmval"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
				<img src="images/startat-logo-navbar.png" class="img-circle">
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
		<a href="page.jsp?name=growth"><div class="col-sm-2 col-md-2 col-lg-2">
			<div class="row" align="center">
				<img src="images/startat-logo-navbar.png" class="img-circle">
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
<div class="row empty"></div>
<div class="row empty"></div>
<div class="row empty"></div>
<div class="row empty"></div> 
<div class="row quote" id="quote">
<img src="images/cd.jpg" class="background" width="1900px" style="margin-top:20px;">
       <div class="logo" style="padding-top:200px";>
            <center><img src="images/startat-logo-large.png" width="400px" height="200px"> </center>
          <p><h1>That's been one of my mantras - focus and simplicity. Simple can be harder than complex: You have to work hard to get your thinking clean to make it simple. But it's worth it in the end because once you get there, you can move mountains.</h1></p>
          <p><center><b><i><h2>Steve jobs</h2></i></b></center></p>
          <h2><center><a href="#signup" data-toggle="modal" data-target=".bs-modal-sm" class="btn btn-success btn-lg" id="login"><span class="fa fa-user-plus"></span>Sign Up Now</a></center></h2>
       </div>
</div>
<div class="contact-form" id="contact">
<img src="images/cd.jpg" class="background" width="1900px" style="margin-top:20px;margin-left:-20px">
<div class="col-sm-1 col-md-1 col-lg-1"></div>
<div class="col-sm-11 col-md-11 col-lg-11">
	<div class="row empty"></div>
	<div class="row empty"></div>
	<div class="row empty"></div>
	<div class="row empty"></div>
	<h2>Contact Us</h2>
	<form role="form" action="Contact" method="post" class="form-horizontal">
		<div class="form-group">
			<label for="name" class="control-label">Name:</label>
			<input type="text" class="form-control" placeholder="Enter your name" name="name" id="name">
		</div>
		<div class="form-group">
			<label for="email" class="control-label">Email Address:</label>
			<input type="text" class="form-control" placeholder="Enter your Email Address" name="email" id="email">
		</div>
		<div class="form-group">
			<label for="message" class="control-label">Message:</label>
			<textarea class="form-control" placeholder="Enter your query" row="4" name="message" id="message"></textarea>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-success btn-lg">Submit</button>
		</div>		
	</form>
</div>	
</div>
</div>  
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
<script type="text/javascript">
$(document).ready(function(){
	$('#km').on('click',function(event){
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