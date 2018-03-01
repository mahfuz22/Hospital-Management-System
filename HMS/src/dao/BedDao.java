package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.Select;

import bean.Bed;

public class BedDao {
	
	static Connection con=dbConnector.DbConnector.getConnection();
	
	
	//this method return back the result of id, bed_type, total_bed, rate from database with limit.
	public static List<Bed> getBedRecords( int start,int total){ 
		List<Bed> list=new ArrayList<Bed>();
		try {
			String sql="select id, bed_type, total_bed, rate from bed limit "+(start-1)+","+total;
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet resultSet=ps.executeQuery();
			while(resultSet.next()) {
				Bed bed=new Bed();
				bed.setId(resultSet.getInt("id"));
				bed.setBedType(resultSet.getString("bed_type"));
				bed.setTotalBed(resultSet.getInt("total_bed"));
				bed.setRate(resultSet.getInt("rate"));
				list.add(bed);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//this method return back the result of bed_type and total_bed from database.
	public static List<Bed> getBedNumberType(){
		List<Bed> list=new ArrayList<Bed>();
		try {
			String sql="select bed_type, total_bed from bed";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet resultSet=ps.executeQuery();
			while(resultSet.next()) {
				Bed bed=new Bed();
				bed.setBedType(resultSet.getString("bed_type"));
				bed.setTotalBed(resultSet.getInt("total_bed"));
				list.add(bed);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Bed> getBedNumberType(int id){
		List<Bed> list=new ArrayList<Bed>();
		try {
			String sql="select bed_type, total_bed, rate from bed where id='"+id+"'";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet resultSet=ps.executeQuery();
			while(resultSet.next()) {
				Bed bed=new Bed();
				bed.setBedType(resultSet.getString("bed_type"));
				bed.setTotalBed(resultSet.getInt("total_bed"));
				bed.setRate(resultSet.getInt("rate"));
				list.add(bed);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Bed> getBedType(int bedNumber){
		List<Bed> list=new ArrayList<Bed>();
		try {
			String sql="select bed_type from bed where total_bed='"+bedNumber+"'";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet resultSet=ps.executeQuery();
			while(resultSet.next()) {
				Bed bed=new Bed();
				bed.setBedType(resultSet.getString("bed_type"));
				list.add(bed);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static int getRateByType(String bedType) {
		int rate=0;
		try {
			String sql="select rate from bed where bed_type='"+bedType+"'";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet resultSet=ps.executeQuery();
			while(resultSet.next()) {
				rate=resultSet.getInt("rate");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rate;
	}
	
	
	
//	public static void main(String[] args) {
//		System.out.println(getRateByType("cabin"));
//		
//	}
}
