package net.admin.notice.db;

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

import net.member.db.MemberBean;

public class NoticeDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
	}
	
	public void NoticeInsert(NoticeBean nb) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			sql = "insert into notice(n_num, n_subject, n_content, n_date, n_image, n_file) values(0, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nb.getN_subject());
			pstmt.setString(2, nb.getN_content());
			pstmt.setDate(3, nb.getN_date());
			pstmt.setString(4, nb.getN_image());
			pstmt.setString(5, nb.getN_file());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}			
		}
	}
	
	public int getAdminNoticeCount(){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from notice";
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
	}//End getAdminNoticeCount()
	
	public List<NoticeBean> getAdminNoticeList(int startRow, int pageSize) {
		List<NoticeBean> lnb = new ArrayList<NoticeBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from notice order by n_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				NoticeBean noticebean = new NoticeBean();
				noticebean.setN_content(rs.getString("n_content"));
				noticebean.setN_date(rs.getDate("n_date"));
				noticebean.setN_file(rs.getString("n_file"));
				noticebean.setN_image(rs.getString("n_image"));
				noticebean.setN_num(rs.getInt("n_num"));
				noticebean.setN_subject(rs.getString("n_subject"));
				lnb.add(noticebean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return lnb;
	}//End getAdminNoticeList
	
	public List<NoticeBean> getAdminNoticeList() {
		List<NoticeBean> lnb = new ArrayList<NoticeBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from notice order by n_num desc limit 0, 10";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				NoticeBean noticebean = new NoticeBean();
				noticebean.setN_content(rs.getString("n_content"));
				noticebean.setN_date(rs.getDate("n_date"));
				noticebean.setN_file(rs.getString("n_file"));
				noticebean.setN_image(rs.getString("n_image"));
				noticebean.setN_num(rs.getInt("n_num"));
				noticebean.setN_subject(rs.getString("n_subject"));
				lnb.add(noticebean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return lnb;
	}//End getAdminNoticeList
	


	
}
