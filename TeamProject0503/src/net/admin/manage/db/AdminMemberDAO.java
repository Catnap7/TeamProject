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

public class AdminMemberDAO {

	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
	}
	
	public List<MemberBean> getAdminMemberSearch(String searchValue, String select) {
		List<MemberBean> lmb = new ArrayList<MemberBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(searchValue.equals("VIP")) {
			searchValue = "2";
		}else if(searchValue.equals("정회원")) {
			searchValue = "1";
		}else if(searchValue.equals("준회원")) {
			searchValue = "0";
		}else if(searchValue.equals("댓글정지")) {
			searchValue = "-1";
		}else if(searchValue.equals("로그인정지")) {
			searchValue = "-2";
		}
		try {
			con = getConnection();
			sql = "select * from member where "+select+" LIKE ? order by m_reg_date asc";
//			sql = "select * from member where "+select+" LIKE ? or m_name LIKE ? or m_grade LIKE ? order by m_reg_date asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchValue+"%");
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MemberBean memberBean = new MemberBean();
				memberBean.setM_grade(rs.getInt("m_grade"));
				memberBean.setM_id(rs.getString("m_id"));
				memberBean.setM_id_num1(rs.getInt("m_id_num1"));
				memberBean.setM_id_num2(rs.getInt("m_id_num2"));
				memberBean.setM_name(rs.getString("m_name"));
				memberBean.setM_pass(rs.getString("m_pass"));
				memberBean.setM_pay(rs.getInt("m_pay"));
				memberBean.setM_reg_date(rs.getDate("m_reg_date"));
				lmb.add(memberBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return lmb;
	}//End getAdminMemberSearch

}//End AdminMemberDAO
