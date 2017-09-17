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
<link href="asset/css/main-style.css" rel="stylesheet">
<link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="asset/js/validation.js"></script>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<script>
$(document).ready(function () {
$("#frm").submit(function (e) {
if ($("#txtAdminPwd").val() != $("#txtAdminCPwd").val()) {
	e.preventDefault();
	alert('Password and confirm password should be same');
}
});
});



</script>
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
<h1> User Registration </h1>
<hr>
	<div class="row">
		<form action="" method="post">
				<fieldset>
				<div class="col-sm-12">
						<div class="row">
								<div class="col-sm-4 form-group">
									<label>First Name</label>
									<input id="firstName" placeholder="Enter First Name Here.." name="firstName" class="form-control" type="text"
									title="Please enter the valid name" required>
									<span id="error_firstName" class="text-danger"></span>
								</div>			
								<div class="col-sm-4 form-group">
									<label>Last Name</label>
									<input type="text" placeholder="Enter Last Name Here.." id="lastName" name="lastName" 
									class="form-control" required title="Please enter the valid name">
									<span id="error_lastName" class="text-danger"></span>
								</div>
								<div class="col-sm-4 form-group">
									<label>Contact Number</label>
									<input type="text" placeholder="Enter Phone No Here.." name="contactno" pattern="[0-9]{1}[0-9]{9}" 
									title="Phone number should be 10 digit" class="form-control" required>
								</div>	
						</div>
						<div class="row">                                             									
								<div class="col-sm-4 form-group">
									<label for="dob">Date Of Birth *</label>
									<input type="date" name="dob" id="dob" class="form-control">
									<span id="error_dob" class="text-danger" required ></span>	
								</div>	
								<div class="col-sm-4 form-group">
									<label>Address</label>
									<input type="text" placeholder="Enter Address Here.." name="address" id="address" 
									title="Please enter the valid address" class="form-control" required>
									<span id="error_address" class="text-danger"></span>
								</div>
								 <div class="col-sm-4 form-group">
									<label>Street</label>
									<input type="text" placeholder="Enter Street Here.." name="street" id="street" 
									class="form-control" title="Please enter the valid street name" required>
									<span id="error_street" class="text-danger"></span>
								</div>
						</div>
						
						<div class="row">
								<div class="col-sm-4 form-group">
									<label>City</label>
									<input type="text" placeholder="Enter City Name Here.." name="city" 
									class="form-control" id="city" title="Please enter the valid city name" required>
									<span id="error_city" class="text-danger"></span>
							   </div>										
								<div class="col-sm-4 form-group">
									<label>State</label>
									<input type="text" placeholder="Enter State Name Here.." name="state" id="state" 
									class="form-control" title="Please enter the valid state name" required>
									<span id="error_state" class="text-danger"></span>
								</div>	
								<div class="col-sm-4 form-group">
									<label>Zipcode</label>
									<input type="text" placeholder="Enter Zip Code Here.." name="zipcode" id="zipcode" 
									class="form-control" title="Please enter the valid zipcode" required>
									<span id="error_zipcode" class="text-danger"></span>
								</div>	
						</div>
						 <div class="row">
								<div class="col-sm-4 form-group">
								
									<label for="name">Email Id (User Name)</label>
									<input type="email" id="email" name="emailId" class="form-control" placeholder="Enter Email Id Here.." 
									value="" aria-describedby="name-format" title="Please enter the valid email id" required>
									<span id="name-format" class="help"> </span>
																																
								</div>                                      										                                               
								<div class="col-sm-4 form-group">
									<label>Password</label>
									<input type="password" placeholder="Enter Password Here.." name="password" 
									required type="password" id="password" class="form-control" title="Please enter the valid password">
									<span id="error_password" class="text-danger"></span>
								</div>
								<div class="col-sm-4 form-group">
									<label>Confirm Password</label>
									<input type="password" placeholder="Enter Confirm Password Here.." 
									type="password" required name="confirmpassword" id="confirmpassword" class="form-control">
									<span id="error_confirmpassword" class="text-danger" title="Please enter the same password"></span>
								</div>
								
						</div>	
						<div class="row">                                               											                                             
																										                                        
								<div class="col-sm-4 form-group">
									<label>Security Question </label>
									<select class="form-control input-sm" id="secQue" name="secQue" required>
										<option>-- Select Question --</option>
										<option>What is your favourite color?</option>
										<option>What is your pet name?</option>
										<option>What is your favourite place?</option>
									</select>
									<span id="error_yoe" class="text-danger"></span>
								</div>
                                                                <div class="col-sm-4 form-group">
									<label>Security Question Answer</label>
									<input type="text" placeholder="Enter Your Answer Here.." id="secqueAnswer" name="secqueAnswer" 
									class="form-control" required title="Please enter the valid answer">
									<span id="error_lastName" class="text-danger"></span>
                                                                </div>
						</div>
								
								<div class="submit" class="form-control">
									<input type="submit" value="Submit">
									
								</div>	
															
				</div>
				</fieldset>
		</form> 
	</div> 


</div>
</body>
</html>

