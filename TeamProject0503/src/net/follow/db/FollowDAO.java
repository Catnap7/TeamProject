package net.follow.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Vector;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.admin.manage.db.MovieBean;
import net.category.db.ReviewBean;
import net.favorite.db.FavoriteBean;

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
			sql = "select count(*) from follow where fo_following=? ";
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
			sql = "select count(*) from follow where fo_id=? ";
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
	

	//followfavorite
	public List followfavorite(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List movieList=null;
		try {
			con=getConnection();

			sql="select * from favorite f join movie m on f.f_num=m.mv_num where f_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				movieList.add(moviebean);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return movieList;		
	}

	//followReview
	public List followreview(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List movieList=null;
		try {
			con=getConnection();

			sql="select * from favorite f join movie m on f.f_num=m.mv_num where f_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				movieList.add(moviebean);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return movieList;		
	}
	
	/*public Vector top5followfavorite(String m_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Vector vector= new Vector();
		List<FavoriteBean> top5favoritelist= new ArrayList<FavoriteBean>();
		List<MovieBean> top5movielist2= new ArrayList<MovieBean>();
		try {
			con=getConnection();

			sql= "select * from favorite f join movie m"
					+ "on f.f_num = m.mv_num "
					+ "where f_id = ? order by rand()";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				FavoriteBean favoritebean = new FavoriteBean();
				favoritebean.setF_id(rs.getString("f_id"));
				favoritebean.setF_id(rs.getString("f_num"));
				top5favoritelist.add(favoritebean);
				
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				top5movielist2.add(moviebean);
			}
			vector.add(top5favoritelist);
			vector.add(top5movielist2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return vector;		
	}*/
	public List top5followfavorite(String m_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List<MovieBean> top5favoritelist= new ArrayList<MovieBean>();
		try {
			con=getConnection();

			sql= "select * from favorite f join movie m on f.f_num = m.mv_num where f_id = ? order by rand() limit 5";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
		
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				top5favoritelist.add(moviebean);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return top5favoritelist;		
	}
	

	//followReview
	public Vector top5followreview(String m_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Vector vector= new Vector();
		List<ReviewBean> top5reviewlist= new ArrayList<ReviewBean>();
		List<MovieBean> top5movielist= new ArrayList<MovieBean>();
		
		try {
			con=getConnection();

			sql="select * "
					+ "from review r join movie m "
					+ "on r.r_num = m.mv_num "
					+ "where r_id = ?"
					+ " order by r_date desc limit 5";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			
	while(rs.next()){
				
				ReviewBean reviewbean = new ReviewBean();
				reviewbean.setR_content(rs.getString("r_content"));
				reviewbean.setR_date(rs.getDate("r_date"));
				reviewbean.setR_recommand(rs.getInt("r_recommand"));
				reviewbean.setR_report(rs.getInt("r_report"));
				top5reviewlist.add(reviewbean);
				
				
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				top5movielist.add(moviebean);
			}
			vector.add(top5reviewlist);
			vector.add(top5movielist);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return vector;		
	}
	
	
}
