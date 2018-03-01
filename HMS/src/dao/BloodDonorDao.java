package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.http.fileupload.ParameterParser;

import bean.BloodDonor;

public class BloodDonorDao {
	
	public static List<BloodDonor> getBloodDonorRecords(int start,int total) {
		List<BloodDonor> list=new ArrayList<BloodDonor>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try{
			String sql="select id, name, phone, sex, age, blood_group, last_donation from blood_donor limit "+(start-1)+","+total;
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rs=pStatement.executeQuery();
			while(rs.next()) {
				BloodDonor bDonor=new BloodDonor();
				bDonor.setId(rs.getInt("id"));
				bDonor.setName(rs.getString("name"));
				bDonor.setPhoneNumber(rs.getInt("phone"));
				bDonor.setSex(rs.getString("sex"));
				bDonor.setAge(rs.getInt("age"));
				bDonor.setBloodGroup(rs.getString("blood_group"));
				bDonor.setLastDonationDate(rs.getString("last_donation"));
				list.add(bDonor);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<BloodDonor> getBloodDonorRecords() {
		List<BloodDonor> list=new ArrayList<BloodDonor>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try{
			String sql="select * from blood_donor";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rs=pStatement.executeQuery();
			while(rs.next()) {
				BloodDonor bDonor=new BloodDonor();
				bDonor.setId(rs.getInt("id"));
				bDonor.setName(rs.getString("name"));
				bDonor.setEmail(rs.getString("email"));
				bDonor.setAddress(rs.getString("address"));
				bDonor.setPhoneNumber(rs.getInt("phone"));
				bDonor.setSex(rs.getString("sex"));
				bDonor.setAge(rs.getInt("age"));
				bDonor.setBloodGroup(rs.getString("blood_group"));
				bDonor.setLastDonationDate(rs.getString("last_donation"));
				list.add(bDonor);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<BloodDonor> getDonorName() {
		List<BloodDonor> list=new ArrayList<BloodDonor>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select name from blood_donor";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				BloodDonor bDonor=new BloodDonor();
				bDonor.setName(rSet.getString("name"));
				list.add(bDonor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
