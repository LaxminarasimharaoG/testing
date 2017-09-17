package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
		try {
			String actionType = request.getParameter("action");
			switch(actionType) {
				case "userRegister": {
					String txtFirstName = request.getParameter("txtFirstName");
                                        String txtLastName = request.getParameter("txtLastName");
					String txtMailId = request.getParameter("txtMailId");
					String txtPwd = request.getParameter("txtPwd");
					String txtCPwd = request.getParameter("txtCPwd");
					String txtTno = request.getParameter("txtTno");
					if(txtPwd.equals(txtCPwd)) {
						boolean flag = UserDAO.saveUser(txtFirstName,txtLastName, txtMailId, txtPwd, txtTno);
						if(flag)
							rd = request.getRequestDispatcher("/index.jsp?msg=user-reg-success");
						else
							rd = request.getRequestDispatcher("/index.jsp?msg=user-reg-failure");
					} else {
						System.out.println("Password mismatch");
						rd = request.getRequestDispatcher("/register.jsp?err=pwd-mismatch");
					}
					break;
				}
				case "loginCheck":{
					String txtMailId = request.getParameter("txtMailId");
					String txtPwd = request.getParameter("txtPwd");
					boolean flag = UserDAO.loginCheck(txtMailId, txtPwd);
					if(flag){
						System.out.println("LOGIN SUCCESS");
						rd = request.getRequestDispatcher("/home.jsp?msg=user-login-success");
					}else
						rd = request.getRequestDispatcher("/home.jsp?msg=user-login-failure");
					break;
				}
				default:
					System.out.println("There is no " + actionType + " in UserController POST ");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		rd.forward(request, response);
	}
	
	private static boolean loginCheck(HttpServletRequest request) {
		try {
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private static boolean userRegistration(HttpServletRequest request) {
		try {
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
