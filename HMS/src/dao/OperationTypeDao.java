package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.OperationType;

public class OperationTypeDao {
	
	public static List<OperationType> getRecords() {
		List<OperationType> list=new ArrayList<OperationType>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from operation_type";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				OperationType oType=new OperationType();
				oType.setId(rSet.getInt("id"));
				oType.setOperationtype(rSet.getString("operation_type"));
				oType.setFee(rSet.getDouble("operation_fee"));
				oType.setDescription(rSet.getString("description"));
				list.add(oType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<OperationType> getOperationtype() {
		List<OperationType> list=new ArrayList<OperationType>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select operation_type from operation_type";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				OperationType oType=new OperationType();
				oType.setOperationtype(rSet.getString("operation_type"));
				list.add(oType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
