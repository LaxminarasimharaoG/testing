package controller;

import dao.AttorneyDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.MailSending;
import Model.Attorney;
import java.util.Random;

@WebServlet("/AttorneyController")
public class AttorneyController extends HttpServlet {

    public AttorneyController() 
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
                case "attorneyDeleteProfile":
                {
                    String attorneyId=request.getParameter("attorneyId");
                    Attorney attorney = AttorneyDAO.deleteAttorney(attorneyId);
                    
                    if(attorney!=null)
                        {
                            rd = request.getRequestDispatcher("/ViewAllAttorney.jsp?msg=attorney-delete-profile-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/ViewAllAttorney.jsp?msg=attorney-delete-profile-failure");
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
        RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
        HttpSession httpSession = request.getSession();
        try 
        {
            String actionType = request.getParameter("action");
            switch(actionType) 
            {
                case "attorneyLoginCheck":
                {
                    String userName = request.getParameter("emailId");
                    String Pwd = request.getParameter("password");
                    Attorney attorney = AttorneyDAO.attorneyLoginCheck(userName, Pwd);
                    
                    if(attorney == null)
                    {
                        rd = request.getRequestDispatcher("/AttorneyLogin.jsp?msg=attorney-login-failure");
                    }
                    else
                    {       
                        httpSession.setAttribute("currentAttorney", attorney);
                        rd = request.getRequestDispatcher("/AttorneyHome.jsp?msg=attorney-login-success");
                    }
                    break;
		}
                
                case "attorneyForgotPasswordEmailCheck":
                {
                    
                    String email = request.getParameter("email");
                    Attorney attorney = AttorneyDAO.getAttorneyByMailId(email);
                        
                        if(attorney!=null)
                        {
                            httpSession.setAttribute("currentAttorney", attorney);
                            rd = request.getRequestDispatcher("/AttorneyForgotPasswordSecQue.jsp?msg=attorney-emailid-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AttorneyForgotPassword.jsp?msg=attorney-emailid-failure");
                        }
                    
                    break;
		}
                
                case "attorneyForgotPassword":
                {
                    String seqAnswer = request.getParameter("seqAnswer");
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney");
                                            
                        if(currentAttorney.getSecQueAnswer().equals(seqAnswer.toLowerCase()))
                        {
                            Random rnd = new Random();
                            int n = 100000 + rnd.nextInt(600000);
                            String newPwd = Integer.toString(n);
                            
                            boolean flag = AttorneyDAO.forgotPassword(currentAttorney.getAttorneyId(),newPwd);
                            String name = currentAttorney.getFirstName() + " " + currentAttorney.getLastName();
                            String emailId = currentAttorney.getEmailId();
                            String sub = "Forgot Password !!!";
                            String msg = "Welcome to Case Management System !!!" + "\nDear " + name + "," + "\nYour New Password is " + newPwd;
                            boolean mailFlag = MailSending.emailSending(emailId, sub, msg);

                            if(flag && mailFlag)
                            {     
                                rd = request.getRequestDispatcher("/AttorneyLogin.jsp?msg1=attorney-secqueans-success");
                            }
                            else
                            {
                                rd = request.getRequestDispatcher("/AttorneyForgotPasswordSecQue.jsp?msg=attorney-secqueans-failure");
                            }
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AttorneyForgotPasswordSecQue.jsp?msg=attorney-secqueans-failure");
                        }
                    
                    break;
		}
                
                case "attorneyChangePassword":
                {
                    String currentPassword = request.getParameter("currentPassword");
                    String newPassword = request.getParameter("newPassword");
                    String confirmPassword = request.getParameter("confirmPassword");
                    
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney");
                                            
                        if(currentAttorney.getPassword().equals(currentPassword))
                        {                     
                            if(newPassword.equals(confirmPassword))
                            {
                                boolean flag = AttorneyDAO.changePassword(currentAttorney.getAttorneyId(),newPassword);
                           
                                if(flag)
                                {     
                                    rd = request.getRequestDispatcher("/AttorneyChangePassword.jsp?msg=attorney-changepassword-success");
                                }
                                else
                                {
                                    rd = request.getRequestDispatcher("/AttorneyChangePassword.jsp?msg=attorney-changepassword-failure");
                                }
                            }
                            else
                            {
                                rd = request.getRequestDispatcher("/AttorneyChangePassword.jsp?msg=attorney-confirmpasword-doesnot-match");
                            }
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AttorneyChangePassword.jsp?msg=attorney-currentpassword-failure");
                        }
                    
                    break;
		}
                
                case "attorneyUpdateProfile":
                {
                    
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String yoe = request.getParameter("yoe");
                    String address = request.getParameter("address");
                    String street = request.getParameter("street");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zipcode = request.getParameter("zipcode");
                    String contactno = request.getParameter("contactno");
                   
                    
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney");
                    
                    Attorney attorney = AttorneyDAO.attorneyUpdateProfile(currentAttorney.getAttorneyId(),firstName,lastName,yoe,address,street,
                            city,state,zipcode,contactno);
                        
                        if(attorney!=null)
                        {
                            httpSession.setAttribute("currentAttorney", attorney);
                            rd = request.getRequestDispatcher("/AttorneyUpdateProfile.jsp?msg=attorney-update-profile-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AttorneyUpdateProfile.jsp?msg=attorney-update-profile-failure");
                        }
                    
                    break;
		}
                
                case "attorneyEditProfile":
                {
                    String attorneyId = request.getParameter("attorneyId");
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String yoe = request.getParameter("yoe");
                    String address = request.getParameter("address");
                    String street = request.getParameter("street");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zipcode = request.getParameter("zipcode");
                    String contactno = request.getParameter("contactno");
                    
                    //Attorney currentAttorney = (Attorney)httpSession.getAttribute("CurrAttorney");
                    
                    Attorney attorney = AttorneyDAO.attorneyEditProfile(Integer.parseInt(attorneyId),firstName,lastName,yoe,address,street,
                            city,state,zipcode,contactno);
                        
                        if(attorney!=null)
                        {
                            rd = request.getRequestDispatcher("/ViewAllAttorney.jsp?msg=attorney-edit-profile-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AttorneyUpdateProfile.jsp?msg=attorney-edit-profile-failure");
                        }
                    
                    break;
		}
                             
                case "attorneyRegister": 
                {
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String yoe = request.getParameter("yoe");
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
                    String password = request.getParameter("password");
                    String confirmpassword = request.getParameter("confirmpassword");

                    if(password.equals(confirmpassword)) 
                    {
                        if(!AttorneyDAO.checkEmailAddressAlreadyExist(emailId))
                        {
                            String name = firstName + " " + lastName;
                            String sub = "Registration Successful !!!";
                            String msg = "Welcome to Case Management System !!!" + "\nDear " + name + "," + "\nYour User Name is " + emailId + " and Password is :" +password;
                            boolean mailFlag = MailSending.emailSending(emailId, sub, msg);
                            //System.out.println("Email Sent Successfully");
                            boolean flag = AttorneyDAO.saveAttorney(firstName,lastName,yoe,dob,address,street,city,state,zipcode,secQue,
                                                                secqueAnswer,contactno,emailId,password);
                            if(flag==true && mailFlag==true)
                            {
                                    //System.out.println("Inserted");
                                    rd = request.getRequestDispatcher("/AttorneyLogin.jsp?msg=attorney-reg-success");
                            }
                            else
                            {
                                    //System.out.println("Not-Inserted");
                                    rd = request.getRequestDispatcher("/AttorneyRegistration.jsp?msg=attorney-reg-failure");
                            }
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/AttorneyRegistration.jsp?msg=email-already-exist");
                        }
                    } 
                    else 
                    {
                        //System.out.println("Password mismatch");
                        rd = request.getRequestDispatcher("/AttorneyRegistration.jsp?err=pwd-mismatch");
                    }
                    break;
                }
                default:
                System.out.println("There is no " + actionType + " in AttorneyController POST ");
            }
        } 
        catch(Exception e) 
        {
            e.printStackTrace();
        }
        rd.forward(request, response);
    }
}
