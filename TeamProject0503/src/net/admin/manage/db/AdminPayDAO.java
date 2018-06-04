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

import net.pay.db.PayBean;

public class AdminPayDAO {
	
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
	}
	
	public List<PayBean> getAdminPaySearch(String searchValue, String select) {
		List<PayBean> lpb = new ArrayList<PayBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from payment where "+select+" LIKE ? order by p_end_day asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchValue+"%");
			rs = pstmt.executeQuery();

			while(rs.next()) {
				PayBean payBean = new PayBean();
				payBean.setP_auto(rs.getString("p_auto"));
				payBean.setP_charge(rs.getInt("p_charge"));
				payBean.setP_end_day(rs.getDate("p_end_day"));
				payBean.setP_id(rs.getString("p_id"));
				payBean.setP_num(rs.getInt("p_num"));
				payBean.setP_start_day(rs.getDate("p_start_day"));
				lpb.add(payBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return lpb;
	}

}
