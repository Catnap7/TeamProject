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

public class AdminMovieDAO {
	
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
	}
	
	public List<MovieBean> getAdminMovieSearch(String searchValue, String select) {
		List<MovieBean> lmb = new ArrayList<MovieBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from movie where "+select+" LIKE ? order by mv_year asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchValue+"%");
			rs = pstmt.executeQuery();

			while(rs.next()) {
				MovieBean movieBean = new MovieBean();
				movieBean.setMv_actor(rs.getString("mv_actor"));
				movieBean.setMv_age(rs.getInt("mv_age"));
				movieBean.setMv_country(rs.getString("mv_country"));
				movieBean.setMv_director(rs.getString("mv_director"));
				movieBean.setMv_eng_title(rs.getString("mv_eng_title"));
				movieBean.setMv_genre(rs.getString("mv_genre"));
				movieBean.setMv_kor_title(rs.getString("mv_kor_title"));
				movieBean.setMv_num(rs.getInt("mv_num"));
				movieBean.setMv_story(rs.getString("mv_story"));
				movieBean.setMv_time(rs.getInt("mv_time"));
				movieBean.setMv_video(rs.getString("mv_video"));
				movieBean.setMv_year(rs.getInt("mv_year"));
				lmb.add(movieBean);
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
	
	public MovieBean getMovieInfo(String mv_num) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MovieBean movieBean = null;
		
		try {
			con = getConnection();
			sql = "select * from movie where mv_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mv_num);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				movieBean = new MovieBean();
				movieBean.setMv_actor(rs.getString("mv_actor"));
				movieBean.setMv_age(rs.getInt("mv_age"));
				movieBean.setMv_country(rs.getString("mv_country"));
				movieBean.setMv_director(rs.getString("mv_director"));
				movieBean.setMv_eng_title(rs.getString("mv_eng_title"));
				movieBean.setMv_genre(rs.getString("mv_genre"));
				movieBean.setMv_kor_title(rs.getString("mv_kor_title"));
				movieBean.setMv_num(rs.getInt("mv_num"));
				movieBean.setMv_story(rs.getString("mv_story"));
				movieBean.setMv_time(rs.getInt("mv_time"));
				movieBean.setMv_video(rs.getString("mv_video"));
				movieBean.setMv_year(rs.getInt("mv_year"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}		
		return movieBean;		
	}
	
	public void movieDelete(String mv_num) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			sql = "delete from movie where mv_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mv_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}	
	}
	
	public void movieUpdate(MovieBean movieBean) {
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			sql = "update movie set mv_kor_title = ?, mv_eng_title = ?, mv_year = ?, mv_country = ?, mv_age = ?, mv_genre = ?, mv_time = ?, mv_director = ?, mv_actor = ?, mv_story = ?, mv_video = ? where mv_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movieBean.getMv_kor_title());
			pstmt.setString(2, movieBean.getMv_eng_title());
			pstmt.setInt(3, movieBean.getMv_year());
			pstmt.setString(4, movieBean.getMv_country());
			pstmt.setInt(5, movieBean.getMv_age());
			pstmt.setString(6, movieBean.getMv_genre());
			pstmt.setInt(7, movieBean.getMv_time());
			pstmt.setString(8, movieBean.getMv_director());
			pstmt.setString(9, movieBean.getMv_actor());
			pstmt.setString(10, movieBean.getMv_story());
			pstmt.setString(11, movieBean.getMv_video());
			pstmt.setInt(12, movieBean.getMv_num());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		
	}

}
