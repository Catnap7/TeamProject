package net.follow.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.admin.manage.db.MovieBean;

public class FollowDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public int Followercount(String m_id){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int followercount = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from follow where fo_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			followercount = rs.getInt("count(*)");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}						
		}
		return followercount;
	}
	public int Followingcount(String m_id){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int followingcount = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from follow where fo_follwing=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			followingcount = rs.getInt("count(*)");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}						
		}
		return followingcount;
	}
	
}
