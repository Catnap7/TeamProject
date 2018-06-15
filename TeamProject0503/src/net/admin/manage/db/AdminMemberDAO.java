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
	public void AdminMemberDelete(String m_id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			sql = "delete from member where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
	}//End AdminMemberDelete	
	public List<MemberBean> getAdminMemberSearch(String searchValue, String select) {
		List<MemberBean> lmb = new ArrayList<MemberBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if(select.equals("m_grade")) {			
			if(searchValue.equals("로") || searchValue.equals("로그") || searchValue.equals("로그인") || searchValue.equals("로그인정") || searchValue.equals("로그인정지")) {
				searchValue = "4";
			}else if(searchValue.equals("댓") || searchValue.equals("댓글") || searchValue.equals("댓글정") || searchValue.equals("댓글정지")) {
				searchValue = "3";
			}else if(searchValue.equals("V") || searchValue.equals("VI") || searchValue.equals("VIP")) {
				searchValue = "2";
			}else if(searchValue.equals("정") || searchValue.equals("정회") || searchValue.equals("정회원")) {
				searchValue = "1";
			}else if(searchValue.equals("준") || searchValue.equals("준회") || searchValue.equals("준회원")) {
				searchValue = "0";
			}
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
	public int memberCountAll() {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countAll = 0;
		try {
			con = getConnection();
			sql = "select count(*) as count from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				countAll = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return countAll;		
	}

}//End AdminMemberDAO
