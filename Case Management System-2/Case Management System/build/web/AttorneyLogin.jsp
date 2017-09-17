<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Case Management System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="asset/css/bootstrap.min.css">
    <link href="asset/css/bootstrap.min.css" rel="stylesheet">
    <link href="asset/css/modern-business.css" rel="stylesheet">
    <link href="asset/css/form.css" rel="stylesheet">
    <link href="asset/css/style.css" rel="stylesheet">
    <link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
   
    <style>
        .row
        {
            margin-left: -15px;
        }
        .loginBtnStyle
        {
            font-weight: bold;
        }
        
    </style>
</head>
<body>
    <script type="text/javascript"> 
        
        
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

        
         <%String msg = request.getParameter("msg");
                 if(msg != null){
                         if(msg.equals("attorney-login-failure")){%>
                                 alert('Invalid User name or Paswword');
                         <%}
                         %>
         <%	} %>
             
        <%String msg1 = request.getParameter("msg1");
            if(msg1 != null){
                    if(msg1.equals("attorney-secqueans-success")){%>
                            alert('New password has been sent to your Email Id');
                    <%}
                    %>
                    
        <%	} %> 
            
        <%String msg2 = request.getParameter("msg");
                 if(msg2 != null){
                         if(msg2.equals("attorney-reg-success")){%>
                                 alert('Your account has been created successfully');
                         <%}
                         %>
        <%}%>
    </script>
        
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
	<h1> Attorney Login </h1>
	
	<!-- Attorney -->
        <div class="attorneyLogin">
            <div id="attorney">
                <div class="col-lg-12">
                    <div class="form">
                            <form action="AttorneyController?action=attorneyLoginCheck" method="post" id="frm" class="login-frm">
                                    <div class="form-group" text-align="center">
                                            <label><font size="3" color="black"> User ID</font> </label>
                                            <input type="email" name="emailId" placeholder="Username" required="required"/>
                                    </div>
                                    <div class="form-group">
                                            <label><font size="3" color="black"> Password</font></label>
                                            <input type="password" placeholder="Password" name="password" required="required"/>
                                    </div>
                                    <div class="inputWrap" style="padding-left: 170px">
                                        <button type="submit" class="loginBtnStyle" style="width:80px">Submit</button>
                                        <button type="submit" class="loginBtnStyle" onclick="location.href='index.jsp'" 
                                                style="width:80px">Back</button>
                                    </div><br>
                                    <div class="form-group" style="padding-left: 170px">                            										 
                                        <label id="forgotPwd"><a href="AttorneyRegistration.jsp"> <font size="3" color="red"> 
                                                Attorney Registration |</font></a></label>
                                        <label id="forgotPwd"><a href="AttorneyForgotPassword.jsp"> <font size="3" color="red"> 
                                                Forgot Password</font></a></label>
                                    </div>
                            </form>
                    </div>
                    <hr>
		</div>
            </div>
	</div>	
    </div>
</body>
</html>
