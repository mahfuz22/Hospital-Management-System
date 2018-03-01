package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Medicine;

public class MedicineDao {
	
	public static List<Medicine> getRecords(int start,int total) {
		List<Medicine> list=new ArrayList<Medicine>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from medicine limit "+(start-1)+","+total;
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Medicine medicine=new Medicine();
				medicine.setId(rSet.getInt("id"));
				medicine.setMedicineName(rSet.getString("medicine_name"));
				medicine.setCategory(rSet.getString("category"));
				medicine.setDescription(rSet.getString("description"));
				medicine.setPrice(rSet.getDouble("price"));
				medicine.setCompanyName(rSet.getString("company"));
				medicine.setStatus(rSet.getDouble("status"));
				list.add(medicine);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static List<Medicine> getRecordById(int id) {
		List<Medicine> list=new ArrayList<Medicine>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from medicine where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Medicine medicine=new Medicine();
				medicine.setId(rSet.getInt("id"));
				medicine.setMedicineName(rSet.getString("medicine_name"));
				medicine.setCategory(rSet.getString("category"));
				medicine.setDescription(rSet.getString("description"));
				medicine.setPrice(rSet.getDouble("price"));
				medicine.setCompanyName(rSet.getString("company"));
				medicine.setStatus(rSet.getDouble("status"));
				list.add(medicine);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Medicine> getRecordByPName(String patientName) {
		List<Medicine> list=new ArrayList<Medicine>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from medicine where patient_name='"+patientName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Medicine medicine=new Medicine();
				medicine.setId(rSet.getInt("id"));
				medicine.setMedicineName(rSet.getString("medicine_name"));
				medicine.setCategory(rSet.getString("category"));
				medicine.setDescription(rSet.getString("description"));
				medicine.setPrice(rSet.getDouble("price"));
				medicine.setCompanyName(rSet.getString("company"));
				medicine.setStatus(rSet.getDouble("status"));
				list.add(medicine);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static double getStatusByName(String name) {
		Connection connection=dbConnector.DbConnector.getConnection();
		double status=0;
		try {
			String sql="select status from medicine where medicine_name='"+name+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				status=rSet.getDouble("status");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static double getPriceByName(String name) {
		Connection connection=dbConnector.DbConnector.getConnection();
		double price=0;
		try {
			String sql="select price from medicine where medicine_name='"+name+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				price=rSet.getDouble("price");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return price;
	}
	
	public static List<Medicine> getMedicintName() {
		List<Medicine> list=new ArrayList<Medicine>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select medicine_name from medicine";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Medicine medicine=new Medicine();
				medicine.setMedicineName(rSet.getString("medicine_name"));
				list.add(medicine);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
