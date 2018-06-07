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
	public List mostCountGenre(String id){		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String mostCountGenre="";
		List movieList=null;
		try {
			con=getConnection();

			sql="select mv_genre, count(mv_genre) from rating r join movie m on r.ra_p_num=m.mv_num where ra_id=? group by mv_genre order by count(mv_genre) desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){				
				mostCountGenre=rs.getString("mv_genre");
				movieList= new ArrayList<MovieBean>();
			}						
			
			sql="select * from movie where mv_genre=? order by rand() limit 15";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mostCountGenre);
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
	
	
	
	//사용자가 가장 높은 수의 평가(별점)을 남긴 장르
	//수정해서 쓸것
	public List mostAvgGenre(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String mostAvgGenre="";
		List movieList=null;
		try {
			con=getConnection();

			sql="select mv_genre, avg(ra_rating) from rating r join movie m on r.ra_p_num=m.mv_num where ra_id=? group by mv_genre order by avg(ra_rating) desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				mostAvgGenre=rs.getString("mv_genre");
				movieList= new ArrayList<MovieBean>();
			}			
			
			sql="select * from movie where mv_genre=? order by rand() limit 15";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mostAvgGenre);
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
	
	public List bestMovie(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";		
		List movieList=new ArrayList<MovieBean>();
		List RandomList = new ArrayList<MovieBean>();
		try {
			con=getConnection();

			sql="select * from movie join rating on mv_num = ra_p_num group by mv_num order by avg(ra_rating) desc limit 15";
			pstmt=con.prepareStatement(sql);			
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
			
			Random r = new Random();
			int size = 13;
			for(int i=0;i<13;i++){
				int index = r.nextInt(size);
				RandomList.add(i, movieList.get(index));
				movieList.remove(index);
				size--;
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return RandomList;
	}
	
	// 관리자 Pick
	public List adminSelectMovie(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";		
		List adminSelectMovieList=new ArrayList<MovieBean>();
		try {
			con=getConnection();

			sql="select * from movie order by rand() limit 15";
			pstmt=con.prepareStatement(sql);			
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
				adminSelectMovieList.add(moviebean);				
			}						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return adminSelectMovieList;
	}
	// 관리자 PIck
	
	//search
	public List titlesearch(String search){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String mostAvgGenre="";
		List titlesearchList= new ArrayList();
		try {
			con=getConnection();

			sql="select * "
					+ "from movie "
					+ "where mv_kor_title like ? or mv_eng_title like ?"
					+ "order by rand()";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+search+"%");
			pstmt.setString(2,"%"+search+"%");
			rs=pstmt.executeQuery();
			System.out.println(search);
			while(rs.next()){
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				titlesearchList.add(moviebean);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return titlesearchList;
	}
	public List directorsearch(String search){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String mostAvgGenre="";
		List directorsearchList= new ArrayList();
		try {
			con=getConnection();

			sql="select * from movie "
					+ "where mv_director like ?"
					+ "order by rand()";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+search+"%");
			rs=pstmt.executeQuery();
			System.out.println(search);
			while(rs.next()){
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_director(rs.getString("mv_director"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				directorsearchList.add(moviebean);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return directorsearchList;
	}
	public List actorsearch(String search){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String mostAvgGenre="";
		List actorsearchList= new ArrayList();
		try {
			con=getConnection();

			sql="select * from movie "
					+ "where mv_actor like ?"
					+ "order by rand()";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+search+"%");
			rs=pstmt.executeQuery();
			System.out.println(search);
			while(rs.next()){
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_actor(rs.getString("mv_actor"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				actorsearchList.add(moviebean);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return actorsearchList;
	}
	
	
}
