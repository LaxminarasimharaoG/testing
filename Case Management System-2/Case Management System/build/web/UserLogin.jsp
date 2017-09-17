<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Case Management System</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="asset/css/bootstrap.min.css" rel="stylesheet">
		<link href="asset/css/modern-business.css" rel="stylesheet">
		<link href="asset/css/form.css" rel="stylesheet">
		<link href="asset/css/style.css" rel="stylesheet">
		<link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<script src="asset/js/jquery.min.js"></script>
		<script src="asset/js/bootstrap.min.js"></script>
		
		<style>
			
			
			
		</style>
	</head>
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container">
<div class="navbar-header">   
	<a asp-area="" asp-controller="Home" asp-action="Index" class="navbar-brand" >Case Management System</a>
</div>
<div class="navbar-collapse collapse">
	<ul class="nav navbar-nav navbar-left">
		<li><a href="index.jsp">Home</a></li>
		<ul class="nav navbar-nav navbar-right">
                    					
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Login <span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li><a href="AdminLogin.jsp">Admin Login</a></li>
						<li><a href="UserLogin.jsp">User Login</a></li>
						<li><a href="AttorneyLogin.jsp">Attorney Login</a></li>
						</ul>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Registration<span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li><a href="AdminRegistration.jsp">Admin Registration</a></li>
						<li><a href="userRegistration.jsp">User Registration</a></li>
						<li><a href="AttorneyRegistration.jsp">Attorney Registration</a></li>
						</ul>
		<li><a href="AboutUs.jsp">About</a></li>
		<li><a href="ContactUs.jsp">Contact</a></li>				
	</ul>
</div>
</div>
</nav>
		<div class="container body-content">
			<h1> User Login Page </h1>
			<hr>
			<h3> User Login </h3>
		   <div class="row">
		   
				<!-- USER -->
			<div id="user">
						<div class="col-lg-12">
							<div class="form">
								<form action="UserController?action=loginCheck" method="post" class="login-frm">

									<div class="form-group" text-align="center">
										<label><font size="3" color="black"> User Name</font> </label><input type="text" name="txtMailId" placeholder="Username" required="required"/>
									</div>

									<div class="form-group">
										<label><font size="3" color="black"> Password</font></label><input type="password" placeholder="Password" name="txtPwd" required="required"/>
									</div>
										<div class="inputWrap" style="padding-left: 170px">
									<button type="submit" class="">Log In</button>
								</div><br>
									
									<div class="form-group" style="padding-left: 170px">                            
										 <label><a href="register.jsp"><font size="3" color="red"> New User Registration | </font></a></label>
										 <label><a href="register.jsp"> <font size="3" color="red"> Forgot Password</font></a></label>
									</div>
								</form>
							</div>
						</div>
					</div>
				
			</div><!-- /. -->
			
			
		</div>

	</body>
</html>

