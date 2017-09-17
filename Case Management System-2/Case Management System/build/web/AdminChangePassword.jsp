<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,Model.*" %>
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
     
    <%String msg = request.getParameter("msg");
            if(msg != null){
                    if(msg.equals("admin-currentpassword-failure")){%>
                            alert('Current Password Does Not Match.Please Enter Valid Password');
                    <%}
                    %>
                    
    <%	} %> 
        
    <%String msg1 = request.getParameter("msg");
            if(msg1 != null){
                    if(msg1.equals("admin-confirmpasword-doesnot-match")){%>
                            alert('New Password and Confirm Password Does Not Match.Please Enter Valid Password');
                    <%}
                    %>
                    
    <%	} %> 
        
        
    <%String msg2 = request.getParameter("msg");
            if(msg2 != null){
                    if(msg2.equals("admin-changepassword-success")){%>
                            alert('Password changed successfully!!!');
                    <%}
                    %>
                    
    <%	} %>  
</script>
<%
    Admin currAdmin = (Admin)session.getAttribute("CurrAdmin");
    String name = currAdmin.getFirstName() + " " + currAdmin.getLastName();
%>

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
            <li><a href="AdminHome.jsp">Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Report<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="AdminUpdateProfile.jsp">My Account</a></li>
                        <li><a href="ViewAllAdmin.jsp">Update Database</a></li>                              
                    </ul>
                <li><a href="AboutUs.jsp">About Us</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="index.jsp">Logout</a></li>				
        </ul>
    </div>
</nav>
</div>
<br>
<div class="container body-content">
<div>
    <div class="left" ><h5> Admin Change Password </h5> </div>
    <div class="right"> <h6> <b>Welcome "Admin - <%= name %> " </b> </h6></div>
</div>
<br><br>
    <div class="rowalign">
        <form action="AdminController?action=adminChangePassword" method="post" id="frm">
            <div class="currentpassword">
                <label>Current Password </label>
                <input id="emailID" style="width: 300px" name="currentPassword" 
                       class="form-control" type="password" required>					
            </div>
            <br>
            <div class="newpassword">
                <label>New Password </label>
                <input id="secque" style="width: 300px" name="newPassword" class="form-control" 
                       type="password" required>					
            </div>
            <br>
            <div class="confirmpassword">
                <label>Confirm Password</label>
                <input id="answer" style="width: 300px" name="confirmPassword" 
                        class="form-control" type="password" required>	
            </div>
            <br>
            <div class="submit">
               <input type="button" onclick="location.href='AdminHome.jsp'" class="btnStyle"value="Previous" style="width:80px" />
                <input type="button" onclick="location.href='AdminHome.jsp'" class="btnStyle" value="Home"style="width:80px" />
                <input type="submit" class="btnStyle" value="Next" style="width:80px" /> 
            </div>	
        </form> 
    </div> 
<br>
<hr/>
</div>
</body>
</html>

