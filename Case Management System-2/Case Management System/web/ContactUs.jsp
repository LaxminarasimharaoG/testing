<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Case Management System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="asset/css/bootstrap.min.css">
<link href="asset/css/modern-business.css" rel="stylesheet">
<link href="asset/css/style.css" rel="stylesheet">
<script src="asset/js/validation.js"></script>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $("#myAccount").click(function(e)
        {
            alert('Access Denied');
            e.preventDefault();
        });
        $("#updateDatabase").click(function(e)
        {
            alert('Access Denied');
            e.preventDefault();
        });
    });
</script>
</head>
<body>

<nav class="navbar">
    <div id="floatingMenu">		
        <div class="navbar-header"> 
            <a class="navbar-brand" href="index.jsp">
                <img src="asset/img/logo.png" width="150px" height="40px" alt="Home">
            </a>
            <a asp-area="" asp-controller="Home" asp-action="Index" class="navbar-brand" >Case Management System</a>		
        </div>				
    </div>
</nav>
<div class="border-Btm">
<nav>
            <div class="navbar-collapse navbar-default">
                <ul class="nav navbar-nav" >
                    <li><a href="index.jsp">Home</a></li>               					
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Login <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="AdminLogin.jsp">Admin </a></li>
                            <li><a href="AttorneyLogin.jsp">Attorney </a></li>
                        </ul>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Registration<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="AdminRegistration.jsp">Admin </a></li>
                            <li><a href="AttorneyRegistration.jsp">Attorney </a></li>
                        </ul>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" id="report">Report<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="myAccount">My Account</a></li>
                        <li><a href="#" id="updateDatabase">Update Database</a></li>
                    </ul>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <li><a href="ContactUs.jsp">Contact Us</a></li>				
                </ul>
            </div>
        
        </nav>
</div>
<div class="container body-content">
    <h1> Contact Us </h1>
		
		   
				<table>
				  <tr>
					<th>Name</th>
					<th>Email ID</th>
					 <th>Contact Number</th>

				  </tr>
				  <tr>
					<td>Jayanthi Kotary </td>
					<td> kotary@mail.sacredheart.edu</td>
					<td>(717)-999-3957</td>
					
				  </tr>
				  <tr>
					<td>Afzaal Mohammed</td>
					<td> Mohammeda6@mail.sacredheart.edu</td>
					<td>(347)-337-2961</td>
					
				  </tr>
				   <tr>
					<td>Sailesh Chittoor Neelakantan</td>
					<td> chittoorneelakantans@mail.sacredheart.edu</td>
					<td>(475)-999-1725</td>
				
				  </tr>
				  <tr>
					<td>Laxmi Narasimha Rao Guttikonda</td>
					<td>guttikondal@mail.sacredheart.edu</td>
					<td>(475)-999-1724</td>
					
				</tr>
				<tr>
					<td>Prasanth Maddineni </td>
					<td>maddinenip@mail.sacredgeart.edu</td>
					<td>(551)-253-8017</td>
					
				</tr>
		</table>
<br><br>
    <div class="wrapper">
        <input type="submit" onclick="location.href='index.jsp'" value="Back" class="btnStyle" style="width: 80px;" />
    </div>
<hr>
<!-- FOOTER -->

</div>
</body>
</html>
