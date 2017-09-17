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
	<ul class="nav navbar-nav navbar-right">
		<li><a href="UserHome.html">Home</a></li>
		<ul class="nav navbar-nav navbar-right">
                    					
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Case <span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li><a href="AdminLogin.html">Add Case </a></li>
						<li><a href="UserLogin.html">View Case </a></li>
						
						</ul>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Profile<span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li><a href="AdminRegistration.html">Update Profile</a></li>
						<li><a href="userRegistration.html">Change Password</a></li>
						
						</ul>
		<li><a href="index.html">Logout</a></li>
					
	</ul>
</div>
</div>
</nav>
		<div class="container body-content">
			<h1> User Home Page</h1>
			<hr>
			
				<div class="row">
		   
				<!-- Case Type -->
			
			</div>
			<hr/>
			<!-- FOOTER -->
			<footer>
				<b><p>&copy; 2017 - Case Management System</p></b>
			</footer>
		</div>

	</body>
</html>

