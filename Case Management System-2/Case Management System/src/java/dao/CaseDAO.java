package dao;

import Model.CaseDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySqlConnection;

public class CaseDAO {
    
    public static boolean addCase(String caseName,String getCaseType,String getClientName,String caseStatus,String caseStartDate,
            String caseHearing,String mediator,String party1,String party2,String notes,String actionTook,String actionNeedToTake,int lastupdatedBy)
    {
        boolean flag = false;
        try {

                String sql = "insert into m_case_details (case_name,case_type_id,client_id,case_status,case_start_date,"
                        + "court_hearing,mediator,party1,party2,case_notes,action_took,action_need_to_take,lastupdated_by)"
                        + " values(?,?,?,?,?,?,?,?,?,?,?,?,?)";	
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setString(1, caseName);
                stmt.setString(2, getCaseType);
                stmt.setString(3, getClientName);
                stmt.setString(4, caseStatus);
                stmt.setString(5, caseStartDate);
                stmt.setString(6, caseHearing);
                stmt.setString(7, mediator);
                stmt.setString(8, party1);
                stmt.setString(9, party2);
                stmt.setString(10, notes);
                stmt.setString(11, actionTook);
                stmt.setString(12, actionNeedToTake);
                stmt.setInt(13, lastupdatedBy);

                if(stmt.executeUpdate()==1){
                        flag = true;
                } 
        }catch(Exception e) {
                e.printStackTrace();
        }
        return flag;
    }
    
