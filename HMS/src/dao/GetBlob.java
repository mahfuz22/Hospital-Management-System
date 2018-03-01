package dao;

import java.io.*;
import java.sql.*;

class GetBlob {
	FileOutputStream image;
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet res = null;
	StringBuffer query = null;
	String filename = "C:\\rose.jpg";
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost/";
	String dbName = "hospital";
	String userName = "root";
	String password = "";

	public GetBlob() {
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url + dbName, userName, password);
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from admin where admin_id='1'");
			if (rs.next()) {
				Blob test = rs.getBlob("photo");
				InputStream x = test.getBinaryStream();
				int size = x.available();
				OutputStream out = new FileOutputStream("adminProfile.jpg");
				byte b[] = new byte[size];
				x.read(b);
				out.write(b);
			}
		} catch (Exception e) {
			System.out.println("Exception :" + e);
		} finally {
			try {
				stmt.close();
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public static void main(String args[]) throws IOException {
		GetBlob blob = new GetBlob();
	}
}