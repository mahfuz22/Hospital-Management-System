package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import bean.AddDoctor;

public class GetSingleDoctor {
	
	
	public static List<AddDoctor> getRecords(String doctorEmail) {
		List<AddDoctor> list=new ArrayList<AddDoctor>();
		//String email=doctorEmail.toString();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select d_id, d_name, gender, password, address, phone, department, d_degree from doctor where email='"+doctorEmail+"'";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
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
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
}
