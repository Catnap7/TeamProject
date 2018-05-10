package net.category.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public void insertReview(ReviewBean reviewbean) {
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int r_num = reviewbean.getR_num();
		
		try {
			con = getConnection();
			sql = "select max(r_num) as r_num from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				r_num = rs.getInt(1)+1;
			}else {
				r_num = 1;
			}
			
			sql = "insert into review(r_num,r_id,r_p_num,r_recommand,r_content,r_report,r_date) values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, reviewbean.getR_id());
			pstmt.setInt(3, reviewbean.getR_p_num());
			pstmt.setInt(4, reviewbean.getR_recommand());
			pstmt.setString(5, reviewbean.getR_content());
			pstmt.setInt(6, reviewbean.getR_report());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException e){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
			if(con!=null)try{con.close();}catch(SQLException e){};
		}
	}
	
	public List getReview(int mv_num) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		
		List reviewList = new ArrayList();
		try {
			con=getConnection();
			
			sql = "select * from review where r_p_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mv_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBean reviewbean = new ReviewBean();
				reviewbean.setR_num(rs.getInt("r_num"));
				reviewbean.setR_id(rs.getString("r_id"));
				reviewbean.setR_p_num(rs.getInt("r_p_num"));
				reviewbean.setR_recommand(rs.getInt("r_recommand"));
				reviewbean.setR_report(rs.getInt("r_report"));
				reviewbean.setR_content(rs.getString("r_content"));
				reviewbean.setR_date(rs.getDate("r_date"));
				
				reviewList.add(reviewbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return reviewList;
	}
	

	
}








