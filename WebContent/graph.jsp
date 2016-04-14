<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <title>Insert title here</title>
</head>
<style>
.text{
text-shadow: 
	2px 4px 0 lightblue,
	1px 3px 0 #444; 
 font-size:20px;
}
</style>
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
<div class="jumbotron">
  <h3>Break even analysis Yearly</h3> 
 </div>
<ol class="breadcrumb">
  <li><a href="#">Dashboard</a></li>
  <li><a href="#">Display break even</a></li>
  <li class="active">Yearly</li>
</ol>
<div class="container">
  
  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#tabular">Tabular</a></li>
    <li><a data-toggle="pill" href="#graphical-sale">Graphical-sale</a></li>
    <li><a data-toggle="pill" href="#graphical-monetary">Graphical-monetary</a></li>
    
  </ul>
  
  <div class="tab-content">
    <div id="tabular" class="tab-pane fade in active">
      <h3>Tabular</h3>
      <div class="row">
  <div class="text">
  <div class="col-sm-1"></div>
  <div class="col-sm-2"><b><h3>Serial no</h3></b></div>
  <div class="col-sm-2"><b><h3>Finance name</h3></b></div>
  <div class="col-sm-2"><b><h3>Finance type</h3></b></div>
  <div class="col-sm-2"><b><h3>Financial amount</h3></b></div>
  <div class="col-sm-2"><b><h3>Date</h3></b></div>
  <div class="col-sm-1"></div>
</div>
</div>
<div class="row">
 <div class="text">
  <div class="col-sm-1"></div>
  <div class="col-sm-2">1</div>
  <div class="col-sm-2">Iphone</div>
  <div class="col-sm-2">benefit</div>
  <div class="col-sm-2">50000</div>
  <div class="col-sm-2">8/1/2015</div>
  <div class="col-sm-1"></div>
</div>
</div>
<div class="row">
  <div class="text">
  <div class="col-sm-1"></div>
  <div class="col-sm-2">2</div>
  <div class="col-sm-2">battery</div>
  <div class="col-sm-2">cost</div>
  <div class="col-sm-2">8000</div>
  <div class="col-sm-2">22/10/2015</div>
  <div class="col-sm-1"></div>
</div>
</div>
    </div>
    <div id="graphical-sale" class="tab-pane fade">
      <h3>Graphical-sale</h3>
    </div>
    <div id="graphical-monetary" class="tab-pane fade">
      <h3>Graphical-monetary</h3>
    </div>
    
  </div>
</div>


</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>


</script>
</html>