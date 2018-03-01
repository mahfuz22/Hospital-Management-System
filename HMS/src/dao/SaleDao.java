package dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import bean.Sale;

public class SaleDao {
	
	public static List<Sale> getRecords() {
		List<Sale> list=new ArrayList<Sale>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from medicine_sale";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Sale sale=new Sale();
				sale.setId(rSet.getInt("id"));
				sale.setPres_id(rSet.getInt("pres_id"));
				sale.setPatientName(rSet.getString("patient_name"));
				sale.setPrice(rSet.getDouble("price"));
				sale.setDate(rSet.getString("date"));
				list.add(sale);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Sale> getRecordsById(int id) {
		List<Sale> list=new ArrayList<Sale>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select patient_name, price from medicine_sale where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Sale sale=new Sale();
				sale.setPatientName(rSet.getString("patient_name"));
				sale.setPrice(rSet.getDouble("price"));
				list.add(sale);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Sale> getRecordsById(String pateitnName) {
		List<Sale> list=new ArrayList<Sale>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from medicine_sale where patient_name='"+pateitnName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Sale sale=new Sale();
				sale.setId(rSet.getInt("id"));
				sale.setPres_id(rSet.getInt("pres_id"));
				sale.setPatientName(rSet.getString("patient_name"));
				sale.setPrice(rSet.getDouble("price"));
				sale.setDate(rSet.getString("date"));
				list.add(sale);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
