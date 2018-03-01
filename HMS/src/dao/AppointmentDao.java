package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.*;

public class AppointmentDao {
	public static List<Appointment> getRecords(int start,int total){
		List<Appointment> list=new ArrayList<Appointment>();
		try{
			Connection con=dbConnector.DbConnector.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from appointment limit "+(start-1)+","+total);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Appointment e=new Appointment();
				e.setId(rs.getInt("id"));
				e.setDoctorName(rs.getString("doctor_name"));
				e.setPatientName(rs.getString("patient_name"));
				e.setDate(rs.getString("date"));
				list.add(e);
			}
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static List<Appointment> getRecords(int start,int total,String doctorEmail){
		List<Appointment> list=new ArrayList<Appointment>();
		List<AddDoctor> dList=DoctorDao.getDoctorName(doctorEmail);
		String doctorName="";
		for(AddDoctor ad:dList) {
			doctorName=ad.getDoctorName();
		}
		try{
			Connection con=dbConnector.DbConnector.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from appointment where doctor_name='"+doctorName+"' limit "+(start-1)+","+total);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Appointment e=new Appointment();
				e.setId(rs.getInt("id"));
				e.setDoctorName(rs.getString("doctor_name"));
				e.setPatientName(rs.getString("patient_name"));
				e.setDate(rs.getString("date"));
				list.add(e);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}
	
	public static List<Appointment> getPatientNameById(int id){
		List<Appointment> list=new ArrayList<Appointment>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select patient_name from appointment where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()){
				Appointment addPatient=new Appointment();
				addPatient.setPatientName(resultSet.getString("patient_name"));
				list.add(addPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Appointment> getPatientNameByMail(String doctorName){
		List<Appointment> list=new ArrayList<Appointment>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select patient_name from appointment where doctor_name='"+doctorName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()){
				Appointment addPatient=new Appointment();
				addPatient.setPatientName(resultSet.getString("patient_name"));
				list.add(addPatient);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
