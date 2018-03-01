package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.TestPatient;

public class TestPatientDao {

	public static List<TestPatient> getRecords() {
		List<TestPatient> list=new ArrayList<TestPatient>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from test";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				TestPatient tPatient=new TestPatient();
				tPatient.setId(rSet.getInt("id"));
				tPatient.setPresId(rSet.getInt("pres_id"));
				tPatient.setPatientName(rSet.getString("patient_name"));
				tPatient.setTestType(rSet.getString("test_type"));
				tPatient.setLabFee(rSet.getDouble("lab_fee"));
				tPatient.setDate(rSet.getString("date"));
				list.add(tPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<TestPatient> getRecordsById(int id) {
		List<TestPatient> list=new ArrayList<TestPatient>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from test where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				TestPatient tPatient=new TestPatient();
				tPatient.setId(rSet.getInt("id"));
				tPatient.setPresId(rSet.getInt("pres_id"));
				tPatient.setPatientName(rSet.getString("patient_name"));
				tPatient.setTestType(rSet.getString("test_type"));
				tPatient.setLabFee(rSet.getDouble("lab_fee"));
				tPatient.setDate(rSet.getString("date"));
				list.add(tPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<TestPatient> getRecordsByPName(String patientName) {
		List<TestPatient> list=new ArrayList<TestPatient>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from test where patient_name='"+patientName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				TestPatient tPatient=new TestPatient();
				tPatient.setId(rSet.getInt("id"));
				tPatient.setPresId(rSet.getInt("pres_id"));
				tPatient.setPatientName(rSet.getString("patient_name"));
				tPatient.setTestType(rSet.getString("test_type"));
				tPatient.setLabFee(rSet.getDouble("lab_fee"));
				tPatient.setDate(rSet.getString("date"));
				list.add(tPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
