package util;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class MySqlConnection {

	private static Connection connection;
	
	public static Connection getConnection() {
		try {
//			Properties prop = new Properties();
//                        System.out.println("test");
//                        prop.load(new FileInputStream(System.getProperty("user.home") + "/mydb.cfg"));
//                        System.out.println("user.home: "+System.getProperty("user.home"));
//                        String host = prop.getProperty("host").toString();
//                        String username = prop.getProperty("username").toString();
//                        String password = prop.getProperty("password").toString();
//                        String driver = prop.getProperty("driver").toString();
                        
                        //System.out.println(host);
                        Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/case_management_system", "root", "");
                        //connection = DriverManager.getConnection("jdbc:mysql://mysql19776-case-management-system.njs.jelastic.vps-host.net/casemgmt", "root", "casemgmt");
                        //Class.forName(driver);
                        //connection = DriverManager.getConnection(host, username, password);
                        //System.out.println("CONNECTION: " + connection);
                        
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
