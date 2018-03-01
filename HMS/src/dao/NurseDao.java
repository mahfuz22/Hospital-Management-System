package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.AddNurse;

public class NurseDao {
	
	public static List<AddNurse> getRecordByEmail(String mail) {
		List<AddNurse> list=new ArrayList<AddNurse>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select n_name, email, address, phone from nurse where email='"+mail+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()) {
				AddNurse aNurse=new AddNurse();
				aNurse.setNurseName(resultSet.getString("n_name"));
				aNurse.setNurseEmail(resultSet.getString("email"));
				aNurse.setNurseAddress(resultSet.getString("address"));
				aNurse.setNursePhone(resultSet.getString("phone"));
				list.add(aNurse);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
