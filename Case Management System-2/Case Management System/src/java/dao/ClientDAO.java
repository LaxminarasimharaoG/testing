package dao;

import Model.Client;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySqlConnection;

public class ClientDAO {
    
    public static boolean addClient(String clientName, String clientEmail,String clientContactNo,String clientAddress,int lastupdatedBy)
    {
        boolean flag = false;
        try {

                String sql = "insert into m_client (client_name,client_email_id,client_contact_no,client_address,lastupdated_by)"
                + " values(?,?,?,?,?)";	
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setString(1, clientName);
                stmt.setString(2, clientEmail);
                stmt.setString(3, clientContactNo);
                stmt.setString(4, clientAddress);
                stmt.setInt(5, lastupdatedBy);

                if(stmt.executeUpdate()==1){
                        flag = true;
                } 
        }catch(Exception e) {
                e.printStackTrace();
        }
        return flag;
    }
    
    public static Client editClient(int clientId,String clientName, String clientEmail,String clientContactNo,String clientAddress,int lastupdatedBy)
     {
         Client client = null;
          try {
              
                String sql = "update m_client set client_name=?,client_email_id=?,client_contact_no=?,client_address=?,"
                        + "lastupdated_by=? where client_id="+clientId;
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setString(1, clientName);
                stmt.setString(2, clientEmail);
                stmt.setString(3, clientContactNo);
                stmt.setString(4, clientAddress);
                stmt.setInt(5, lastupdatedBy);
                
                if(stmt.executeUpdate()==1)
                {
                        client = ClientDAO.getClientById(clientId);
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return client;
     }
    
    public static Client deleteClient(String clientId)
    {
        Client client = null;
        try{
            String sql = "delete from  m_client where client_id="+clientId;
            PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
            if(stmt.executeUpdate()==1)
            {
                client = ClientDAO.getClientById(Integer.parseInt(clientId));
            }
            }catch(Exception e){
                    e.printStackTrace();
            }
            return client;
    }
    
    public static Client getClientById(int clientId)
    {
        Client client = null;
        try {
                String sql = "select * from m_client where client_id=?";
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setInt(1, clientId);
                ResultSet rs = stmt.executeQuery();
                if(rs.next()) 
                {
                    client = new Client();
                    client.setClientId(rs.getInt("client_id"));
                    client.setClientName(rs.getString("client_name"));
                    client.setClientEmail(rs.getString("client_email_id"));
                    client.setClientContactNo(rs.getString("client_contact_no"));
                    client.setClientAddress(rs.getString("client_address"));
                    client.setLastUpdatedBy(rs.getString("lastupdated_by"));
                    client.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    return client;
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return client;
    }
    
    public static List<Client> getClient()
    {
         List<Client> clientList = new ArrayList<>();
         try {
                String sql = "select * from m_client";
                Connection db = MySqlConnection.getConnection();
                ResultSet rs = db.createStatement().executeQuery(sql);
                while(rs.next())
                {
                    Client client = new Client();
                    client.setClientId(rs.getInt("client_id"));
                    client.setClientName(rs.getString("client_name"));
                    client.setClientEmail(rs.getString("client_email_id"));
                    client.setClientContactNo(rs.getString("client_contact_no"));
                    client.setClientAddress(rs.getString("client_address"));
                    client.setLastUpdatedBy(rs.getString("lastupdated_by"));
                    client.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    clientList.add(client);
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return clientList;
    }
    
    public static List<Client> getClientDetailsById(int attorneyId)
    {
         List<Client> clientList = new ArrayList<>();
         try {
                String sql = "select * from m_client where lastupdated_by="+attorneyId;
                Connection db = MySqlConnection.getConnection();
                ResultSet rs = db.createStatement().executeQuery(sql);
                while(rs.next())
                {
                    Client client = new Client();
                    client.setClientId(rs.getInt("client_id"));
                    client.setClientName(rs.getString("client_name"));
                    client.setClientEmail(rs.getString("client_email_id"));
                    client.setClientContactNo(rs.getString("client_contact_no"));
                    client.setClientAddress(rs.getString("client_address"));
                    client.setLastUpdatedBy(rs.getString("lastupdated_by"));
                    client.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    clientList.add(client);
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return clientList;
    }
    
    public static boolean clientNameAlreadyExist(String clientName){
		boolean flag = false;
		try{
			String sql = "select * from m_client where client_name=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, clientName);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				flag = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
}
