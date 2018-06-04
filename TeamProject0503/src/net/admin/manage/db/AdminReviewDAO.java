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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.category.db.ReviewBean;
import net.member.db.MemberBean;
import net.pay.db.PayBean;

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
			sql = "select * from review where "+select+" LIKE ? order by r_report asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchValue+"%");
			rs = pstmt.executeQuery();

			while(rs.next()) {
				ReviewBean reviewBean = new ReviewBean();
				reviewBean.setR_num(rs.getInt("r_num"));
				reviewBean.setR_id(rs.getString("r_id"));
				reviewBean.setR_content(rs.getString("r_content"));
				reviewBean.setR_recommand(rs.getInt("r_recommand"));
				reviewBean.setR_report(rs.getInt("r_report"));
				reviewBean.setR_date(rs.getTimestamp("r_date"));
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

}
