package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BloobBank {
	public static ResultSet getBloodBank() {
		String sql="select * from blood_bank";
		Connection connection=dbConnector.DbConnector.getConnection();
		try{
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			return rSet;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public static int getStatus(int id) {
		int status=0;
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select status from blood_bank where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			
			while(resultSet.next()) {
				status=resultSet.getInt("status");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
		
	}
	
	public static String getBloodGroup(int id) {
		String bloodGroup="";
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select blood_group from blood_bank where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			
			while(resultSet.next()) {
				bloodGroup=resultSet.getString("blood_group");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bloodGroup;
		
	}
	
	
//	public static void main(String[] args)  {
//		int i=getStatus(5);
//		System.out.println(i);
//	}
}
