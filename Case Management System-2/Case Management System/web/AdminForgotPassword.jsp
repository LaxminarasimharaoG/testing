<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Case Management System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="asset/css/bootstrap.style.css">
<link href="asset/css/bootstrap.min.css" rel="stylesheet">
<link href="asset/css/modern-business.css" rel="stylesheet">
<link href="asset/css/style.css" rel="stylesheet">
<link href="asset/css/main-style.css" rel="stylesheet">
<link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="asset/js/validation.js"></script>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>

<script type="text/javascript"> 
    
    $(document).ready(function () {
        $("#report").click(function(e)
        {
            alert('Access Denied');
            e.preventDefault();
        });
    });
    
    <%String msg = request.getParameter("msg");
            if(msg != null){
                    if(msg.equals("admin-emailid-failure")){%>
                            alert('Email Id Not Found.Please Enter Valid Email Address');
                    <%}
                    %>
    <%	} %>   
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
                    <li><a href="#" id="report">Report</a></li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <li><a href="ContactUs.jsp">Contact Us</a></li>				
                </ul>
            </div>
        
</nav>
</div>
<br>
<div class="container body-content">
<h1> Admin Forgot Password </h1>

    <div class="rowalign">
	<form action="AdminController?action=adminForgotPasswordEmailCheck" method="post">
            <div class= "input-group" >
                <label for="name">Email Id </label>
                <input type="email" id="email" name="email" class="form-control" placeholder="Enter Email Id Here.." 
                value="" aria-describedby="name-format" title="Please enter the valid email id" required>
                <span id="name-format" class="help"> </span>
            </div>	
            <br>
            <div class="submit">
                <input type="button" onclick="location.href='AdminLogin.jsp'" class="btnStyle"value="Previous" style="width:80px" />
                <input type="button" onclick="location.href='index.jsp'" class="btnStyle" value="Home"style="width:80px" />
                <input type="submit" class="btnStyle" value="Next" style="width:80px" />
            </div>	    
        </form> 
    </div> 
<br>
<hr/>
</div>
</body>
</html>

