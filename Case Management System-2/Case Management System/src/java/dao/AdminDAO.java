package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Admin;
import util.MySqlConnection;

public class AdminDAO {

    public static boolean saveAdmin(String firstName, String lastName, String companyId, String dob, String address, String street, String city,
      String state, String zipcode, String secQue, String secqueAnswer, String contactno, String emailId, String primaryPassword,String secondaryPassword)
        {
            boolean flag = false;
		try {
                    
                    String status = "Active";
                    String lastUpdatedBy="Admin";
                    
			String sql = "insert into m_admin"
                        + "(admin_first_name, admin_last_name, admin_company_id,admin_dateofbirth, admin_address,admin_street,admin_city,admin_state,admin_postal_code,"
                        + "admin_sec_que,admin_secque_answer,admin_contact_no,admin_email_id,admin_password,admin_secondary_password,admin_status,lastupdated_by)"
			+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setString(3, companyId);
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
                        stmt.setString(14, primaryPassword);
                        stmt.setString(15, secondaryPassword);
                        stmt.setString(16, status);
                        stmt.setString(17, lastUpdatedBy);
                        
			if(stmt.executeUpdate()==1){
				flag = true;
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
        public static Admin adminLoginCheck(String emailId, String priPassword,String SecPassword) {
		Admin admin = null;
                try 
                {
			String sql = "select * from m_admin where admin_email_id=? and admin_password=? and admin_secondary_password=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, emailId);
			stmt.setString(2, priPassword);
                        stmt.setString(3, SecPassword);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) 
                        {
				admin = new Admin();
                                admin.setAdminId(rs.getInt("admin_id"));
                                admin.setFirstName(rs.getString("admin_first_name"));
                                admin.setLastName(rs.getString("admin_last_name"));
                                admin.setCompanyId(rs.getString("admin_company_id"));
                                admin.setDob(rs.getDate("admin_dateofbirth"));
                                admin.setAddress(rs.getString("admin_address"));
                                admin.setStreet(rs.getString("admin_street"));
                                admin.setCity(rs.getString("admin_city"));
                                admin.setState(rs.getString("admin_state"));
                                admin.setPostalCode(rs.getInt("admin_postal_code"));
                                admin.setSecQue(rs.getString("admin_sec_que"));
                                admin.setSecQueAnswer(rs.getString("admin_secque_answer"));
                                admin.setContactNo(rs.getString("admin_contact_no"));
                                admin.setEmailId(rs.getString("admin_email_id"));
                                admin.setPassword(rs.getString("admin_password"));
                                admin.setSecondaryPassword(rs.getString("admin_secondary_password"));
				
				return admin;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return admin;
	}
        
        public static Admin adminUpdateProfile(int adminId,String firstName,String lastName,String companyId,String address,String street,
                            String city,String state,String zipcode,String contactno)
        {
            Admin admin = null;
		try
                {
                        String status = "Updated";
			String sql = "update m_admin set admin_first_name=?,admin_last_name=?,admin_company_id=?,admin_address=?,"
                                + "admin_street=?,admin_city=?,admin_state=?,admin_postal_code=?,admin_contact_no=?,admin_status=?"
                                + " where admin_id="+adminId;
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, firstName);
                        stmt.setString(2, lastName);
                        stmt.setString(3, companyId);
                        stmt.setString(4, address);
                        stmt.setString(5, street);
                        stmt.setString(6, city);
                        stmt.setString(7, state);
                        stmt.setString(8, zipcode);
                        stmt.setString(9, contactno);
                        stmt.setString(10, status);
                        
                      
			if(stmt.executeUpdate()==1)
                        {
				admin = AdminDAO.getAdminById(adminId);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return admin;
        }
        
        public static Admin adminEditProfile(int adminId,String firstName,String lastName,String companyId,String address,String street,
                            String city,String state,String zipcode,String contactno)
        {
            Admin admin = null;
		try
                {
                        String status = "Updated";
			String sql = "update m_admin set admin_first_name=?,admin_last_name=?,admin_company_id=?,admin_address=?,"
                                + "admin_street=?,admin_city=?,admin_state=?,admin_postal_code=?,admin_contact_no=?,admin_status=?"
                                + " where admin_id="+adminId;
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, firstName);
                        stmt.setString(2, lastName);
                        stmt.setString(3, companyId);
                        stmt.setString(4, address);
                        stmt.setString(5, street);
                        stmt.setString(6, city);
                        stmt.setString(7, state);
                        stmt.setString(8, zipcode);
                        stmt.setString(9, contactno);
                        stmt.setString(10, status);
                       
			if(stmt.executeUpdate()==1)
                        {
				admin = AdminDAO.getAdminById(adminId);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return admin;
        }
        
        public static boolean forgotPassword(int adminId,String newPwd)
        {
            boolean flag = false;
		try{
			String sql = "update m_admin set admin_password=? where admin_id="+adminId;
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
        
        public static boolean changePassword(int adminId,String newPwd)
        {
            boolean flag = false;
		try{
			String sql = "update m_admin set admin_password=? where admin_id="+adminId;
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
			String sql = "select * from m_admin where admin_email_id=?";
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
        
        public static Admin getAdminByMailId(String emailId) {
		Admin admin = null;
		try {
			String sql = "select * from m_admin where admin_email_id=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, emailId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) 
                        {
				admin = new Admin();
                                admin.setAdminId(rs.getInt("admin_id"));
                                admin.setFirstName(rs.getString("admin_first_name"));
                                admin.setLastName(rs.getString("admin_last_name"));
                                admin.setCompanyId(rs.getString("admin_company_id"));
                                admin.setDob(rs.getDate("admin_dateofbirth"));
                                admin.setAddress(rs.getString("admin_address"));
                                admin.setStreet(rs.getString("admin_street"));
                                admin.setCity(rs.getString("admin_city"));
                                admin.setState(rs.getString("admin_state"));
                                admin.setPostalCode(rs.getInt("admin_postal_code"));
                                admin.setSecQue(rs.getString("admin_sec_que"));
                                admin.setSecQueAnswer(rs.getString("admin_secque_answer"));
                                admin.setContactNo(rs.getString("admin_contact_no"));
                                admin.setEmailId(rs.getString("admin_email_id"));
                                admin.setPassword(rs.getString("admin_password"));
				
				return admin;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return admin;
	}
        
        public static Admin getAdminById(int adminId)
        {
            Admin admin = null;
		try {
			String sql = "select * from m_admin where admin_id=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setInt(1, adminId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) 
                        {
				admin = new Admin();
                                admin.setAdminId(rs.getInt("admin_id"));
                                admin.setFirstName(rs.getString("admin_first_name"));
                                admin.setLastName(rs.getString("admin_last_name"));
                                admin.setCompanyId(rs.getString("admin_company_id"));
                                admin.setDob(rs.getDate("admin_dateofbirth"));
                                admin.setAddress(rs.getString("admin_address"));
                                admin.setStreet(rs.getString("admin_street"));
                                admin.setCity(rs.getString("admin_city"));
                                admin.setState(rs.getString("admin_state"));
                                admin.setPostalCode(rs.getInt("admin_postal_code"));
                                admin.setSecQue(rs.getString("admin_sec_que"));
                                admin.setSecQueAnswer(rs.getString("admin_secque_answer"));
                                admin.setContactNo(rs.getString("admin_contact_no"));
                                admin.setEmailId(rs.getString("admin_email_id"));
                                admin.setPassword(rs.getString("admin_password"));
				
				return admin;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return admin;
        }
        
        public static Admin deleteAdmin(String adminId)
        {
            Admin admin = null;
            try{
			String sql = "delete from  m_admin where admin_id="+adminId;
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			if(stmt.executeUpdate()==1){
				admin = AdminDAO.getAdminById(Integer.parseInt(adminId));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return admin;
        }
	
        
        public static String checkEmailAddress(String emailId)
        {
		String getEmail = "";
		try{
			String sql = "select * from m_admin where admin_email_id=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
                        stmt.setString(1, emailId);
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
                        {
                            getEmail = rs.getString("admin_email_id");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return getEmail;
	}
        
	public static List<Admin> getAdminList()
        {
            List<Admin> adminList = new ArrayList<>();
            try
            {
                String query = "select * from m_admin";
                Connection db = MySqlConnection.getConnection();
                ResultSet rs = db.createStatement().executeQuery(query);
                while(rs.next())
                {
                    Admin admin=new Admin();
                    
                    admin.setAdminId(rs.getInt("admin_id"));
                    admin.setFirstName(rs.getString("admin_first_name"));
                    admin.setLastName(rs.getString("admin_last_name"));
                    admin.setCompanyId(rs.getString("admin_company_id"));
                    admin.setDob(rs.getDate("admin_dateofbirth"));
                    admin.setAddress(rs.getString("admin_address"));
                    admin.setStreet(rs.getString("admin_street"));
                    admin.setCity(rs.getString("admin_city"));
                    admin.setState(rs.getString("admin_state"));
                    admin.setPostalCode(rs.getInt("admin_postal_code"));
                    admin.setSecQue(rs.getString("admin_sec_que"));
                    admin.setSecQueAnswer(rs.getString("admin_secque_answer"));
                    admin.setContactNo(rs.getString("admin_contact_no"));
                    admin.setEmailId(rs.getString("admin_email_id"));
                    admin.setPassword(rs.getString("admin_password"));
                    admin.setStatus(rs.getString("admin_status"));
                    admin.setLastUpdateBy(rs.getString("lastupdated_by"));
                    admin.setLastUpdatedDateTime(rs.getDate("lastupdate_datetime"));
                    
                    adminList.add(admin);
                }
            }
            catch(Exception e){
                    e.printStackTrace();
            }

            return adminList;	
	}
}

