package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Labrotorist;

public class LabrotoristDao {

	public static List<Labrotorist> getRecordsByMail(String Email) {
		List<Labrotorist> list=new ArrayList<Labrotorist>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select name, email, address, phone from labrotorist where email='"+Email+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Labrotorist labrotorist=new Labrotorist();
				labrotorist.setName(rSet.getString("name"));
				labrotorist.setEmail(rSet.getString("email"));
				labrotorist.setAddress(rSet.getString("address"));
				labrotorist.setPhone(rSet.getString("phone"));
				list.add(labrotorist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