    public static CaseDetails editCase(int caseId,String caseName,String getCaseType,String getClientName,String caseStatus,String caseStartDate,
            String caseHearing,String mediator,String party1,String party2,String notes,String actionTook,String actionNeedToTake,int lastupdatedBy)
     {
         CaseDetails caseDetails = null;
          try {
              
                String sql = "update m_case_details set case_name=?,case_type_id=?,client_id=?,case_status=?,case_start_date=?,"
                        + "court_hearing=?,mediator=?,party1=?,party2=?,case_notes=?,action_took=?,action_need_to_take=?,"
                        + "lastupdated_by=? where case_id="+caseId;
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setString(1, caseName);
                stmt.setString(2, getCaseType);
                stmt.setString(3, getClientName);
                stmt.setString(4, caseStatus);
                stmt.setString(5, caseStartDate);
                stmt.setString(6, caseHearing);
                stmt.setString(7, mediator);
                stmt.setString(8, party1);
                stmt.setString(9, party2);
                stmt.setString(10, notes);
                stmt.setString(11, actionTook);
                stmt.setString(12, actionNeedToTake);
                stmt.setInt(13, lastupdatedBy);
                
                if(stmt.executeUpdate()==1)
                {
                        caseDetails = CaseDAO.getCaseById(caseId);
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return caseDetails;
    }
    
    public static CaseDetails deleteCase(String caseId)
    {
        CaseDetails caseDetails = null;
        try{
            String sql = "delete from  m_case_details where case_id="+caseId;
            PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
            if(stmt.executeUpdate()==1)
            {
                caseDetails = CaseDAO.getCaseById(Integer.parseInt(caseId));
            }
            }catch(Exception e){
                    e.printStackTrace();
            }
            return caseDetails;
    }
    
    public static CaseDetails getCaseById(int caseId)
    {
        CaseDetails caseDetails = null;
        try {
                String sql = "select * from m_case_details where case_id=?";
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setInt(1, caseId);
                ResultSet rs = stmt.executeQuery();
                if(rs.next()) 
                {
                    caseDetails = new CaseDetails();
                    caseDetails.setCaseId(rs.getInt("case_id"));
                    caseDetails.setCaseName(rs.getString("case_name"));
                    caseDetails.setCaseTypeId(CaseTypeDAO.getCaseTypeById(Integer.parseInt(rs.getString("case_type_id"))));
                    caseDetails.setClientId(ClientDAO.getClientById(Integer.parseInt(rs.getString("client_id"))));
                    caseDetails.setCaseStatus(rs.getString("case_status"));
                    caseDetails.setCaseStartDate(rs.getDate("case_start_date"));
                    caseDetails.setCourtHearing(rs.getDate("court_hearing"));
                    caseDetails.setMediator(rs.getString("mediator"));
                    caseDetails.setParty1(rs.getString("party1"));
                    caseDetails.setParty2(rs.getString("party2"));
                    caseDetails.setCaseNotes(rs.getString("case_notes"));
                    caseDetails.setActionTook(rs.getString("action_took"));
                    caseDetails.setActionNeedToTake(rs.getString("action_need_to_take"));
                    caseDetails.setLastUpdateBy(AttorneyDAO.getAttorneyById(Integer.parseInt(rs.getString("lastupdated_by"))));
                    caseDetails.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    return caseDetails;
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return caseDetails;
    }
    
     public static CaseDetails getCaseDetailsByAttorneyId(int attorneyId)
    {
        CaseDetails caseDetails = null;
        try {
                String sql = "select * from m_case_details lastupdated_by="+attorneyId;
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setInt(1, attorneyId);
                ResultSet rs = stmt.executeQuery();
                if(rs.next()) 
                {
                    caseDetails = new CaseDetails();
                    caseDetails.setCaseId(rs.getInt("case_id"));
                    caseDetails.setCaseName(rs.getString("case_name"));
                    caseDetails.setCaseTypeId(CaseTypeDAO.getCaseTypeById(Integer.parseInt(rs.getString("case_type_id"))));
                    caseDetails.setClientId(ClientDAO.getClientById(Integer.parseInt(rs.getString("client_id"))));
                    caseDetails.setCaseStatus(rs.getString("case_status"));
                    caseDetails.setCaseStartDate(rs.getDate("case_start_date"));
                    caseDetails.setCourtHearing(rs.getDate("court_hearing"));
                    caseDetails.setMediator(rs.getString("mediator"));
                    caseDetails.setParty1(rs.getString("party1"));
                    caseDetails.setParty2(rs.getString("party2"));
                    caseDetails.setCaseNotes(rs.getString("case_notes"));
                    caseDetails.setActionTook(rs.getString("action_took"));
                    caseDetails.setActionNeedToTake(rs.getString("action_need_to_take"));
                    caseDetails.setLastUpdateBy(AttorneyDAO.getAttorneyById(Integer.parseInt(rs.getString("lastupdated_by"))));
                    caseDetails.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    return caseDetails;
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return caseDetails;
    }
    
    public static List<CaseDetails> getCase()
    {
         List<CaseDetails> caseDetailsList = new ArrayList<>();
         try {
                String sql = "select * from m_case_details";
                Connection db = MySqlConnection.getConnection();
                ResultSet rs = db.createStatement().executeQuery(sql);
                while(rs.next())
                {
                    CaseDetails caseDetails = new CaseDetails();
                    caseDetails.setCaseId(rs.getInt("case_id"));
                    caseDetails.setCaseName(rs.getString("case_name"));
                    caseDetails.setCaseTypeId(CaseTypeDAO.getCaseTypeById(Integer.parseInt(rs.getString("case_type_id"))));
                    caseDetails.setClientId(ClientDAO.getClientById(Integer.parseInt(rs.getString("client_id"))));
                    caseDetails.setCaseStatus(rs.getString("case_status"));
                    caseDetails.setCaseStartDate(rs.getDate("case_start_date"));
                    caseDetails.setCourtHearing(rs.getDate("court_hearing"));
                    caseDetails.setMediator(rs.getString("mediator"));
                    caseDetails.setParty1(rs.getString("party1"));
                    caseDetails.setParty2(rs.getString("party2"));
                    caseDetails.setCaseNotes(rs.getString("case_notes"));
                    caseDetails.setActionTook(rs.getString("action_took"));
                    caseDetails.setActionNeedToTake(rs.getString("action_need_to_take"));
                    caseDetails.setLastUpdateBy(AttorneyDAO.getAttorneyById(Integer.parseInt(rs.getString("lastupdated_by"))));
                    caseDetails.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    caseDetailsList.add(caseDetails);
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return caseDetailsList;
    }
    
    public static List<CaseDetails> getCaseDetailsById(int attorneyId)
    {
         List<CaseDetails> caseDetailsList = new ArrayList<>();
         try {
                String sql = "select * from m_case_details where lastupdated_by="+attorneyId;
                Connection db = MySqlConnection.getConnection();
                ResultSet rs = db.createStatement().executeQuery(sql);
                while(rs.next())
                {
                    CaseDetails caseDetails = new CaseDetails();
                    caseDetails.setCaseId(rs.getInt("case_id"));
                    caseDetails.setCaseName(rs.getString("case_name"));
                    caseDetails.setCaseTypeId(CaseTypeDAO.getCaseTypeById(Integer.parseInt(rs.getString("case_type_id"))));
                    caseDetails.setClientId(ClientDAO.getClientById(Integer.parseInt(rs.getString("client_id"))));
                    caseDetails.setCaseStatus(rs.getString("case_status"));
                    caseDetails.setCaseStartDate(rs.getDate("case_start_date"));
                    caseDetails.setCourtHearing(rs.getDate("court_hearing"));
                    caseDetails.setMediator(rs.getString("mediator"));
                    caseDetails.setParty1(rs.getString("party1"));
                    caseDetails.setParty2(rs.getString("party2"));
                    caseDetails.setCaseNotes(rs.getString("case_notes"));
                    caseDetails.setActionTook(rs.getString("action_took"));
                    caseDetails.setActionNeedToTake(rs.getString("action_need_to_take"));
                    caseDetails.setLastUpdateBy(AttorneyDAO.getAttorneyById(Integer.parseInt(rs.getString("lastupdated_by"))));
                    caseDetails.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    caseDetailsList.add(caseDetails);
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return caseDetailsList;
    }
    
}
