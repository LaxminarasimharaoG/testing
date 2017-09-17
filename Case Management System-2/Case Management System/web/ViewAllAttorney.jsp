<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,Model.*,dao.*" %>
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
    
<script>
           
    <%String msg = request.getParameter("msg");
            if(msg != null){
                    if(msg.equals("attorney-delete-profile-success")){%>
                            alert('Profile Deleted Successfully');
                    <%}%>
    <%	} %>
        
    <%String msg1 = request.getParameter("msg");
            if(msg1 != null){
                    if(msg.equals("attorney-edit-profile-success")){%>
                            alert('Your profile has been updated successfully');
                    <%}
                    %>
    <%	} %>
</script>
</head>
 <%
        Attorney currentAttorney = (Attorney)session.getAttribute("currentAttorney"); 
        String name = currentAttorney.getFirstName() + " " + currentAttorney.getLastName();
            
        //List<Attorney> attorneyList=AttorneyDAO.getAttorneyList();
        //request.setAttribute("attorneyList",attorneyList);
        
        Attorney attorneyList=AttorneyDAO.getAttorneyById(currentAttorney.getAttorneyId());
        request.setAttribute("attorneyList",attorneyList);
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
        <div class="left" ><h5> Update Attorney Database </h5> </div>
        <div class="right"> <h6> <b>Welcome "Attorney - <%= name %> " </b> </h6></div>
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
                <th>Email Id</th>
                <th>Status</th>
                
                <th>Action</th>
            </tr>
            
                <tr>
                    
                    <td><%=attorneyList.getAttorneyId()%></td>
                    <td><%=attorneyList.getFirstName()%></td>
                    <td><%=attorneyList.getLastName()%></td>
                    <td><%=attorneyList.getYoe()%></td>
                    <td><%=attorneyList.getDob()%></td>
                    <td><%=attorneyList.getAddress()%></td>
                    <td><%=attorneyList.getStreet()%></td>
                    <td><%=attorneyList.getCity()%></td>
                    <td><%=attorneyList.getState()%></td>
                    <td><%=attorneyList.getPostalCode()%></td>
                    <td><%=attorneyList.getContactNo()%></td>
                    <td><%=attorneyList.getEmailId()%></td>
                    <td><%=attorneyList.getStatus()%></td>
                                      
                    <td>
                    <select id="secQue" onchange="window.open(this.value,'_self');">
                            <option value="">Select</option>
                            <option value="EditAttorneyPage.jsp?attorneyId=<%=currentAttorney.getAttorneyId()%>">Edit</option>
                            <option value="AttorneyController?action=attorneyDeleteProfile&attorneyId=<%=currentAttorney.getAttorneyId()%>">Delete</option>
                           
                    </select>
                    </td>
                </tr>
           
        </table>
    </div>
     <br>
    <div class="wrapper">
        <input type="button" onclick="location.href='AttorneyHome.jsp'" class="btnStyle"value="Previous" style="width:80px" />
        <input type="button" onclick="location.href='AttorneyHome.jsp'" class="btnStyle" value="Home"style="width:80px" />						
    </div>
    <hr/>   
</div>
</body>
</html>

