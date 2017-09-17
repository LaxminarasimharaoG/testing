<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  
<!--  <link href="asset/css/bootstrap.min.css" rel="stylesheet">
    <link href="asset/css/modern-business.css" rel="stylesheet">
    <link href="asset/css/form.css" rel="stylesheet">
    <link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
	<script -->
 <style>


 /*Panel tabs*/
.panel-tabs {
    position: relative;
    bottom: 30px;
    clear:both;
    border-bottom: 1px solid transparent;
}

.panel-tabs > li {
    float: left;
    margin-bottom: -1px;
}

.panel-tabs > li > a {
    margin-right: 2px;
    margin-top: 4px;
    line-height: .85;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
    color: #989878;
}

.panel-tabs > li > a:hover {
    border-color: transparent;
	border-color: #590900;
    color: #ffffff;
    background-color: red;
}

.panel-tabs > li.active > a,
.panel-tabs > li.active > a:hover,
.panel-tabs > li.active > a:focus {
    color: #989878;
    cursor: default;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    background-color: rgba(255,255,255, .23);
    border-bottom-color: transparent;
}
 body{
	background-color: #e3f2fd;
	}
hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 3px solid #123455;
    margin: 1em 0;
    padding: 0; 
}

footer
{
width:60%;
}


/* Navbar */
.navbar-header 
{
font: normal bold 12px/30px Georgia, serif;
}
.navbar-nav
{
font: normal bold 12px/30px Georgia, serif;
}
.navbar-inverse 
{
font: normal bold 12px/30px Georgia, serif;
}
.navbar {
   background-color: #3b7687;
   border-color: #590900;
   
}

.navbar .navbar-brand {
   color: white;
}

.navbar .navbar-text {
   color: white;
}


.navbar .navbar-nav > li > a {
   color: white;
}

.navbar .navbar-nav > .dropdown > a .caret {
   border-top-color: white;
   border-bottom-color: white;
   color: white;
}

.navbar-inner {
   min-height: 50px;
}

.collapse {
   color: #7A0D00;
}

.navbar.collapse {
   color: #7A0D00;
}

.navbar .navbar-toggle {
}
 </style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">   
                <a asp-area="" asp-controller="Home" asp-action="Index" class="navbar-brand" >AIT Student Management System</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    	<li class="active"><a href="AdminRegistration.html">Home</a></li>
						<li><a href="AdminLogin.html">About</a></li>
						<li><a href="StaffRegistration.html">Contact</a></li>				
            </ul>
            </div>
        </div>
    </nav>
  <br><br>
<div class="container body-content">

    <div class="row">
<div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i> Investigation Phase</h4>
                </div>
                <div class="panel-body">
                    <img src="asset/img/banner.jpg" width="500" height="275">
                </div>
            </div>
        </div>        
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        
						<h4><i class="fa fa-fw fa-check"></i> Log-In</h4>
						
						<span class="pull-left">
                        <!-- Tabs -->
						<br>
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="test.html" data-toggle="tab"><b>User</b></a></li>
                            <li><a href="#tab2" data-toggle="tab"><b>Admin</b></a></li>
                            <li><a href="#tab3" data-toggle="tab"><b>Employee</b></a></li>                           
                        </ul>						
                    </span>
                    </div>
					<br><br>
					<div id="user">
						<div class="panel-body">
							<div class="form">
								<form action="UserController?action=loginCheck" method="post" class="login-frm">

									<div class="row">
										<label>Mail Id:</label><input type="text" name="txtMailId" required="required"/>
									</div>

									<div class="row">
										<label>Password:</label><input type="password" name="txtPwd" required="required"/>
									</div>
									<div class="row" style="padding-left: 180px">
										<button type="submit" class="btn btn-primary">Log In</button>
									</div>
									
									<div class="row" style="padding-left: 180px">                            
										 <label><a href="register.jsp"> New User Registration</a></label>
									</div> 
									<div class="row" style="padding-left: 180px">                            
										 <label><a href="register.jsp"> Forgot Password</a></label>
									</div> 
									
								</form>
							</div>
						</div>
					</div>
					
					
					
                </div>
            </div>
    
</div>
<hr/>
		
        <footer>
            <p>&copy; 2017 - AIT Student Management System</p>
        </footer>
		
</div>
        
</body>
</html>
