package net.admin.manage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.category.db.ReviewBean;
import net.member.db.MemberBean;

public class AdminReviewDAO {

	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
	}		
		public List<ReviewBean> getAdminReviewSearch(String searchValue, String select) {
			List<ReviewBean> lrb = new ArrayList<ReviewBean>();
			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = getConnection();
				sql = "select * from review where "+select+" LIKE ? order by r_date asc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchValue+"%");
				rs = pstmt.executeQuery();

				while(rs.next()) {
					ReviewBean reviewBean = new ReviewBean();
					reviewBean.setR_content(rs.getString("r_content"));
					reviewBean.setR_date(rs.getTimestamp("r_date"));
					reviewBean.setR_id(rs.getString("r_id"));
					reviewBean.setR_num(rs.getInt("r_num"));
					reviewBean.setR_recommand(rs.getInt("r_recommand"));
					reviewBean.setR_report(rs.getInt("r_report"));
					lrb.add(reviewBean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
				if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
				if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
			}
			return lrb;
		}
	public int getAdminReviewCount(){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("count(*)");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}						
		}
		return count;
	}//End getAdminReviewCount()
	
	public List<ReviewBean> getAdminReviewList(int startRow, int pageSize) {
		List<ReviewBean> lrb = new ArrayList<ReviewBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from review order by r_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				ReviewBean reviewbean = new ReviewBean();
				reviewbean.setR_content(rs.getString("r_content"));
				reviewbean.setR_date(rs.getTimestamp("r_date"));
				reviewbean.setR_id(rs.getString("r_id"));
				reviewbean.setR_num(rs.getInt("r_num"));
				reviewbean.setR_p_num(rs.getInt("r_p_num"));
				reviewbean.setR_recommand(rs.getInt("r_recommand"));
				reviewbean.setR_report(rs.getInt("r_report"));				
				lrb.add(reviewbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return lrb;
	}//End getAdminReviewList(int startRow, int pageSize)
	
	public void AdminReviewDelete(int r_num) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			sql = "delete from review where r_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}	
		}
	}//End AdminReviewDelete

}
