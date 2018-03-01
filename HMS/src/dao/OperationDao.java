package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.regexp.internal.recompile;

import bean.Opetation;

public class OperationDao {

	public static double getFeeByType(String type) {
		Connection connection=dbConnector.DbConnector.getConnection();
		double fee=0;
		try {
			String sql="select operation_fee from operation_type where operation_type='"+type+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				fee=rSet.getDouble("operation_fee");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fee;
	}
	
	public static List<Opetation> getRecords(int start, int total) {
		List< Opetation> list=new ArrayList<Opetation>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from operation limit "+(start-1)+","+total;
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rs=pStatement.executeQuery();
			while (rs.next()) {
				Opetation opetation=new Opetation();
				opetation.setId(rs.getInt("id"));
				opetation.setOpType(rs.getString("operation_type"));
				opetation.setDoctorName(rs.getString("doctor_name"));
				opetation.setPatientName(rs.getString("patient_name"));
				opetation.setOpType(rs.getString("operation_type"));
				opetation.setOpFee(rs.getDouble("operation_fee"));
				opetation.setDate(rs.getString("date"));
				opetation.setDescription(rs.getString("description"));
				list.add(opetation);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Opetation> getRecords(String patientName) {
		List< Opetation> list=new ArrayList<Opetation>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from operation where patient_name='"+patientName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rs=pStatement.executeQuery();
			while (rs.next()) {
				Opetation opetation=new Opetation();
				opetation.setId(rs.getInt("id"));
				opetation.setOpType(rs.getString("operation_type"));
				opetation.setDoctorName(rs.getString("doctor_name"));
				opetation.setPatientName(rs.getString("patient_name"));
				opetation.setOpType(rs.getString("operation_type"));
				opetation.setOpFee(rs.getDouble("operation_fee"));
				opetation.setDate(rs.getString("date"));
				opetation.setDescription(rs.getString("description"));
				list.add(opetation);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
//	public static void main(String[] args) {
//		System.out.println(getFeeByType("Bariatric Surgery"));
//	}
}
