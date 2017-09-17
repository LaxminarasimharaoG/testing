<!DOCTYPE html>
<html lang="en">
<head>
    <title>Legal Law Management Register Page</title>
    <link href="asset/css/bootstrap.min.css" rel="stylesheet">
    <link href="asset/css/modern-business.css" rel="stylesheet">
    <link href="asset/css/form.css" rel="stylesheet">
    <link href="asset/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#frm").submit(function (e) {
                if ($("#txtPwd").val() != $("#txtCPwd").val()) {
                    e.preventDefault();
                    alert('Password and confirm password should be same');
                }
            });
        });
        
        
function goBack() {
    window.history.back();
}

    </script>
</head>

<body>
<nav class="navbar navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="fa fa-bars" style="color:#E3B228;"></span>
            </button>
            <a class="navbar-brand" href="index.html">
                <img src="asset/img/logo.png" width="220px" height="35px" style="margin-top: -1px"
                     alt="Home">
            </a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                    <li class="active home"><a href="index.jsp">Home</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contactus.jsp">Contact Us</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div>
                <h1 class="page-header">
                    Welcome to Case Management System
                </h1>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i> Registration Form</h4>
                </div>
                <div class="panel-body">
                    <div class="form">
                        <form action="UserController?action=userRegister" id="frm" method="post" id="reg-frm" style="width:450px;">

                            <div class="row">
                                <label>First Name:</label><input type="text" pattern="^[a-z A-Z]+$" name="txtFirstName"
                                                                required="required"/>
                            </div>
                            <div class="row">
                                <label>Last Name:</label><input type="text" pattern="^[a-z A-Z]+$" name="txtLastName"
                                                                required="required"/>
                            </div>
                            <div class="row">
                                <label>Email ID:</label><input type="email" name="txtMailId"
                                                               required="required"/>
                            </div>
                            <div class="row">
                                <label>Password:</label><input type="password" name="txtPwd" id="txtPwd"
                                                               required="required"/>
                            </div>
                            <div class="row">
                                <label>Confirm Password:</label><input type="password" name="txtCPwd" id="txtCPwd"
                                                                       required="required"/>
                            </div>
                            <div class="row">
                                <label>Contact No:</label><input type="number" pattern="\d+(\d{10})?" 
                                                          name="txtTno" required="required"/>
														  </div>
							<div class="row">
							</div>
                            <div class="row" style="padding-left: 180px">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="reset" class="btn btn-primary">Reset</button>
                                <button type="back" class="btn btn-primary" onclick="goBack()">Back</button>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>&copy; 2017 Copyright. All Rights Reserved.</p>
            </div>
        </div>
    </footer>-->
</div>
</body>
</html>
