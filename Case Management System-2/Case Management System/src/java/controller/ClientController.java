package controller;

import Model.Client;
import Model.Attorney;
import dao.ClientDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ClientController")
public class ClientController extends HttpServlet {

    public ClientController() 
    {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
        
        try 
        {
            String actionType = request.getParameter("action");
            switch(actionType) 
            {
                case "deleteClient":
                {
                    String clientId=request.getParameter("clientId");
                    Client client = ClientDAO.deleteClient(clientId);
                    
                    if(client!=null)
                    {
                        rd = request.getRequestDispatcher("/ViewClient.jsp?msg=client-delete-success");
                    }
                    else
                    {
                        rd = request.getRequestDispatcher("/ViewClient.jsp?msg=client-delete-failure");
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
                case "addClient":
                {
                    String clientName = request.getParameter("clientName");
                    String clientEmailId = request.getParameter("clientEmailId");
                    String clientContactNo = request.getParameter("clientContactNo");
                    String clientAddress = request.getParameter("clientAddress");
                    
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney"); 
                    
                    if(!ClientDAO.clientNameAlreadyExist(clientName))
                    {
                        boolean flag = ClientDAO.addClient(clientName, clientEmailId,clientContactNo,clientAddress,currentAttorney.getAttorneyId());

                        if(flag)
                        {
                            rd = request.getRequestDispatcher("/ViewClient.jsp?msg=add-client-success");
                        }
                        else
                        {

                            rd = request.getRequestDispatcher("/AddClient.jsp?msg=add-client-failure");
                        }
                    }
                    else
                    {
                        rd = request.getRequestDispatcher("/AddClient.jsp?msg=client-name-already-exist");
                    }
                    break;
		}
                case "editClient":
                {
                    String clientId = request.getParameter("clientId");
                    String clientName = request.getParameter("clientName");
                    String clientEmailId = request.getParameter("clientEmailId");
                    String clientContactNo = request.getParameter("clientContactNo");
                    String clientAddress = request.getParameter("clientAddress");
                   
                    Attorney currentAttorney = (Attorney)httpSession.getAttribute("currentAttorney"); 
                    Client client = ClientDAO.editClient(Integer.parseInt(clientId),clientName, clientEmailId,
                            clientContactNo,clientAddress,currentAttorney.getAttorneyId());
                    
                        if(client!=null)
                        {
                            rd = request.getRequestDispatcher("/ViewClient.jsp?msg=client-edit-success");
                        }
                        else
                        {
                            rd = request.getRequestDispatcher("/EditClient.jsp?msg=client-edit-failure");
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
