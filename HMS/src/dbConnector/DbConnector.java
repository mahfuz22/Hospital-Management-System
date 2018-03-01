package dbConnector;

import java.sql.*;

public class DbConnector {
	
	public static Connection getConnection() {
		Connection connection=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost/hospital","root","");
			return connection;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		finally{
			if (connection==null) {
				System.out.println("connection failed !!!");
			}
			else{
				System.out.println("connection success !!!");
			}
				
		}
	}

	public static void main(String[] args) {
		getConnection();

	}

}
