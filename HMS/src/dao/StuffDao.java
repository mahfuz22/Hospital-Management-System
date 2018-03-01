package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.AddStuff;

public class StuffDao {
	
	public static List<AddStuff> getRecords() {
		List<AddStuff> list=new ArrayList<AddStuff>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select st_name, email, address, phone from stuff";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				AddStuff aStuff=new AddStuff();
				aStuff.setStuffName(rSet.getString("st_name"));
				aStuff.setStuffEmail(rSet.getString("email"));
				aStuff.setStuffAddress(rSet.getString("address"));
				aStuff.setStuffPhone(rSet.getString("phone"));
				list.add(aStuff);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
