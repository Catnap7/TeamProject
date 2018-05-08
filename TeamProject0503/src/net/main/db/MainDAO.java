package net.main.db;

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

public class MainDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	
	
	//사용자가 가장 많은수의 평가(별점)을 남긴 장르
	//수정해서 쓸것
	public String mostCountGenre(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String mostCountGenre="";
		try {
			con=getConnection();

			sql="select mv_genre, count(mv_genre) from rating r join movie m on r.ra_p_num=m.mv_num where ra_id=? group by mv_genre order by count(mv_genre) desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				rs.getString("mv_genre");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return mostCountGenre;
	}
	
	
	
	//사용자가 가장 많은수의 평가(별점)을 남긴 장르
	//수정해서 쓸것
	public String mostAvgGenre(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String mostAvgGenre="";
		try {
			con=getConnection();

			sql="select mv_genre, avg(ra_rating) from rating r join movie m on r.ra_p_num=m.mv_num where ra_id=? group by mv_genre order by avg(ra_rating) desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				rs.getString("mv_genre");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return mostAvgGenre;
	}

}
