package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Notice;

public class NoticeDao {
	
	public static List<Notice> getRecords() {
		List<Notice> list=new ArrayList<Notice>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from notice";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Notice notice=new Notice();
				notice.setId(rSet.getInt("id"));
				notice.setSubject(rSet.getString("subject"));
				notice.setDescription(rSet.getString("description"));
				notice.setDate(rSet.getString("date"));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Notice> getRecordsById(int id) {
		List<Notice> list=new ArrayList<Notice>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from notice where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Notice notice=new Notice();
				notice.setId(rSet.getInt("id"));
				notice.setSubject(rSet.getString("subject"));
				notice.setDescription(rSet.getString("description"));
				notice.setDate(rSet.getString("date"));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Notice> getRecords(int start, int total) {
		List<Notice> list=new ArrayList<Notice>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select * from notice limit "+(start-1)+","+total;
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				Notice notice=new Notice();
				notice.setId(rSet.getInt("id"));
				notice.setSubject(rSet.getString("subject"));
				notice.setDescription(rSet.getString("description"));
				notice.setDate(rSet.getString("date"));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
