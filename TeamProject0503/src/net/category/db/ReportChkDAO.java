package net.category.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReportChkDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public int reportCheck(int r_num, String id) {
		
		int check = 1;
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			
			sql = "select * from report_chk where rp_num = ? && rp_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = 0;	// 신고 한번 했을때
			}else {
				sql = "insert into report_chk(rp_num,rp_id) values(?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, r_num);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
				check = 1;	// 신고 안했을때
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException e){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
			if(con!=null)try{con.close();}catch(SQLException e){};
		}
		return check;
	}
	
public int totalReport(int r_num) {
				
		int total=0;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			
			sql = "select r_id from review where r_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String r_id = rs.getString("r_id");
				sql = "select sum(r_report) as sum from review where r_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, r_id);		
				rs = pstmt.executeQuery();
				if(rs.next()){
					total = rs.getInt("sum");	
				}
			}			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException e){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
			if(con!=null)try{con.close();}catch(SQLException e){};
		}
		return total;
	}//end total

public String ReportUser(int r_num) {
	
	String user=null;
	Connection con=null;
	String sql="";
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
		con = getConnection();
		
		sql = "select r_id from review where r_num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, r_num);			
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			user = rs.getString("r_id");			
		}			
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	} finally {
		if(rs!=null)try{rs.close();}catch(SQLException e){};
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
		if(con!=null)try{con.close();}catch(SQLException e){};
	}
	return user;
}//end user
	
	
}
