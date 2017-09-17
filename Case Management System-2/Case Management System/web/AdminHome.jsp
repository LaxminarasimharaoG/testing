<%@page import="dao.AttorneyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,Model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
</head>
<%
    Admin currAdmin = (Admin)session.getAttribute("CurrAdmin");
    String name = currAdmin.getFirstName() + " " + currAdmin.getLastName();
    
    List<Attorney> attorneyList=AttorneyDAO.getAttorneyList();
    request.setAttribute("attorneyList",attorneyList);
%>
<body>
    
<script type="text/javascript"> 
        $(document).ready(function () {
            $("#logout").click(function(e)
            {
                window.location.href='index.jsp';
                e.preventDefault();
            });
        });
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
            <li><a href="AdminHome.jsp">Home</a></li> 
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Report<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="AdminReport.jsp">Sample Report</a></li>
                        <li><a href="AdminUpdateProfile.jsp">My Account</a></li>
                        <li><a href="ViewAllAdmin.jsp">Update Database</a></li>
                       <!--<li><a href="AdminUpdateProfile.jsp">Update Profile</a></li>
                        <li><a href="AdminChangePassword.jsp">Change Password</a></li>
                        <li><a href="AdminChangePassword.jsp">Report</a></li>
                        <li><a href="ViewAllAdmin.jsp">Update Admin Database</a></li>
                        <li><a href="ViewAllAttorney.jsp">Update Attorney Database </a></li>-->
                    </ul>
                <li><a href="AboutUs.jsp">About Us</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="" id="logout">Logout</a></li>				
        </ul>
    </div>
</nav> 
</div>
<br>
<div class="container body-content">
<div>
    <div class="left" ><h5> Attorney Details </h5> </div>
    <div class="right"> <h6> <b>Welcome "Admin - <%= name %> " </b> </h6></div>
</div>
<br><br><br>
<div id="table">
        <table class="main">
            <tr>
                
                <th>Attorney Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Y.O.E</th>
                <th>D.O.B</th>
                <th>Address</th>
                <th>Street</th>
                <th>City</th>
                <th>State</th>
                <th>Zipcode</th>
                <th>Contact No</th>
                <th>Case</th>
            </tr>
            <c:forEach items="${attorneyList}" var="attorney">
                <tr>
                    <td>${attorney.getAttorneyId()}</td>
                    <td>${attorney.getFirstName()}</td>
                    <td>${attorney.getLastName()}</td>
                    <td>${attorney.getYoe()}</td>
                    <td>${attorney.getDob()}</td>
                    <td>${attorney.getAddress()}</td>
                    <td>${attorney.getStreet()}</td>
                    <td>${attorney.getCity()}</td>
                    <td>${attorney.getState()}</td>
                    <td>${attorney.getPostalCode()}</td>
                    <td>${attorney.getContactNo()}</td>
                    <td><a href="ViewCaseDetails.jsp?attorneyId=${attorney.getAttorneyId()}">View Case</a></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <hr/>
</div>
</div>
</body>
</html>

