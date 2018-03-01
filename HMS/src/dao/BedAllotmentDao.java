package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sun.jndi.url.dns.dnsURLContext;

import bean.Bed;
import bean.BedAllotment;

public class BedAllotmentDao {
	
	public static List<BedAllotment> getAllotmentRecords(int start, int total) {
		List<BedAllotment> list=new ArrayList<BedAllotment>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try{
			String sql="select * from bed_allotment limit "+(start-1)+","+total;
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()) {
				BedAllotment bed=new BedAllotment();
				bed.setId(resultSet.getInt("id"));
				bed.setBedNumber(resultSet.getInt("bed_number"));
				bed.setBedType(resultSet.getString("bed_type"));
				bed.setPatientName(resultSet.getString("patient_name"));
				bed.setAllotmentDate(resultSet.getString("allotment_date"));
				bed.setDischargeDate(resultSet.getString("discharge_date"));
				list.add(bed);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<BedAllotment> getAllotmentRecords() {
		List<BedAllotment> list=new ArrayList<BedAllotment>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try{
			String sql="select * from bed_allotment";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()) {
				BedAllotment bed=new BedAllotment();
				bed.setId(resultSet.getInt("id"));
				bed.setBedNumber(resultSet.getInt("bed_number"));
				bed.setBedType(resultSet.getString("bed_type"));
				bed.setPatientName(resultSet.getString("patient_name"));
				bed.setAllotmentDate(resultSet.getString("allotment_date"));
				bed.setDischargeDate(resultSet.getString("discharge_date"));
				list.add(bed);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<BedAllotment> getAllotmentRecords(String  patientName) {
		List<BedAllotment> list=new ArrayList<BedAllotment>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try{
			String sql="select * from bed_allotment where patient_name='"+patientName+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()) {
				BedAllotment bed=new BedAllotment();
				bed.setId(resultSet.getInt("id"));
				bed.setBedNumber(resultSet.getInt("bed_number"));
				bed.setBedType(resultSet.getString("bed_type"));
				bed.setPatientName(resultSet.getString("patient_name"));
				bed.setAllotmentDate(resultSet.getString("allotment_date"));
				bed.setDischargeDate(resultSet.getString("discharge_date"));
				list.add(bed);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<BedAllotment> getAllotmentNumberType() {
		List<BedAllotment> list=new ArrayList<BedAllotment>();
		try {
			Connection connection=dbConnector.DbConnector.getConnection();
			String sql="select bed_number,bed_type from bed_allotment";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()){
				BedAllotment bed=new BedAllotment();
				bed.setBedNumber(rSet.getInt("bed_number"));
				bed.setBedType(rSet.getString("bed_type"));
				list.add(bed);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static List<Bed> getBedColumn(String columnName){
		List<Bed> list=new ArrayList<Bed>();
		try {
			Connection connection=dbConnector.DbConnector.getConnection();
			String sql="select "+columnName+" from bed";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()){
				Bed bed=new Bed();
				if (columnName=="total_bed") {
					bed.setTotalBed(rSet.getInt("total_bed"));
				}
				if (columnName=="bed_type") {
					bed.setBedType(rSet.getString("bed_type"));
				}
				if (columnName=="rate") {
					bed.setRate(rSet.getInt("rate"));
				}
				list.add(bed);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<BedAllotment> getRecordById(int id) {
		List<BedAllotment> list=new ArrayList<BedAllotment>();
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select bed_number, bed_type, patient_name, allotment_date, discharge_date from bed_allotment where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet resultSet=pStatement.executeQuery();
			while(resultSet.next()) {
				BedAllotment bAllotment=new BedAllotment();
				bAllotment.setBedNumber(resultSet.getInt("bed_number"));
				bAllotment.setBedType(resultSet.getString("bed_type"));
				bAllotment.setPatientName(resultSet.getString("patient_name"));
				bAllotment.setAllotmentDate(resultSet.getString("allotment_date"));
				bAllotment.setDischargeDate(resultSet.getString("discharge_date"));
				list.add(bAllotment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static double getTotalBedFee(String allotmentDate, String dischargeDate) {
		Connection connection=dbConnector.DbConnector.getConnection();
		double bedFee=0;
		DateFormat dFormat=new SimpleDateFormat("yyyy-MM-dd");
		Date d1=null;
		Date d2=null;
		long diffDay=0;
		try {
			d1=dFormat.parse(allotmentDate);
			d2=dFormat.parse(dischargeDate);
			
			long diff = d2.getTime() - d1.getTime();
			diffDay = diff / (24 * 60 * 60 * 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return diffDay;
	}
	
//	public static List<Bed> getBedColumn(String columnName, String conditionalColumn,String conditionalColumnValue) {
//		List<Bed> list=new ArrayList<Bed>();
//		try {
//			Connection connection=dbConnector.DbConnector.getConnection();
//			String sql="select "+columnName+" from bed where "+conditionalColumn+"='"+conditionalColumnValue+"'";
//			PreparedStatement pStatement=connection.prepareStatement(sql);
//			ResultSet resultSet=pStatement.executeQuery();
//			while(resultSet.next()) {
//				Bed bed=new Bed();
//				if (columnName=="total_bed") {
//					bed.setTotalBed(resultSet.getInt("total_bed"));
//				}
//				if (columnName=="bed_type") {
//					bed.setBedType(resultSet.getString("bed_type"));
//				}
//				if (columnName=="rate") {
//					bed.setRate(resultSet.getInt("rate"));
//				}
//				list.add(bed);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
//	public static void main(String[] args) {
//		System.out.println(getTotalBedFee("2017-03-23", "2017-03-27"));
//	}
}
