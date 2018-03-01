package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.org.apache.regexp.internal.recompile;

import bean.AddPatient;

public class PateintDao {
	
	static Connection connection=dbConnector.DbConnector.getConnection();
	
	public static List<AddPatient> getPatientRecord(int start,int total) {
		List<AddPatient> list=new ArrayList<AddPatient>();
		ResultSet resultSet=null;
		try {
			String sql="select * from patient limit "+(start-1)+","+total;
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				AddPatient addPatient=new AddPatient();
				addPatient.setId(resultSet.getInt("p_id"));
				addPatient.setPatientName(resultSet.getString("p_name"));
				addPatient.setPatientEmail(resultSet.getString("p_email"));
				addPatient.setPatientPass(resultSet.getString("p_password"));
				addPatient.setPatientAddr(resultSet.getString("p_address"));
				addPatient.setPatientPhone(resultSet.getString("p_phone"));
				addPatient.setGender(resultSet.getString("p_gender"));
				addPatient.setBirthDay(resultSet.getString("p_birthday"));
				addPatient.setAge(resultSet.getString("p_age"));
				addPatient.setBloodGroup(resultSet.getString("p_bloodgroup"));
				list.add(addPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<AddPatient> getRecordsById(int id) {
		List<AddPatient> list=new ArrayList<AddPatient>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select p_name, p_email, p_address, p_phone from patient where p_id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()){
				AddPatient aPatient=new AddPatient();
				aPatient.setPatientName(rSet.getString("p_name"));
				aPatient.setPatientEmail(rSet.getString("p_email"));
				aPatient.setPatientAddr(rSet.getString("p_address"));
				aPatient.setPatientPhone(rSet.getString("p_phone"));
				list.add(aPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<AddPatient> getPatientName(){
		List<AddPatient> list=new ArrayList<AddPatient>();
		try {
			String sql="select p_name from patient";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()){
				AddPatient addPatient=new AddPatient();
				addPatient.setPatientName(resultSet.getString("p_name"));
				list.add(addPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<AddPatient> getPatient(String patientName){
		List<AddPatient> list=new ArrayList<AddPatient>();
		try {
			String sql="select p_address, p_age from patient where p_name='"+patientName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()){
				AddPatient addPatient=new AddPatient();
				addPatient.setPatientAddr(resultSet.getString("p_address"));
				addPatient.setAge(resultSet.getString("p_age"));
				list.add(addPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static int getIdByName(String patientName) {
		Connection connection=dbConnector.DbConnector.getConnection();
		int id=0;
		try {
			String sql="select p_id from patient where p_name='"+patientName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()){
				id=rSet.getInt("p_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
//	public static void main(String[] args) {
//		List<AddPatient> list=getRecordsById(6);
//		for(AddPatient ap:list) {
//			System.out.println(ap.getPatientName());
//			System.out.println(ap.getPatientEmail());
//			System.out.println(ap.getPatientAddr());
//			System.out.println(ap.getPatientPhone());
//			
//		}
//	}
	
}
