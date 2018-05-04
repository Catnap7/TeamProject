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

	public List<MemberBean> getAdminMemberList(int startRow, int pageSize) {
		List<MemberBean> lmb = new ArrayList<MemberBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from member order by m_id desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
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
	}//End getAdminMemberList
	
	public List<MemberBean> getAdminMemberList(int startRow, int pageSize, int search) {
		List<MemberBean> lmb = new ArrayList<MemberBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from member where m_grade like ? OR m_id like ? OR m_name like? order by m_id desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, search);
			pstmt.setInt(2, search);
			pstmt.setInt(3, search);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, pageSize);
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
	}//End getAdminMemberList(int startRow, int pageSize, String search)

	public void AdminMemberDelete(String id) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			sql = "delete from member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}	
		}
	}//End AdminMemberDelete
	
	public int getAdminMemberCount(){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from member";
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
	}//End getAdminMemberCount()
	
	public int getAdminMemberCount(int search){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from member where m_grade = ? OR m_id = ? OR m_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, search);
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
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
	}//End getAdminMemberCount(String search)
	
	public List<MemberBean> getAdminMemberSort(String sort){
		List<MemberBean> lmb = new ArrayList<MemberBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from member order by ? desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sort);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBean memberBean = new MemberBean();
				memberBean.setM_grade(rs.getInt("m_grade"));
				memberBean.setM_id(rs.getString("m_id"));
				memberBean.setM_name(rs.getString("m_name"));
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
	}

}//End AdminMemberDAO
