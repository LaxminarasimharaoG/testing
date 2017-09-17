<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,Model.*,dao.*" %>
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
<link href="asset/css/main-style.css" rel="stylesheet">
<link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="asset/js/validation.js"></script>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<script>
    
    
    
    <%String msg = request.getParameter("msg");
            if(msg != null){
                    if(msg.equals("admin-edit-profile-success")){%>
                            alert('Profile Updated Successfully');
                    <%}%>
    <%	} %>
        
    <%String msg1 = request.getParameter("msg");
            if(msg1 != null){
                    if(msg1.equals("admin-edit-profile-failure")){%>
                            alert('Profile Updation Error');
                    <%}
                    %>
    <%	} %>
        
    
</script>
<style>
    .row
    {
        margin-left: -15px;
    }
    .btnStyle-1
    {
        margin-left: 14px;
        font-weight: bold;
    }
</style>
        <%
            Admin currAdmin = (Admin)session.getAttribute("CurrAdmin");
            String name = currAdmin.getFirstName() + " " + currAdmin.getLastName();
            
            String adminId=request.getParameter("AdminId");
            Admin admin=AdminDAO.getAdminById(Integer.parseInt(adminId));
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
            <li><a href="index.jsp">Home</a></li>
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
                <li><a href="index.jsp">Logout</a></li>				
        </ul>
    </div>
</nav>
</div>
<br>
<div class="container body-content" >
    <div>
        <div class="left" ><h5> Update Admin Database </h5> </div>
        <div class="right"> <h6> <b>Welcome "Admin - <%= name %> " </b> </h6></div>
    </div>	
    <br><br>
    <form action="AdminController?action=adminEditProfile" method="post" id="frm">
        <div class="col-sm-12" >
       
            <div class="row">
                <div class="col-sm-4 form-group">
                    <input type="hidden" name="adminId" value="<%=admin.getAdminId()%>">
                    <label>First Name</label>
                    <input id="firstName" placeholder="Enter First Name Here.." name="firstName" class="form-control" type="text"
                           title="Please enter the valid name" value="<%=admin.getFirstName()%>" required>
                    <span id="error_firstName" class="text-danger"></span>
                </div>			
                <div class="col-sm-4 form-group">
                    <label>Last Name</label>
                    <input type="text" placeholder="Enter Last Name Here.." id="lastName" name="lastName" 
                    class="form-control" required title="Please enter the valid name" value="<%=admin.getLastName()%>">
                    <span id="error_lastName" class="text-danger"></span>
                </div>
                <div class="col-sm-4 form-group">
                    <label>Company Id</label>
                    <input type="text" placeholder="Enter Company Id Here.." id="lastName" name="companyId" 
                    class="form-control" required title="Please enter the valid id" value="<%=admin.getCompanyId()%>">
                    <span id="error_lastName" class="text-danger"></span>
                </div>	
            </div>
            <div class="row">                                             									
                <div class="col-sm-4 form-group">
                    <label>Contact Number</label>
                    <input type="text" placeholder="Enter Phone No Here.." name="contactno" pattern="[0-9]{1}[0-9]{9}" 
                    title="Phone number should be 10 digit" class="form-control" required value="<%=admin.getContactNo()%>">
                </div>	
                <div class="col-sm-4 form-group">
                    <label>Address</label>
                    <input type="text" placeholder="Enter Address Here.." name="address" id="address" 
                    title="Please enter the valid address" class="form-control" value="<%=admin.getAddress()%>" required>
                    <span id="error_address" class="text-danger"></span>
                </div>
                 <div class="col-sm-4 form-group">
                    <label>Street</label>
                    <input type="text" placeholder="Enter Street Here.." name="street" id="street" 
                    class="form-control" title="Please enter the valid street name" required value="<%=admin.getStreet()%>">
                    <span id="error_street" class="text-danger"></span>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 form-group">
                    <label>City</label>
                    <input type="text" placeholder="Enter City Name Here.." name="city" 
                    class="form-control" id="city" title="Please enter the valid city name" required value="<%=admin.getCity()%>">
                    <span id="error_city" class="text-danger"></span>
                </div>										
                <div class="col-sm-4 form-group">
                    <label>State</label>
                    <input type="text" placeholder="Enter State Name Here.." name="state" id="state" 
                    class="form-control" title="Please enter the valid state name" required value="<%=admin.getState()%>">
                    <span id="error_state" class="text-danger"></span>
                </div>	
                <div class="col-sm-4 form-group">
                    <label>Zipcode</label>
                    <input type="text" placeholder="Enter Zip Code Here.." name="zipcode" id="zipcode" value="<%=admin.getPostalCode()%>"
                           class="form-control" title="Please enter the valid zipcode" maxlength="5" required>
                    <span id="error_zipcode" class="text-danger"></span>
                </div>	
            </div>
            
            <div class="row">
                																			                                        
            </div>
            	
        </div>
        <div >
                <input type="button" onclick="location.href='ViewAllAdmin.jsp'" class="btnStyle-1"value="Previous" style="width:80px" />
                <input type="button" onclick="location.href='index.jsp'" class="btnStyle" value="Home"style="width:80px" />
                <input type="submit" class="btnStyle" value="Next" style="width:80px" /> 
        </div>
                
                
    </form>
                <hr>
</div>
</body>
</html>

