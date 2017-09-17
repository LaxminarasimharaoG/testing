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
    
    <link href="asset/css/style.css" rel="stylesheet">
    <link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>	
    
</head>
<%
    Admin currAdmin = (Admin)session.getAttribute("CurrAdmin");
    String name = currAdmin.getFirstName() + " " + currAdmin.getLastName();
    
    String attorneyId=request.getParameter("attorneyId");
     
    
    Attorney attoney=AttorneyDAO.getAttorneyById(Integer.parseInt(attorneyId));
    
            
    List<CaseDetails> caseDetails=CaseDAO.getCaseDetailsById(Integer.parseInt(attorneyId));
    request.setAttribute("caseDetails",caseDetails);
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
    <div class="left" ><h5> <%=attoney.getFirstName() + " " + attoney.getLastName() %> - Case Details</h5> </div>
    <div class="right"> <h6> <b>Welcome "Admin - <%= name %> " </b> </h6></div>
</div>
<br><br><br>
<input type="hidden" id="attorneyId" name="attorneyId" value="case.getLastUpdateBy()">
<%
    System.out.println("attorneyId="+attorneyId);
%>
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
                <th>Case Details</th>
                
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
                    <td><a href="ViewMoreCaseDetails.jsp?caseId=${case.getCaseId()}&attorneyId=${case.getLastUpdateBy()}">View More</a></td>
                </tr>
            </c:forEach>
        </table>      
</div>
<br><br>
<div class="wrapper">
        <input type="button" onclick="location.href='AdminHome.jsp'" class="btnStyle"value="Previous" style="width:80px" />
        <input type="button" onclick="location.href='AdminHome.jsp'" class="btnStyle" value="Home"style="width:80px" />						
</div>

<br>
<hr/>
</div>
</body>
</html>

