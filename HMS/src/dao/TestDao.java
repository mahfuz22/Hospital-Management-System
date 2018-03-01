package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.crypto.provider.RSACipher;

import bean.MedicineCategory;
import bean.Test;

public class TestDao {
	
	public static List<Test> getRecords() {
		List<Test> list=new ArrayList<Test>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from test_type";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Test test=new Test();
				test.setId(rSet.getInt("id"));
				test.setTestType(rSet.getString("type"));
				test.setTestFee(rSet.getDouble("test_fee"));
				test.setDescription(rSet.getString("description"));
				list.add(test);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Test> getRecordsById(int id) {
		List<Test> list=new ArrayList<Test>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from test_type where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Test test=new Test();
				test.setTestType(rSet.getString("type"));
				test.setTestFee(rSet.getDouble("test_fee"));
				test.setDescription(rSet.getString("description"));
				list.add(test);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Test> getType() {
		List<Test> list=new ArrayList<Test>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select type from test_type";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet result=pStatement.executeQuery();
			while(result.next()) {
				Test test=new Test();
				test.setTestType(result.getString("type"));;
				list.add(test);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static double getPriceByType(String type) {
		Connection connection=dbConnector.DbConnector.getConnection();
		double price=0;
		try {
			String sql="select test_fee from test_type where type='"+type+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet result=pStatement.executeQuery();
			while(result.next()) {
				price=result.getDouble("test_fee");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return price;
	}
	
	
}