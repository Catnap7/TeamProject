package net.main.db;

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
import net.favorite.db.FavoriteBean;
import net.member.db.MemberBean;
import net.vip.db.VipResBean;

public class MainDAO {
	
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	
	
	//main movie recommand
	public List mainMovieList(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";		
		
		List mainMovieList=new ArrayList<MovieBean>();
		
		try {
			con=getConnection();

			sql="select * from movie order by rand() limit 3";
			pstmt=con.prepareStatement(sql);			
			rs=pstmt.executeQuery();
			while(rs.next()){
 				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_country(rs.getString("mv_country"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				moviebean.setMv_director(rs.getString("mv_director"));
				moviebean.setMv_actor(rs.getString("mv_actor"));
				moviebean.setMv_video(rs.getString("mv_video"));
				
				mainMovieList.add(moviebean);		
				
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return mainMovieList;
	}
	
	//좋아요 많은 영화 랭킹
	public List getMostReviewsList(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";		
		int favcount=0;
				
		List mostReviewsList=new ArrayList<MovieBean>();
		
		try {
			con=getConnection();
			sql="select mv_num, m.mv_kor_title, m.mv_genre, m.mv_age, count(*) from watchu.favorite f join watchu.movie m on f.f_num=m.mv_num group by f.f_num order by count(*) desc limit 5 ";
			pstmt=con.prepareStatement(sql);			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
 				MovieBean moviebean= new MovieBean();
				
 				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				
				mostReviewsList.add(moviebean);		

			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return mostReviewsList;
	}
	
	//총 리뷰 수
	public int getAllReviewCount() {
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int allreviewcount = 0;
		
		try {
			con = getConnection();
			sql = "select count(*) as allreviewcount from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				allreviewcount = rs.getInt("allreviewcount");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException e){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
			if(con!=null)try{con.close();}catch(SQLException e){};
		}
		return allreviewcount;
	}	//총 리뷰 수
	

	
	//내가 가장 많은 평점 준 장르
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
	
	
	
	//내가 높은 평점 준 장르
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
	
	//인기영화
	public List bestMovie(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";		
		List movieList=new ArrayList<MovieBean>();
		List RandomList = null;
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
			
			sql="select count(*) as count from movie join rating on mv_num = ra_p_num group by mv_num order by avg(ra_rating) desc limit 15";
			pstmt=con.prepareStatement(sql);			
			rs=pstmt.executeQuery();
			if(rs.next()){
			Random r = new Random();
			int size = 15;
			if(rs.getInt("count")==15){
			for(int i=0;i<15;i++){
				int index = r.nextInt(size);
				RandomList.add(i, movieList.get(index));
				movieList.remove(index);
				size--;
			 }
			}//end if
		  }//end if
			
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
	//관리자 PIck
	
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
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return actorsearchList;
	}
	
	
}
