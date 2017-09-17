package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.AdminDAO;
import util.MailSending;
import Model.Admin;
import java.util.Random;


@WebServlet("/AdminController")
public class AdminController extends HttpServlet
{

    public AdminController() 
    {
        super();
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
        //HttpSession httpSession = request.getSession();
        try 
        {
            String actionType = request.getParameter("action");
            switch(actionType) 
            {
                case "adminDeleteProfile":
                {
                    String adminId=request.getParameter("adminId");
                    Admin admin = AdminDAO.deleteAdmin(adminId);
                    
                    if(admin!=null)
                        {
                            rd = request.getRequestDispatcher("/ViewAllAdmin.jsp?msg=admin-delete-profile-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/ViewAllAdmin.jsp?msg=admin-delete-profile-failure");
                        }
                    
                    break;
                }
            }
        }
        catch(Exception e) 
        {
            e.printStackTrace();
        }
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //PrintWriter out = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
        HttpSession httpSession = request.getSession();
        try 
        {
            String actionType = request.getParameter("action");
            switch(actionType) 
            {
                case "adminLoginCheck":
                {
                    String userName = request.getParameter("emailId");
                    String priPassword = request.getParameter("priPassword");
                    String SecPassword = request.getParameter("SecPassword");
                    Admin admin = AdminDAO.adminLoginCheck(userName, priPassword,SecPassword);
                    
                    if(admin == null)
                    {
                        rd = request.getRequestDispatcher("/AdminLogin.jsp?msg=admin-login-failure");    
                    }
                    else
                    {       
                        System.out.println("LOGIN SUCCESS");
                        
                        httpSession.setAttribute("CurrAdmin", admin);
                         
                        rd = request.getRequestDispatcher("/AdminHome.jsp?msg=admin-login-success"); 
                    }
                    break;
		}
                
                case "adminForgotPasswordEmailCheck":
                {
                    
                    String email = request.getParameter("email");
                    Admin admin = AdminDAO.getAdminByMailId(email);
                        
                        if(admin!=null)
                        {
                            httpSession.setAttribute("CurrAdmin", admin);
                            rd = request.getRequestDispatcher("/AdminForgotPasswordSecQue.jsp?msg=admin-emailid-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AdminForgotPassword.jsp?msg=admin-emailid-failure");
                        }
                    
                    break;
		}
                
                case "adminForgotPassword":
                {
                    String seqAnswer = request.getParameter("seqAnswer");
                    Admin currentAdmin = (Admin)httpSession.getAttribute("CurrAdmin");
                                            
                        if(currentAdmin.getSecQueAnswer().equals(seqAnswer.toLowerCase()))
                        {
                            Random rnd = new Random();
                            int n = 100000 + rnd.nextInt(900000);
                            String newPwd = Integer.toString(n);
                            
                            boolean flag = AdminDAO.forgotPassword(currentAdmin.getAdminId(),newPwd);
                            String name = currentAdmin.getFirstName() + " " + currentAdmin.getLastName();
                            String emailId = currentAdmin.getEmailId();
                            String sub = "Forgot Password !!!";
                            String msg = "Welcome to Case Management System !!!" + "\nDear " + name + "," + "\nYour New Password is " + newPwd;
                            boolean mailFlag = MailSending.emailSending(emailId, sub, msg);

                            if(flag && mailFlag)
                            {     
                                rd = request.getRequestDispatcher("/AdminLogin.jsp?msg1=admin-secqueans-success");
                            }
                            else
                            {
                                rd = request.getRequestDispatcher("/AdminForgotPasswordSecQue.jsp?msg=admin-secqueans-failure");
                            }
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AdminForgotPasswordSecQue.jsp?msg=admin-secqueans-failure");
                        }
                    
                    break;
		}
                
                case "adminChangePassword":
                {
                    String currentPassword = request.getParameter("currentPassword");
                    String newPassword = request.getParameter("newPassword");
                    String confirmPassword = request.getParameter("confirmPassword");
                    
                    Admin currentAdmin = (Admin)httpSession.getAttribute("CurrAdmin");
                                            
                        if(currentAdmin.getPassword().equals(currentPassword))
                        {                     
                            if(newPassword.equals(confirmPassword))
                            {
                                boolean flag = AdminDAO.changePassword(currentAdmin.getAdminId(),newPassword);
                           
                                if(flag)
                                {     
                                    rd = request.getRequestDispatcher("/AdminChangePassword.jsp?msg=admin-changepassword-success");
                                }
                                else
                                {
                                    rd = request.getRequestDispatcher("/AdminChangePassword.jsp?msg=admin-changepassword-failure");
                                }
                            }
                            else
                            {
                                rd = request.getRequestDispatcher("/AdminChangePassword.jsp?msg=admin-confirmpasword-doesnot-match");
                            }
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AdminChangePassword.jsp?msg=admin-currentpassword-failure");
                        }
                    
                    break;
		}
                
                case "adminUpdateProfile":
                {
                    
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String companyId = request.getParameter("companyId");
                    String address = request.getParameter("address");
                    String street = request.getParameter("street");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zipcode = request.getParameter("zipcode");
                    String contactno = request.getParameter("contactno");
                    
                    
                    Admin currentAdmin = (Admin)httpSession.getAttribute("CurrAdmin");
                    
                    Admin admin = AdminDAO.adminUpdateProfile(currentAdmin.getAdminId(),firstName,lastName,companyId,address,street,
                            city,state,zipcode,contactno);
                        
                        if(admin!=null)
                        {
                            httpSession.setAttribute("CurrAdmin", admin);
                            rd = request.getRequestDispatcher("/AdminUpdateProfile.jsp?msg=admin-update-profile-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AdminUpdateProfile.jsp?msg=admin-update-profile-failure");
                        }
                    
                    break;
		}
                
                case "adminEditProfile":
                {
                    String adminId=request.getParameter("adminId");
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String companyId = request.getParameter("companyId");
                    String address = request.getParameter("address");
                    String street = request.getParameter("street");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zipcode = request.getParameter("zipcode");
                    String contactno = request.getParameter("contactno");
                    
                    //Admin currentAdmin = (Admin)httpSession.getAttribute("CurrAdmin");
                    
                    Admin admin = AdminDAO.adminEditProfile(Integer.parseInt(adminId),firstName,lastName,companyId,address,street,
                            city,state,zipcode,contactno);
                        
                        if(admin!=null)
                        {
                            //httpSession.setAttribute("CurrAdmin", admin);
                            rd = request.getRequestDispatcher("/ViewAllAdmin.jsp?msg=admin-edit-profile-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/EditAdmin.jsp?msg=admin-edit-profile-failure");
                        }
                    
                    break;
		}
                
                
                
                case "adminRegister": 
                {
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String companyId = request.getParameter("companyId");
                    String dob = request.getParameter("dob");
                    String address = request.getParameter("address");
                    String street = request.getParameter("street");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zipcode = request.getParameter("zipcode");
                    String secQue = request.getParameter("secQue");
                    String secqueAnswer = request.getParameter("secqueAnswer");
                    String contactno = request.getParameter("contactno");
                    String emailId = request.getParameter("emailId");
                    String primaryPassword = request.getParameter("primaryPassword");
                    String secondaryPassword = request.getParameter("secondaryPassword");
                    

                    if(!primaryPassword.equals(secondaryPassword)) 
                    {
                        if(!AdminDAO.checkEmailAddressAlreadyExist(emailId))
                        {
                            String name = firstName + " " + lastName;
                            String sub = "Registration Successful !!!";
                            String msg = "Welcome to Case Management System !!!" + "\nDear " + name + "," + "\nYour User Name is " + emailId + ""
                                    + "\nYour Primary Password is " +primaryPassword + " and Secondary Password is "+secondaryPassword;
                           
                            boolean flag = AdminDAO.saveAdmin(firstName,lastName,companyId,dob,address,street,city,state,zipcode,secQue,
                                                                secqueAnswer,contactno,emailId,primaryPassword,secondaryPassword);
                            boolean mailFlag = MailSending.emailSending(emailId, sub, msg);
                            //System.out.println("Email Sent Successfully");
                            
                            if(flag && mailFlag)
                            {
                                    rd = request.getRequestDispatcher("/AdminLogin.jsp?msg=admin-reg-success");
                            }
                            else
                            {
                                    //System.out.println("Not-Inserted");

                                    rd = request.getRequestDispatcher("/AdminRegistration.jsp?msg=admin-reg-failure");
                            }
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AdminRegistration.jsp?msg=email-already-exist");
                        }
                    } 
                    else 
                    {
                        System.out.println("Password mismatch");
                        rd = request.getRequestDispatcher("/Admin-Registration.jsp?err=pwd-mismatch");
                    }
                    break;
                }
                default:
                System.out.println("There is no " + actionType + " in AdminController POST ");
            }
        } 
        catch(Exception e) 
        {
            e.printStackTrace();
        }
        rd.forward(request, response);
    }
}
