package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Report;

public class ReportDao {
	
	
	public static List<Report> getRecordByType(String type) {
		List<Report> list=new ArrayList<Report>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select id, description, date, doctor, patient from report where type='"+type+"'";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet rSet=preparedStatement.executeQuery();
			while(rSet.next()) {
				Report report=new Report();
				report.setId(rSet.getInt("id"));
				report.setDescription(rSet.getString("description"));
				report.setDate(rSet.getString("date"));
				report.setDoctorName(rSet.getString("doctor"));
				report.setPatientName(rSet.getString("patient"));
				list.add(report);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
