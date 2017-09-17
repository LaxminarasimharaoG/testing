<%@page import="dao.ClientDAO"%>
<%@page import="dao.CaseTypeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,Model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

function validate()
    {
        var clientName,caseType;
        clientName = document.getElementById("getClientName").value;
        caseType = document.getElementById("getCaseType").value;
        
        if (clientName == "") 
        {
                alert('Please Select Client Name');
                return false;
        }
        else if(caseType == "")
        {
            alert('Please Select Case Type');
            return false;
        }
    }

<%String msg = request.getParameter("msg");
                 if(msg != null){
                         if(msg.equals("add-case-failure")){%>
                                 alert('Case Details Added Error');
                         <%}
                         %>
                <%} %>
                    
               
</script>
</head>
<%
        Attorney currentAttorney = (Attorney)session.getAttribute("currentAttorney"); 
        String name = currentAttorney.getFirstName() + " " + currentAttorney.getLastName();
        
        List<CaseType> caseTypeList=CaseTypeDAO.getCaseType();
        request.setAttribute("caseTypeList",caseTypeList);
        
        List<Client> clientList=ClientDAO.getClient();
        request.setAttribute("clientList",clientList);
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
        <div class="left" ><h5> Add Case Details </h5> </div>
        <div class="right"> <h6> <b>Welcome "Attorney - <%= name %> " </b> </h6></div>
    </div>
    <br><br><br>
    
        <div id="casetype">
            <div class="form">
                <form action="CaseController?action=addCase" method="post" id="addCase">
                <div class="col-lg-12">
                   <div class="row">
                       <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Client Name</font> </label>
                            <select id="getClientName" name="getClientName">
                                <option value="">Select</option>
                                <c:forEach items="${clientList}" var="client">
                                    <option value="${client.getClientId()}">${client.getClientName()}</option>
                                </c:forEach>
                            </select>
                        </div> 
                        
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Case Type</font> </label>
                            <select id="getCaseType" name="getCaseType">
                                <option value="">Select</option>
                                <c:forEach items="${caseTypeList}" var="caseType">
                                    <option value="${caseType.getCaseTypeId()}">${caseType.getCaseType()}</option>
                                </c:forEach>
                            </select>
                        </div> 
                   </div>
                   <div class="row">
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black"> Case Name</font> </label>
                            <input type="text" name="caseName" placeholder="Case Name" required="required"/>
                        </div>
                       <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Status of Case</font> </label>
                            <input type="text" name="caseStatus" placeholder="Case Status" required="required"/>
                        </div> 
                       
                   </div>
                   <div class="row">
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black"> Case Start Date</font> </label>
                            <input type="date" name="caseStartDate" required="required"/>
                        </div>
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black"> Court Hearing</font> </label>
                            
                            <input type="date" name="caseHearing" required="required"/>
                        </div>
                   </div>
                   <div class="row">
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Mediator</font> </label>
                            <input type="text" name="mediator" placeholder="Mediator" required="required"/>
                        </div> 
                       <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Party 1</font> </label>
                            <input type="text" name="party1" placeholder="Party 1" required="required"/>
                        </div>
                   </div>
                   <div class="row">
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black">Party 1</font> </label>
                            <input type="text" name="party2" placeholder="Party 2" required="required"/>
                        </div> 
                       <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black"> Notes </font></label>
                            <textarea rows="3" name="notes" placeholder="Notes" 
                                  required="required" cols="30" ></textarea>
                        </div>
                   </div>
                   <div class="row">
                        <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black"> Action Took </font></label>
                            <textarea rows="3" name="actionTook" placeholder="Action Took" 
                                  required="required" cols="30" ></textarea>
                        </div> 
                       <div class="col-sm-6 form-group" >
                            <label><font size="3" color="black"> Action Need To Take </font></label>
                            <textarea rows="3" name="actionNeedToTake" placeholder="Action Need To Take" 
                                  required="required" cols="30" ></textarea>
                        </div>
                   </div>
                    
                </div>
                    <div class="inputWrap" style="padding-left: 212px">
                        <button type="button" class="loginBtnStyle" onclick="location.href='AttorneyHome.jsp'" 
                                style="width:80px">Home</button>
                        <button type="submit" class="loginBtnStyle" onclick="return validate()" style="width:80px">Submit</button>
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
