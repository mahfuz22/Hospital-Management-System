package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.regexp.internal.recompile;

import bean.*;

public class PrescriptionDao {
	//connecting to database...
	/**/
	static Connection connection=dbConnector.DbConnector.getConnection();
	
	public static List<Prescription> getRecords(int start, int total) {
		List<Prescription> list=new ArrayList<Prescription>();
		try {
			String sql="select * from prescription limit "+(start-1)+","+total;
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet rSet=preparedStatement.executeQuery();
			while(rSet.next()){
				Prescription prescription=new Prescription();
				prescription.setId(rSet.getInt("id"));
				prescription.setDoctorName(rSet.getString("doctor_name"));
				prescription.setPatientName(rSet.getString("patient_name"));
				prescription.setCaseHistory(rSet.getString("case_history"));
				prescription.setMedication(rSet.getString("medication"));
				prescription.setMediPherma(rSet.getString("medi_phermacist"));
				prescription.setDescription(rSet.getString("description"));
				prescription.setDate(rSet.getString("date"));
				list.add(prescription);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Prescription> getRecords(int id) {
		List<Prescription> list=new ArrayList<Prescription>();
		try {
			String sql="select * from prescription where id='"+id+"'";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet rSet=preparedStatement.executeQuery();
			while(rSet.next()){
				Prescription prescription=new Prescription();
				prescription.setId(rSet.getInt("id"));
				prescription.setDoctorName(rSet.getString("doctor_name"));
				prescription.setPatientName(rSet.getString("patient_name"));
				prescription.setCaseHistory(rSet.getString("case_history"));
				prescription.setMedication(rSet.getString("medication"));
				prescription.setMediPherma(rSet.getString("medi_phermacist"));
				prescription.setDescription(rSet.getString("description"));
				prescription.setDate(rSet.getString("date"));
				list.add(prescription);
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
			String sql="select id from prescription where patient_name='"+patientName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()){
				id=rSet.getInt("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public static List<Prescription> getAllName() {
		List<Prescription> list=new ArrayList<Prescription>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select patient_name from prescription";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet rSet=preparedStatement.executeQuery();
			while(rSet.next()) {
				Prescription prescription=new Prescription();
				prescription.setPatientName(rSet.getString("patient_name"));
				list.add(prescription);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
