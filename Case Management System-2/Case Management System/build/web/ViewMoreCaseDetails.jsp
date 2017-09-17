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
    <link href="asset/css/form.css" rel="stylesheet">
    <link href="asset/css/modern-business.css" rel="stylesheet">
    <link href="asset/css/style.css" rel="stylesheet">
    <link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>	
    
</head>
<%
    Admin currAdmin = (Admin)session.getAttribute("CurrAdmin");
    String name = currAdmin.getFirstName() + " " + currAdmin.getLastName();
    
    String caseId=request.getParameter("caseId");
    CaseDetails caseDetails=CaseDAO.getCaseById(Integer.parseInt(caseId));
    request.setAttribute("caseDetails",caseDetails);
    
    String attorneyId=request.getParameter("attorneyId");
    
    Attorney attorneyDetails=AttorneyDAO.getAttorneyById(Integer.parseInt(attorneyId));
    request.setAttribute("attorneyDetails",attorneyDetails);
    
    //List<CaseDetails> caseDetail=CaseDAO.getCaseDetailsById(Integer.parseInt(attorneyId));
    //request.setAttribute("caseDetail",caseDetail);
    
    //CaseDetails caseDetail=CaseDAO.getCaseDetailsByAttorneyId(Integer.parseInt(attorneyId));
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
    <div class="left" ><h5> Client and Case Details </h5> </div>
    <div class="right"> <h6> <b>Welcome "Admin - <%= name %> " </b> </h6></div>
</div>
<br><br><br>
<div id="casetype">
            <div class="form">
                <form action="" method="post" id="addCase">
                <div class="col-lg-12">
                   <div class="row">
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Client Name</font> </label>
                            <input type="text" readonly name="clientName" value="<%=caseDetails.getClientId().getClientName()%>" required="required"/>
                        </div>
                         <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Attorney First Name</font> </label>
                            <input type="text" readonly name="attorneyName" value="<%=attorneyDetails.getFirstName()%>" required="required"/>
                        </div>
                      
                   </div>
                   <div class="row">
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Email Id</font> </label>
                            <input type="text" name="clientEmailId" readonly value="<%=caseDetails.getClientId().getClientEmail()%>" required="required"/>
                        </div> 
                       
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Attorney Last Name</font> </label>
                            <input type="text" name="attorneyEmailId" readonly value="<%=attorneyDetails.getLastName()%>" required="required"/>
                        </div> 
                       
                   </div>
                    
                   <div class="row">
                       <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black"> Contact No</font> </label>
                            <input type="text" name="clientContactNo" readonly value="<%=caseDetails.getClientId().getClientContactNo()%>" required="required"/>
                        </div>
                       <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black"> Contact No</font> </label>
                            <input type="text" name="attorneyContactNo" value="<%=attorneyDetails.getContactNo()%>" readonly required="required"/>
                        </div>
                       
                   </div>
                   <div class="row">
                       
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Address</font> </label>
                            <textarea rows="3" name="clientAddress" readonly
                                  required="required" cols="30" ><%=caseDetails.getClientId().getClientAddress()%></textarea>
                        </div>
                        
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Address</font> </label>
                            <textarea rows="3" name="attorneyAddress" readonly
                                  required="required" cols="30"><%=attorneyDetails.getStreet()%>,<%=attorneyDetails.getCity()%>,
                                  <%=attorneyDetails.getState()%>,<%=attorneyDetails.getPostalCode()%></textarea>
                        </div>
                   </div> 
                     
                </div>
                <br>
                </form>
            </div>
	</div>
        <div id="table">
        <table class="main">
            <tr>
                <th>Case No</th>
                <th>Case Name</th>
                <th>Case Type</th>
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
            
                <tr>
                    <td>${caseDetails.getCaseId()}</td>
                    <td>${caseDetails.getCaseName()}</td>
                    <td>${caseDetails.getCaseTypeId().getCaseType()}</td>
                    <td>${caseDetails.getCaseStatus()}</td>
                    <td>${caseDetails.getCaseStartDate()}</td>
                    <td>${caseDetails.getCourtHearing()}</td>
                    <td>${caseDetails.getMediator()}</td>
                    <td>${caseDetails.getParty1()}</td>
                    <td>${caseDetails.getParty2()}</td>
                    <td>${caseDetails.getCaseNotes()}</td>
                    <td>${caseDetails.getActionTook()}</td>
                    <td>${caseDetails.getActionNeedToTake()}</td>
                </tr>
           
        </table>      
</div>
<br><br>
<div class="wrapper">
        <button type="button" class="btnStyle" onclick="location.href='AdminHome.jsp'" 
                                style="width:80px">Home</button>
        <button type="button" class="btnStyle" onclick="location.href='AdminHome.jsp'" 
                                style="width:80px">Back</button>					
</div>
<br>
<hr>
</div>
</body>
</html>

