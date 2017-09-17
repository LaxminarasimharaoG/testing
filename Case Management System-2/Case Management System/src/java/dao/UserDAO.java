package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.User;
import util.MySqlConnection;

public class UserDAO {

	public static boolean loginCheck(String mailId, String password) {
		try {
			String sql = "select * from m_user where mail_id=? and pass=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, mailId);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean saveUser(String firstName,String lastName, String mailId, String password, String tNo) {
		try {
			String sql = "insert into m_user(first_name,last_name, mail_id, pass, tel_no, active, deleted)"
					+ " values(?,?,?,?,?,?,?)";	
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, firstName);
                        stmt.setString(2, lastName);
			stmt.setString(3, mailId);
			stmt.setString(4, password);
			stmt.setString(5, tNo);
			stmt.setBoolean(6, true);
			stmt.setBoolean(7, false);
			stmt.executeUpdate();  
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public static User getUserByMailId(String mailId) {
		User user = null;
		try {
			String sql = "select * from m_user where mail_id=?";
			PreparedStatement stmt = MySqlConnection.getConnection().prepareStatement(sql);  
			stmt.setString(1, mailId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setActive(rs.getBoolean("active"));
				user.setDeleted(rs.getBoolean("deleted"));
				user.setMailId(rs.getString("mail_id"));
				user.setFirstName(rs.getString("first_name"));
                                user.setLastName(rs.getString("last_name"));
				user.setTelNo(rs.getString("tel_no"));
				user.setPassword(rs.getString("pass"));
				return user;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
