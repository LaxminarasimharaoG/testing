package controller;

import Model.Attorney;
import Model.CaseDetails;
import dao.CaseDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CaseController")
public class CaseController extends HttpServlet {

    public CaseController() 
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
                case "deleteCase":
                {
                    String caseId=request.getParameter("caseId");
                    CaseDetails caseDetails = CaseDAO.deleteCase(caseId);
                    
                    if(caseDetails!=null)
                    {
                        rd = request.getRequestDispatcher("/ViewCase.jsp?msg=casetype-delete-success");
                    }
                    else
                    {
                        rd = request.getRequestDispatcher("/ViewCase.jsp?msg=casetype-delete-failure");
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
                case "addCase":
                {
                    String getClientName = request.getParameter("getClientName");
                    String getCaseType = request.getParameter("getCaseType");
                    String caseName = request.getParameter("caseName");
                    String caseStatus = request.getParameter("caseStatus");
                    String caseStartDate = request.getParameter("caseStartDate");
                    String caseHearing = request.getParameter("caseHearing");
                    String mediator = request.getParameter("mediator");
                    String party1 = request.getParameter("party1");
                    String party2 = request.getParameter("party2");
                    String notes = request.getParameter("notes");
                    String actionTook = request.getParameter("actionTook");
                    String actionNeedToTake = request.getParameter("actionNeedToTake");
                    
                    
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney");
                    boolean flag = CaseDAO.addCase(caseName,getCaseType,getClientName,caseStatus,caseStartDate,caseHearing,
                            mediator,party1,party2,notes,actionTook,actionNeedToTake,currentAttorney.getAttorneyId());
                    
                    if(flag)
                    {
                        rd = request.getRequestDispatcher("/ViewCase.jsp?msg=add-case-success");
                    }
                    else
                    {
                            
                        rd = request.getRequestDispatcher("/AddCase.jsp?msg=add-case-failure");
                    }
                    break;
		}
                case "editCase":
                {
                    String caseId=request.getParameter("caseId");
                    String getClientName = request.getParameter("getClientName");
                    String getCaseType = request.getParameter("getCaseType");                  
                    String caseName = request.getParameter("caseName");
                    String caseStatus = request.getParameter("caseStatus");
                    String caseStartDate = request.getParameter("caseStartDate");
                    String caseHearing = request.getParameter("caseHearing");
                    String mediator = request.getParameter("mediator");
                    String party1 = request.getParameter("party1");
                    String party2 = request.getParameter("party2");
                    String notes = request.getParameter("notes");
                    String actionTook = request.getParameter("actionTook");
                    String actionNeedToTake = request.getParameter("actionNeedToTake");
                   
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney");
                    CaseDetails caseDetails = CaseDAO.editCase(Integer.parseInt(caseId),caseName,getCaseType,getClientName,caseStatus,
                            caseStartDate,caseHearing,mediator,party1,party2,notes,actionTook,actionNeedToTake,currentAttorney.getAttorneyId());
                    
                        if(caseDetails!=null)
                        {
                            rd = request.getRequestDispatcher("/ViewCase.jsp?msg=case-edit-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/EditCase.jsp?msg=case-edit-failure");
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
