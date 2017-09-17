package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.CaseType;
import util.MySqlConnection;

public class CaseTypeDAO {
    
    public static boolean addCaseType(String caseType, String description,int lastupdatedBy)
    {
        boolean flag = false;
        try {

                String sql = "insert into m_casetype (case_type,description,lastupdated_by)"
                + " values(?,?,?)";	
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setString(1, caseType);
                stmt.setString(2, description);
                stmt.setInt(3, lastupdatedBy);

                if(stmt.executeUpdate()==1){
                        flag = true;
                } 
        }catch(Exception e) {
                e.printStackTrace();
        }
        return flag;
    }
    
     public static CaseType editCaseType(int caseTypeId,String strCaseType, String description,int lastupdatedBy)
     {
         CaseType caseType = null;
          try {
              
                String sql = "update m_casetype set case_type=?,description=?,lastupdated_by=? where casetype_id="+caseTypeId;
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setString(1, strCaseType);
                stmt.setString(2, description);
                stmt.setInt(3, lastupdatedBy);
                
                if(stmt.executeUpdate()==1)
                {
                        caseType = CaseTypeDAO.getCaseTypeById(caseTypeId);
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return caseType;
     }
     
    public static CaseType deleteCaseType(String caseTypeId)
    {
        CaseType caseType = null;
        try{
            String sql = "delete from  m_casetype where casetype_id="+caseTypeId;
            PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
            if(stmt.executeUpdate()==1)
            {
                caseType = CaseTypeDAO.getCaseTypeById(Integer.parseInt(caseTypeId));
            }
            }catch(Exception e){
                    e.printStackTrace();
            }
            return caseType;
    }
    
    public static CaseType getCaseTypeById(int caseTypeId)
    {
        CaseType caseType = null;
        try {
                String sql = "select * from m_casetype where casetype_id=?";
                PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                stmt.setInt(1, caseTypeId);
                ResultSet rs = stmt.executeQuery();
                if(rs.next()) 
                {
                    caseType = new CaseType();
                    caseType.setCaseTypeId(rs.getInt("casetype_id"));
                    caseType.setCaseType(rs.getString("case_type"));
                    caseType.setDescription(rs.getString("description"));
                    caseType.setLastUpdatedBy(rs.getString("lastupdated_by"));
                    caseType.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    return caseType;
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return caseType;
    }
    
    public static List<CaseType> getCaseType()
    {
         List<CaseType> caseTypeList = new ArrayList<>();
         try {
                String sql = "select * from m_casetype";
                Connection db = MySqlConnection.getConnection();
                ResultSet rs = db.createStatement().executeQuery(sql);
                while(rs.next())
                {
                    CaseType caseType = new CaseType();
                    caseType.setCaseTypeId(rs.getInt("casetype_id"));
                    caseType.setCaseType(rs.getString("case_type"));
                    caseType.setDescription(rs.getString("description"));
                    caseType.setLastUpdatedBy(rs.getString("lastupdated_by"));
                    caseType.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));

                    caseTypeList.add(caseType);
                }
        } catch(Exception e) {
                e.printStackTrace();
        }
        return caseTypeList;
    }
    
     public static boolean caseTypeAlreadyExist(String caseType){
		boolean flag = false;
		try{
			String sql = "select * from m_casetype where case_type=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, caseType);
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
