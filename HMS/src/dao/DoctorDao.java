package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import bean.AddDoctor;

public class DoctorDao {
	//connecting to the database
	static Connection connection=dbConnector.DbConnector.getConnection();
	
	//this method return the all doctor information
	public static List<AddDoctor> getrecords() {
		List<AddDoctor> list=new ArrayList<AddDoctor>();
		
		try {
			String sql="select * from doctor";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()){
				AddDoctor addDoctor=new AddDoctor();
				addDoctor.setId(rs.getInt("d_id"));
				addDoctor.setDoctorName(rs.getString("d_name"));
				addDoctor.setDoctorEmail(rs.getString("email"));
				addDoctor.setGender(rs.getString("gender"));
				addDoctor.setPassword(rs.getString("password"));
				addDoctor.setAddress(rs.getString("phone"));
				addDoctor.setDepartment(rs.getNString("department"));
				addDoctor.setDegree(rs.getString("d_degree"));
				list.add(addDoctor);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static List<AddDoctor> getRecordsById(String doctorEmail){
		List<AddDoctor> list=new ArrayList<AddDoctor>();
		try {
			String sql="select d_name, email, address, phone from doctor where email='"+doctorEmail+"'";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				AddDoctor addDoctor=new AddDoctor();
				addDoctor.setDoctorName(resultSet.getString("d_name"));
				addDoctor.setDoctorEmail(resultSet.getString("email"));
				addDoctor.setAddress(resultSet.getString("address"));
				addDoctor.setPhone(resultSet.getString("phone"));
				list.add(addDoctor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//this method return the name of the doctor
	public static List<AddDoctor> getDoctorName(){
		List<AddDoctor> list=new ArrayList<AddDoctor>();
		try {
			String sql="select d_name from doctor";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				AddDoctor addDoctor=new AddDoctor();
				addDoctor.setDoctorName(resultSet.getString("d_name"));
				list.add(addDoctor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<AddDoctor> getDoctorName(String doctorEmail){
		List<AddDoctor> list=new ArrayList<AddDoctor>();
		try {
			String sql="select d_name from doctor where email='"+doctorEmail+"'";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				AddDoctor addDoctor=new AddDoctor();
				addDoctor.setDoctorName(resultSet.getString("d_name"));
				list.add(addDoctor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<AddDoctor> getDeptByName(String doctorName) {
		List<AddDoctor> list=new ArrayList<AddDoctor>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select department from doctor where d_name='"+doctorName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				AddDoctor addDoctor=new AddDoctor();
				addDoctor.setDepartment(rSet.getString("department"));
				list.add(addDoctor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static double getTreatmentFeeByName(String doctorName) {
		Connection connection=dbConnector.DbConnector.getConnection();
		double fee=0;
		try {
			String sql="select treatment_fee from doctor where d_name='"+doctorName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				fee=rSet.getDouble("treatment_fee");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fee;
	}
	
	
}
