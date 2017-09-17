package controller;

import Model.CaseType;
import Model.Admin;
import Model.Attorney;
import dao.CaseTypeDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CaseTypeController")
public class CaseTypeController extends HttpServlet 
{

    public CaseTypeController() 
    {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
        //HttpSession httpSession = request.getSession();
        try 
        {
            String actionType = request.getParameter("action");
            switch(actionType) 
            {
                case "deleteCaseType":
                {
                    String caseTypeId=request.getParameter("caseTypeId");
                    CaseType caseTyep = CaseTypeDAO.deleteCaseType(caseTypeId);
                    
                    if(caseTyep!=null)
                    {
                        rd = request.getRequestDispatcher("/ViewCaseType.jsp?msg=casetype-delete-success");
                    }
                    else
                    {
                        rd = request.getRequestDispatcher("/ViewCaseType.jsp?msg=casetype-delete-failure");
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

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
        HttpSession httpSession = request.getSession();
        try 
        {
            String actionType = request.getParameter("action");
            switch(actionType) 
            {
                case "addCaseType":
                {
                    String caseType = request.getParameter("caseType");
                    String description = request.getParameter("description");
                    
                    //Admin currentAdmin = (Admin)httpSession.getAttribute("CurrAdmin");
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney");
                    
                    if(!CaseTypeDAO.caseTypeAlreadyExist(caseType))
                    {
                        boolean flag = CaseTypeDAO.addCaseType(caseType, description, currentAttorney.getAttorneyId());

                        if(flag)
                        {
                            rd = request.getRequestDispatcher("/ViewCaseType.jsp?msg=add-case-type-success");
                        }
                        else
                        {

                            rd = request.getRequestDispatcher("/AddCaseType.jsp?msg=add-case-type-failure");
                        }
                    }
                    else
                    {
                        rd = request.getRequestDispatcher("/AddCaseType.jsp?msg=case-type-already-exist");
                    }
                    break;
		}
                case "editCaseType":
                {
                    String caseTypeId=request.getParameter("caseTypeId");
                    String strCaseType=request.getParameter("caseType");
                    String description = request.getParameter("description");
                   
                    //Admin currentAdmin = (Admin)httpSession.getAttribute("CurrAdmin");
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney");
                    CaseType caseType = CaseTypeDAO.editCaseType(Integer.parseInt(caseTypeId),strCaseType, description, currentAttorney.getAttorneyId());;
                    
                        if(caseType!=null)
                        {
                            rd = request.getRequestDispatcher("/ViewCaseType.jsp?msg=casetype-edit-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/EditCaseType.jsp?msg=casetype-edit-failure");
                        }
                    
                    break;
		}
                
                default:
                System.out.println("There is no " + actionType + " in CaseTypeController POST ");
            }
        } 
        catch(Exception e) 
        {
            e.printStackTrace();
        }
        rd.forward(request, response);
    }
    
}
