<%@page import="Model.CaseDetails"%>
<%@page import="dao.CaseDAO"%>
<%@page import="Model.Attorney"%>
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
        Attorney currentAttorney = (Attorney)session.getAttribute("currentAttorney"); 
        String name = currentAttorney.getFirstName() + " " + currentAttorney.getLastName();
        
        List<CaseDetails> caseDetails=CaseDAO.getCaseDetailsById(currentAttorney.getAttorneyId());
        request.setAttribute("caseDetails",caseDetails);
%>

<body>
<nav class="navbar navbar-fixed-top">
    <div class="container">		
        <div class="navbar-header"> 
            <a class="navbar-brand" href="index.jsp">
                <img src="asset/img/logo.png" width="150px" height="40px" alt="Home">
            </a>
            <a asp-area="" asp-controller="Home" asp-action="Index" class="navbar-brand" >Case Management System</a>		
        </div>				
    </div>
</nav>

<div class="container body-content">
    
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
                            <li><a href="Report.jsp">Sample Report</a></li>
                            <li><a href="AttorneyUpdateProfile.jsp">My Account</a></li>
                            <li><a href="ViewAllAttorney.jsp">Update Database</a></li>
                        </ul>
                         <li><a href="CaseList.jsp">View Case</a></li>
                        <li><a href="AboutUs.jsp">About Us</a></li>
                        <li><a href="ContactUs.jsp">Contact Us</a></li>
                        <li><a href="index.jsp">Logout</a></li>				
                </ul>
            </div>   
        </nav>
    <hr> 
<div>
    <div class="left" ><h5> Attorney Home Page</h5> </div>
    <div class="right"> <h6> <b>Welcome "Attorney - <%= name %> " </b> </h6></div>
</div>
<br><br><br>
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
    <br>
    <hr/>
</div>
</body>
</html>
