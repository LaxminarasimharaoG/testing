<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
    
    $(document).ready(function () {
        $("#myAccount").click(function(e)
        {
            alert('Access Denied');
            e.preventDefault();
        });
        $("#updateDatabase").click(function(e)
        {
            alert('Access Denied');
            e.preventDefault();
        });
    });
      
    function validate()
    {
        var primaryPassword,secondaryPassword,dob,secQue;
        primaryPassword = document.getElementById("primaryPassword").value;
        secondaryPassword = document.getElementById("secondaryPassword").value;
        dob = document.getElementById("dob").value;
        secQue = document.getElementById("secQue").value;
        
        if (dob == "") 
        {
                alert('Please Enter Your Date of Birth');
                return false;
        }
        else if(secQue == "-- Select Question --")
        {
            alert('Please Select Your Question');
            return false;
        }
        else if (primaryPassword == secondaryPassword) 
        {
                alert('Primary Password and Secondary Password should be different');
                return false;
        }
    }


    <%String msg = request.getParameter("msg");
            if(msg != null){
                    if(msg.equals("email-already-exist")){%>
                            alert('Email Id Already Exist.Please Enter Different Email Id');
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
    h1
    {
            font-family:Baskerville Old Face;
            color:black;
    }
</style>
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
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Login <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="AdminLogin.jsp">Admin </a></li>
                            <li><a href="AttorneyLogin.jsp">Attorney </a></li>
                        </ul>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Registration<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="AdminRegistration.jsp">Admin </a></li>
                            <li><a href="AttorneyRegistration.jsp">Attorney </a></li>
                        </ul>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" id="report">Report<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" id="myAccount">My Account</a></li>
                        <li><a href="#" id="updateDatabase">Update Database</a></li>
                    </ul>
                    <li><a href="AboutUs.jsp" >About Us</a></li>
                    <li><a href="ContactUs.jsp">Contact Us</a></li>				
                </ul>
            </div>
        </nav>
</div>
    <div class="container body-content" >
    <h1> Admin Registration </h1>
   
    <form action="AdminController?action=adminRegister" method="post" id="frm" >
        <div class="col-sm-12" >
            <div class="row">
                <div class="col-sm-4 form-group">
                    <label>First Name</label>
                    <input id="firstName" placeholder="Enter First Name Here.." name="firstName" class="form-control" type="text"
                    title="Please enter the valid name" required="required">
                    
                </div>			
                <div class="col-sm-4 form-group">
                    <label>Last Name</label>
                    <input type="text" placeholder="Enter Last Name Here.." id="lastName" name="lastName" 
                    class="form-control" required="required" title="Please enter the valid name">
                    
                </div>
                <div class="col-sm-4 form-group">
                    <label>Company Id</label>
                    <input type="text" placeholder="Enter Company Id Here.." id="lastName" name="companyId" 
                    class="form-control" required="required" title="Please enter the valid id">
                    
                </div>	
            </div>
            <div class="row">                                             									
                <div class="col-sm-4 form-group">
                    <label for="dob">Date Of Birth</label>
                    <input type="date" name="dob" id="dob" class="form-control">
                    
                </div>	
                <div class="col-sm-4 form-group">
                    <label>Address</label>
                    <input type="text" placeholder="Enter Address Here.." name="address" id="address" 
                    title="Please enter the valid address" class="form-control" required="required">
                    <span id="error_address" class="text-danger"></span>
                </div>
                 <div class="col-sm-4 form-group">
                    <label>Street</label>
                    <input type="text" placeholder="Enter Street Here.." name="street" id="street" 
                    class="form-control" title="Please enter the valid street name" required="required">
                   
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 form-group">
                    <label>City</label>
                    <input type="text" placeholder="Enter City Name Here.." name="city" 
                    class="form-control" id="city" title="Please enter the valid city name" required="required">
                    
                </div>										
                <div class="col-sm-4 form-group">
                    <label>State</label>
                    <input type="text" placeholder="Enter State Name Here.." name="state" id="state" 
                    class="form-control" title="Please enter the valid state name" required="required">
                    
                </div>	
                <div class="col-sm-4 form-group">
                    <label>Zipcode</label>
                    <input type="text" placeholder="Enter Zip Code Here.." name="zipcode" id="zipcode" 
                           class="form-control" title="Please enter the valid zipcode" maxlength="5" required="required">
                    
                </div>	
            </div>
            <div class="row">                                               											                                             
                <div class="col-sm-4 form-group">
                    <label for="name">Email Id (User Name)</label>
                    <input type="email" id="email" name="emailId" class="form-control" placeholder="Enter Email Id Here.." 
                    aria-describedby="name-format" title="Please enter the valid email id" required="required">
                    
                </div>                                      										                                               
                <div class="col-sm-4 form-group">
                    <label>Password 1</label>
                    <input type="password" placeholder="Enter Primary Password Here.." name="primaryPassword" 
                    required="required" type="primaryPassword" id="primaryPassword" class="form-control" title="Please enter the valid password">
                    
                </div>
                <div class="col-sm-4 form-group">
                    <label>Password 2</label>
                    <input type="password" placeholder="Enter Secondary Password Here.." 
                    type="password" required="required" name="secondaryPassword" id="secondaryPassword" class="form-control">
                    
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 form-group">
                    <label>Contact Number</label>
                    <input type="text" placeholder="Enter Phone No Here.." name="contactno" pattern="[0-9]{1}[0-9]{9}" 
                    title="Phone number should be 10 digit" class="form-control" required="required">
                </div>																			                                        
                <div class="col-sm-4 form-group">
                    <label>Security Question </label>
                    <select class="form-control input-sm" id="secQue" name="secQue" required="required">
                            <option>-- Select Question --</option>
                            <option>What is your favourite color?</option>
                            <option>What is your pet name?</option>
                            <option>What is your favourite place?</option>
                    </select>
                    
                </div>
                <div class="col-sm-4 form-group">
                    <label>Security Question Answer</label>
                    <input type="text" placeholder="Enter Your Answer Here.." id="secqueAnswer" name="secqueAnswer" 
                    class="form-control" required="required" title="Please enter the valid answer">
                    
                </div>
            </div>
        </div>
            <div class="inputWrap" >
                <input type="button" onclick="location.href='index.jsp'" class="btnStyle-1"value="Previous" style="width:80px" />
                <input type="button" onclick="location.href='index.jsp'" class="btnStyle" value="Home"style="width:80px" />
                <input type="submit" onclick="return validate()" class="btnStyle" value="Next" style="width:80px" />
            </div>
    </form>
    <hr>
</div>
    
</body>
</html>

