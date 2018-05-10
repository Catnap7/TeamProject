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

import net.member.db.MemberBean;

public class AdminReviewDAO {

	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
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
	
	public List<AdminReviewBean> getAdminReviewList(int startRow, int pageSize) {
		List<AdminReviewBean> lrb = new ArrayList<AdminReviewBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from review order by r_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				AdminReviewBean adminreviewbean = new AdminReviewBean();
				adminreviewbean.setContent(rs.getString("r_content"));
				adminreviewbean.setR_date(rs.getDate("r_date"));
				adminreviewbean.setR_id(rs.getString("r_id"));
				adminreviewbean.setR_num(rs.getInt("r_num"));
				adminreviewbean.setR_p_num(rs.getInt("r_p_num"));
				adminreviewbean.setR_recommand(rs.getInt("r_recommand"));
				adminreviewbean.setR_report(rs.getInt("r_report"));				
				lrb.add(adminreviewbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return lrb;
	}//End getAdminReviewList(int startRow, int pageSize, String search)

}
