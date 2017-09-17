<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,Model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Case Management System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
        .loginBtnStyle
        {
            font-weight: bold;
        }  
    </style>
    <script type="text/javascript"> 

<%String msg = request.getParameter("msg");
                 if(msg != null){
                         if(msg.equals("add-client-failure")){%>
                                 alert('Add Client Details Error');
                         <%}
                         %>
                <%} %>

<%String msg1 = request.getParameter("msg");
                 if(msg1 != null){
                         if(msg1.equals("client-name-already-exist")){%>
                                 alert('Client Name Already Exist...Please Enter Different Name');
                         <%}
                         %>
                <%} %>
               
</script>
</head>
<%
        Attorney currentAttorney = (Attorney)session.getAttribute("currentAttorney"); 
        String name = currentAttorney.getFirstName() + " " + currentAttorney.getLastName();
%>
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
                    <li><a href="AttorneyHome.jsp">Home</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Case Type <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                           <li><a href="AddCaseType.jsp">Add Case Type</a></li>
                           <li><a href="ViewCaseType.jsp">View Case Type</a></li>		
                    </ul>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Client <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                           <li><a href="AddClient.jsp">Add Client</a></li>
                           <li><a href="ViewClient.jsp">View Client</a></li>	
                    </ul> 
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Case <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                           <li><a href="AddCase.jsp">Add Case</a></li>
                           <li><a href="ViewCase.jsp">View Case</a></li>	
                    </ul>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Report<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="AttorneyReport.jsp">Sample Report</a></li>
                            <li><a href="AttorneyUpdateProfile.jsp">My Account</a></li>
                            <li><a href="ViewAllAttorney.jsp">Update Database</a></li>
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
    <div class="left" ><h5> Add Client </h5> </div>
    <div class="right"> <h6> <b>Welcome "Attorney - <%= name %> " </b> </h6></div>
</div>
    <br><br>
    
        <div id="casetype">
            <div class="form">
                <form action="ClientController?action=addClient" method="post" id="addCaseType">
                    <div class="form-group" >
                        <label><font size="3" color="black">Client Name</font> </label>
                        <input type="text" name="clientName" placeholder="Client Name" required="required"/>
                    </div>
                    <div class="form-group" >
                        <label><font size="3" color="black"> Email Id</font> </label>
                        <input type="email" name="clientEmailId" placeholder="Email Id" required="required"/>
                    </div>
                    <div class="form-group" >
                        <label><font size="3" color="black"> Contact No</font> </label>
                        <input type="text" name="clientContactNo" placeholder="Contact No" 
                               pattern="[0-9]{1}[0-9]{9}" maxlength="10" required="required"/>
                    </div>
                    <div class="form-group">
                        <label><font size="3" color="black"> Address </font></label>
                        <textarea rows="3" name="clientAddress" placeholder="Address" 
                                  required="required" cols="30" ></textarea>
                    </div>
                    <div class="inputWrap" style="padding-left: 170px">
                        <button type="submit" class="loginBtnStyle" style="width:80px">Submit</button>
                        <button type="button" class="loginBtnStyle" onclick="location.href='AttorneyHome.jsp'" 
                                style="width:80px">Back</button>
                    </div>
                </form>
            </div>
	</div>
    <hr/>
</div>
</body>
</html>
