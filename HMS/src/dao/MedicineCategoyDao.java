package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.MedicineCategory;

public class MedicineCategoyDao {

	public static List<MedicineCategory> getRecords(int start, int total) {
		List<MedicineCategory> list=new ArrayList<MedicineCategory>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from medicine_category limit "+(start-1)+","+total;
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet result=pStatement.executeQuery();
			while(result.next()) {
				MedicineCategory mCategory=new MedicineCategory();
				mCategory.setId(result.getInt("id"));
				mCategory.setCategoryName(result.getString("category_name"));
				mCategory.setDescription(result.getString("description"));
				list.add(mCategory);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<MedicineCategory> getRecordsById(int id) {
		List<MedicineCategory> list=new ArrayList<MedicineCategory>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select category_name, description from medicine_category where id='"+id+"' ";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet result=pStatement.executeQuery();
			while(result.next()) {
				MedicineCategory mCategory=new MedicineCategory();
				mCategory.setCategoryName(result.getString("category_name"));
				mCategory.setDescription(result.getString("description"));
				list.add(mCategory);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<MedicineCategory> getCatagory() {
		List<MedicineCategory> list=new ArrayList<MedicineCategory>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select category_name from medicine_category";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet result=pStatement.executeQuery();
			while(result.next()) {
				MedicineCategory mCategory=new MedicineCategory();
				mCategory.setCategoryName(result.getString("category_name"));
				list.add(mCategory);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
