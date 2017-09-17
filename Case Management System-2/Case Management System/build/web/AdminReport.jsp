<%@page import="dao.ClientDAO"%>
<%@page import="dao.AdminDAO"%>
<%@page import="dao.CaseDAO"%>
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
    
    List<CaseDetails> caseDetails=CaseDAO.getCase();
    request.setAttribute("caseDetails",caseDetails);
    
    List<Admin> adminList=AdminDAO.getAdminList();
    request.setAttribute("adminList",adminList);
    
    List<Client> clientDetails = ClientDAO.getClient();
    request.setAttribute("clientDetails",clientDetails);
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
    <div class="left" ><h5> List of Admin Details </h5> </div>
    <div class="right"> <h6> <b>Welcome "Admin - <%= name %> " </b> </h6></div>
</div>
<br><br>

<div id="table">
        <table class="main">
            <tr>
                <th>Date Time</th>
                <th>Admin Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Employee Id </th>
                <th>D.O.B</th>
                <th>Address</th>
                <th>Street</th>
                <th>City</th>
                <th>State</th>
                <th>Zipcode</th>
                <th>Contact No</th>
                <th>Email Id</th>
                
                
                
            </tr>
            <c:forEach items="${adminList}" var="admin">
                <tr>
                    <td>${admin.getLastUpdatedDateTime()}</td>
                    <td>${admin.getAdminId()}</td>
                    <td>${admin.getFirstName()}</td>
                    <td>${admin.getLastName()}</td>
                    <td>${admin.getCompanyId()}</td>
                    <td>${admin.getDob()}</td>
                    <td>${admin.getAddress()}</td>
                    <td>${admin.getStreet()}</td>
                    <td>${admin.getCity()}</td>
                    <td>${admin.getState()}</td>
                    <td>${admin.getPostalCode()}</td>
                    <td>${admin.getContactNo()}</td>
                    <td>${admin.getEmailId()}</td>
                    
                </tr>
            </c:forEach>
        </table>
        
    </div>
<br><br>
<div>
    <div class="left" ><h5> All Attorney Details </h5> </div>
</div>
<br><br>
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
                </tr>
            </c:forEach>
        </table>
        <br>
       
</div>
<div>
    <div class="left" ><h5> Case Details </h5> </div>
</div>
<br><br>
<div id="table">
        <table class="main">
            <tr>
                <th>Case No</th>
                <th>Case Name</th>
                <th>Case Type</th>
                <th>Client Name</th>
                <th>Status of Case</th>
                <th>Case Start Date </th>
                <th>Court Hearing</th>
                <th>Notes</th>
                <th>Mediator</th>
                <th>Party 1</th>
                <th>Party 2</th>
                <th>Action Took</th>
                <th>Action Need to Take</th>
            </tr>
            <c:forEach items="${caseDetails}" var="case">
                <tr>
                    <td>${case.getCaseId()}</td>
                    <td>${case.getCaseName()}</td>
                    <td>${case.getCaseTypeId().getCaseType()}</td>
                    <td>${case.getClientId().getClientName()}</td>
                    <td>${case.getCaseStatus()}</td>
                    <td>${case.getCaseStartDate()}</td>
                    <td>${case.getCourtHearing()}</td>
                    <td>${case.getMediator()}</td>
                    <td>${case.getParty1()}</td>
                    <td>${case.getParty2()}</td>
                    <td>${case.getCaseNotes()}</td>
                    <td>${case.getActionTook()}</td>
                    <td>${case.getActionNeedToTake()}</td>
                </tr>
            </c:forEach>
        </table>      
</div>

<br><br>
<div>
    <div class="left" ><h5> Client Details </h5> </div>
</div>
<br><br>
    <div id="table">
        <table class="main">
            <tr>
                 <th>Client Id</th>
                <th>Client Name</th>
                <th>Email Id</th>
                <th>Contact No</th>
                <th>Address</th>
            </tr>
            <c:forEach items="${clientDetails}" var="client">
                <tr>
                    <td>${client.getClientId()}</td>
                    <td>${client.getClientName()}</td>
                    <td>${client.getClientEmail()}</td>
                    <td>${client.getClientContactNo()}</td>
                    <td>${client.getClientAddress()}</td>
                </tr>
            </c:forEach>
        </table>
        
    </div>

<br>
<hr>
</div>
</body>
</html>

