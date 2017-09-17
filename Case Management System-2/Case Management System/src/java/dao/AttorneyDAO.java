package dao;

import Model.Attorney;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySqlConnection;

public class AttorneyDAO {
    
    public static boolean saveAttorney(String firstName, String lastName, String yoe, String dob, String address, String street, String city,
                        String state, String zipcode, String secQue, String secqueAnswer, String contactno, String emailId, String password)
        {
		try {
                    
                    String status = "Active";
                    String lastUpdatedBy="Attorney";
                    
			String sql = "insert into m_attorney"
                        + "(attorney_first_name, attorney_last_name, attorney_yoe,attorney_dateofbirth, attorney_address,attorney_street,"
                        + "attorney_city,attorney_state,attorney_postal_code,attorney_sec_que,attorney_secque_answer,attorney_contact_no,"
                        + "attorney_email_id,attorney_password,status,lastupdated_by)"
			+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setString(3, yoe);
			stmt.setString(4, dob);
			stmt.setString(5, address);
                        stmt.setString(6, street);
                        stmt.setString(7, city);
                        stmt.setString(8, state);
                        stmt.setString(9, zipcode);
                        stmt.setString(10, secQue);
                        stmt.setString(11, secqueAnswer.toLowerCase());
                        stmt.setString(12, contactno);
                        stmt.setString(13, emailId);
                        stmt.setString(14, password);
                        stmt.setString(15, status);
                        stmt.setString(16, lastUpdatedBy);
                        
			stmt.executeUpdate();  
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
        public static Attorney attorneyLoginCheck(String emailId, String password) 
        {
            Attorney attorney = null;
            
		try {
			String sql = "select * from m_attorney where attorney_email_id=? and attorney_password=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, emailId);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) 
                        {
                            attorney = new Attorney();
                            attorney.setAttorneyId(rs.getInt("attorney_id"));
                            attorney.setFirstName(rs.getString("attorney_first_name"));
                            attorney.setLastName(rs.getString("attorney_last_name"));
                            attorney.setYoe(rs.getString("attorney_yoe"));
                            attorney.setDob(rs.getDate("attorney_dateofbirth"));
                            attorney.setAddress(rs.getString("attorney_address"));
                            attorney.setStreet(rs.getString("attorney_street"));
                            attorney.setCity(rs.getString("attorney_city"));
                            attorney.setState(rs.getString("attorney_state"));
                            attorney.setPostalCode(rs.getInt("attorney_postal_code"));
                            attorney.setSecQue(rs.getString("attorney_sec_que"));
                            attorney.setSecQueAnswer(rs.getString("attorney_secque_answer"));
                            attorney.setContactNo(rs.getString("attorney_contact_no"));
                            attorney.setEmailId(rs.getString("attorney_email_id"));
                            attorney.setPassword(rs.getString("attorney_password"));
                            attorney.setStatus(rs.getString("status"));

                            return attorney;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return attorney;
	}
        
        public static Attorney getAttorneyByMailId(String emailId) {
		Attorney attorney = null;
		try {
			String sql = "select * from m_attorney where attorney_email_id=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, emailId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) 
                        {
                            attorney = new Attorney();
                            attorney.setAttorneyId(rs.getInt("attorney_id"));
                            attorney.setFirstName(rs.getString("attorney_first_name"));
                            attorney.setLastName(rs.getString("attorney_last_name"));
                            attorney.setYoe(rs.getString("attorney_yoe"));
                            attorney.setDob(rs.getDate("attorney_dateofbirth"));
                            attorney.setAddress(rs.getString("attorney_address"));
                            attorney.setStreet(rs.getString("attorney_street"));
                            attorney.setCity(rs.getString("attorney_city"));
                            attorney.setState(rs.getString("attorney_state"));
                            attorney.setPostalCode(rs.getInt("attorney_postal_code"));
                            attorney.setSecQue(rs.getString("attorney_sec_que"));
                            attorney.setSecQueAnswer(rs.getString("attorney_secque_answer"));
                            attorney.setContactNo(rs.getString("attorney_contact_no"));
                            attorney.setEmailId(rs.getString("attorney_email_id"));
                            attorney.setPassword(rs.getString("attorney_password"));
                            attorney.setStatus(rs.getString("status"));

                            return attorney;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return attorney;
	}
        
        public static Attorney getAttorneyById(int attorneyId) {
		Attorney attorney = null;
		try {
			String sql = "select * from m_attorney where attorney_id=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setInt(1, attorneyId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) 
                        {
                            attorney = new Attorney();
                            attorney.setAttorneyId(rs.getInt("attorney_id"));
                            attorney.setFirstName(rs.getString("attorney_first_name"));
                            attorney.setLastName(rs.getString("attorney_last_name"));
                            attorney.setYoe(rs.getString("attorney_yoe"));
                            attorney.setDob(rs.getDate("attorney_dateofbirth"));
                            attorney.setAddress(rs.getString("attorney_address"));
                            attorney.setStreet(rs.getString("attorney_street"));
                            attorney.setCity(rs.getString("attorney_city"));
                            attorney.setState(rs.getString("attorney_state"));
                            attorney.setPostalCode(rs.getInt("attorney_postal_code"));
                            attorney.setSecQue(rs.getString("attorney_sec_que"));
                            attorney.setSecQueAnswer(rs.getString("attorney_secque_answer"));
                            attorney.setContactNo(rs.getString("attorney_contact_no"));
                            attorney.setEmailId(rs.getString("attorney_email_id"));
                            attorney.setPassword(rs.getString("attorney_password"));
                            attorney.setStatus(rs.getString("status"));

                            return attorney;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return attorney;
	}
        
        public static Attorney attorneyUpdateProfile(int attorneyId,String firstName,String lastName,String yoe,String address,
                            String street,String city,String state,String zipcode,String contactno)
        {
            Attorney  attorney= null;
		try
                {
                        String status = "Updated";
			String sql = "update m_attorney set attorney_first_name=?,attorney_last_name=?,attorney_yoe=?,attorney_address=?,"
                                + "attorney_street=?,attorney_city=?,attorney_state=?,attorney_postal_code=?,attorney_contact_no=?,status=?"
                                + " where attorney_id="+attorneyId;
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, firstName);
                        stmt.setString(2, lastName);
                        stmt.setString(3, yoe);
                        stmt.setString(4, address);
                        stmt.setString(5, street);
                        stmt.setString(6, city);
                        stmt.setString(7, state);
                        stmt.setString(8, zipcode);
                        stmt.setString(9, contactno);
                        stmt.setString(10, status);
                        
                      
			if(stmt.executeUpdate()==1)
                        {
				attorney = AttorneyDAO.getAttorneyById(attorneyId);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return attorney;
        }
        
        public static Attorney attorneyEditProfile(int attorneyId,String firstName,String lastName,String yoe,String address,
                            String street,String city,String state,String zipcode,String contactno)
        {
            Attorney  attorney= null;
		try
                {
                        String status = "Updated";
			String sql = "update m_attorney set attorney_first_name=?,attorney_last_name=?,attorney_yoe=?,attorney_address=?,"
                                + "attorney_street=?,attorney_city=?,attorney_state=?,attorney_postal_code=?,attorney_contact_no=?,status=?"
                                + " where attorney_id="+attorneyId;
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, firstName);
                        stmt.setString(2, lastName);
                        stmt.setString(3, yoe);
                        stmt.setString(4, address);
                        stmt.setString(5, street);
                        stmt.setString(6, city);
                        stmt.setString(7, state);
                        stmt.setString(8, zipcode);
                        stmt.setString(9, contactno);
                        stmt.setString(10, status);
                        
			if(stmt.executeUpdate()==1)
                        {
				attorney = AttorneyDAO.getAttorneyById(attorneyId);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return attorney;
        }
        
        public static Attorney deleteAttorney(String attorneyId)
        {
            Attorney attorney = null;
            try{
			String sql = "delete from  m_attorney where attorney_id="+attorneyId;
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			if(stmt.executeUpdate()==1){
				attorney = AttorneyDAO.getAttorneyById(Integer.parseInt(attorneyId));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return attorney;
        }
        
        public static boolean forgotPassword(int attorneyId,String newPwd)
        {
            boolean flag = false;
		try{
			String sql = "update m_attorney set attorney_password=? where attorney_id="+attorneyId;
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, newPwd);
			
			if(stmt.executeUpdate()==1){
				flag = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
        }
        
        public static boolean changePassword(int attorneyId,String newPwd)
        {
            boolean flag = false;
		try{
			String sql = "update m_attorney set attorney_password=? where attorney_id="+attorneyId;
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, newPwd);
			
			if(stmt.executeUpdate()==1){
				flag = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
        }
        
        public static boolean checkEmailAddressAlreadyExist(String emailId){
		boolean flag = false;
		try{
			String sql = "select * from m_attorney where attorney_email_id=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, emailId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				flag = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
        
        public static List<Attorney> getAttorneyList()
        {
            List<Attorney> attorneyList = new ArrayList<>();
            try
            {
                String query = "select * from m_attorney";
                Connection db = MySqlConnection.getConnection();
                ResultSet rs = db.createStatement().executeQuery(query);
                while(rs.next())
                {
                    Attorney attorney=new Attorney();
                    
                    attorney.setAttorneyId(rs.getInt("attorney_id"));
                    attorney.setFirstName(rs.getString("attorney_first_name"));
                    attorney.setLastName(rs.getString("attorney_last_name"));
                    attorney.setYoe(rs.getString("attorney_yoe"));
                    attorney.setDob(rs.getDate("attorney_dateofbirth"));
                    attorney.setAddress(rs.getString("attorney_address"));
                    attorney.setStreet(rs.getString("attorney_street"));
                    attorney.setCity(rs.getString("attorney_city"));
                    attorney.setState(rs.getString("attorney_state"));
                    attorney.setPostalCode(rs.getInt("attorney_postal_code"));
                    attorney.setSecQue(rs.getString("attorney_sec_que"));
                    attorney.setSecQueAnswer(rs.getString("attorney_secque_answer"));
                    attorney.setContactNo(rs.getString("attorney_contact_no"));
                    attorney.setEmailId(rs.getString("attorney_email_id"));
                    attorney.setPassword(rs.getString("attorney_password"));
                    attorney.setStatus(rs.getString("status"));
                    attorney.setLastUpdateBy(rs.getString("lastupdated_by"));
                    attorney.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));
                    
                    attorneyList.add(attorney);
                }
            }
            catch(Exception e){
                    e.printStackTrace();
            }

            return attorneyList;
        }
}
