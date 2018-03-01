package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Invoice;

public class InvoiceDao {

	public static List<Invoice> getRecords(int start, int total) {
		List<Invoice> list=new ArrayList<Invoice>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from invoice limit "+(start-1)+","+total;
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Invoice invoice=new Invoice();
				invoice.setId(rSet.getInt("id"));
				invoice.setTitle(rSet.getString("title"));
				invoice.setAmount(rSet.getDouble("amount"));
				invoice.setPatientName(rSet.getString("patient_name"));
				invoice.setPresId(rSet.getInt("pres_id"));
				invoice.setDate(rSet.getString("date"));
				invoice.setStatus(rSet.getString("status"));
				list.add(invoice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
