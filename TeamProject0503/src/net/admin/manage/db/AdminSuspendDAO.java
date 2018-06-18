package net.admin.manage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminSuspendDAO {
	
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
	}
	
	public int AdminMemberSuspend(String m_id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int max = 0;
		try {
			con = getConnection();
			sql = "select max(r_report) from review where r_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt("max(r_report)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return max;
	}
	
	public int AdminMemberGrade(String id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int grade = 0;
		try {
			con = getConnection();
			sql = "select m_grade from member where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				grade = rs.getInt("m_grade");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return grade;
	}
	
	public String AdminMemberEndDay(String id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String endday = null;
		try {
			con = getConnection();
			sql = "select m_end_day from member where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				endday = rs.getDate("m_end_day").toString();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return endday;
	}
	
	public int AdminReviewReport(int r_p_num, String id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int reportCheck = 0;
		System.out.println(r_p_num);
		System.out.println(id);
		try {
			con = getConnection();
			sql = "select r_report from review where r_id = ? and r_p_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, r_p_num);
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				reportCheck = rs.getInt("r_report");
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		System.out.println(reportCheck);
		return reportCheck;
	}
	
	public void AdminMemberGradeChange(String id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			sql = "update member set m_grade = 3, m_end_day = date_add(now(), interval +1 day) where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}			
		}
	}
	
	public void AdminMemberGradeChangeplus(String id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			sql = "update member set m_grade = 4, m_end_day = date_add(now(), interval +1 day) where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
	}
	
	public void AdminMemberGradeReturn(String id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			sql = "update member set m_grade = 1 where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
	}

}
