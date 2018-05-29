package net.rating.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.admin.manage.db.MovieBean;

public class RatingDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public List randomMovieList(String ra_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List movieList=new ArrayList();
		try {
			con=getConnection();
			
			//랜덤하게 10개의 영화를 중복없이 movie table안에 존재하고, rating하지않은 영화불러오기
			sql="select * from movie where mv_num not in (select ra_p_num from rating where ra_id=? and ra_p_num is not null) order by rand() limit 10";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ra_id);
			rs=pstmt.executeQuery();
			
			//남이 있는 영화가 10개 이상일때는 10개 저장, 미만일때는 더 적은 숫자의 영화 저장
			while(rs.next()){
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
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
	
	
	public int ratingCheck(String ra_id, int ra_p_num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int check=0;
		try {
			con=getConnection();
			
			sql="select * from rating where ra_id=? and ra_p_num=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ra_id);
			pstmt.setInt(2, ra_p_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				check=-1;
			}else{
				check=1;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return check;
	}
	
	
	public void insertRating(RatingBean ratingbean){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();
			
			sql="insert into rating (ra_id,ra_rating,ra_p_num) values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ratingbean.getRa_id());
			pstmt.setInt(2, ratingbean.getRa_rating());
			pstmt.setInt(3, ratingbean.getRa_p_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}
	
	public void updateRating(RatingBean ratingbean){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();

			sql="update rating set ra_rating=? where ra_id=? and ra_p_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ratingbean.getRa_rating());
			pstmt.setString(2, ratingbean.getRa_id());
			pstmt.setInt(3, ratingbean.getRa_p_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}
	
	
	
	
	
	
	
	
	
	//myrating에서 사용
	
	public int getRatingCount(String id){
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 int count = 0;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select count(*) as count from rating where ra_id=?";				 				 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					count = rs.getInt("count");
				}
				
			} catch(Exception e) {
					//예외 생기면 변수 e에 저장
					//예외를 잡아서 처리 -> 메시지 출력
					e.printStackTrace();
					}finally{
						//예외가 발생하든 말든 상관없이 마무리작업
						//객체 기억장소 마무리
						if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
						if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
						if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
					}
		 return count;
	 }//end count
	
	public Vector getRatingList(String id, int startRow, int pageSize){
		 List<RatingBean> ratinglist = new ArrayList<RatingBean>();
		 List<MovieBean> movielist = new ArrayList<MovieBean>();
		 Vector vector= new Vector();
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select * from rating r join movie m on r.ra_p_num=m.mv_num where ra_id=? order by ra_num desc limit ?,?";				 				 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				
				while(rs.next()){			
					RatingBean rb = new RatingBean();
					rb.setRa_num(rs.getInt("ra_num"));
					rb.setRa_id(rs.getString("ra_id"));					
					rb.setRa_p_num(rs.getInt("ra_p_num"));
					rb.setRa_rating(rs.getInt("ra_rating"));
					ratinglist.add(rb);
					
					MovieBean moviebean= new MovieBean();
					moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
					moviebean.setMv_genre(rs.getString("mv_genre"));
					moviebean.setMv_num(rs.getInt("mv_num"));
					movielist.add(moviebean);
					
				}
				vector.add(ratinglist);
				vector.add(movielist);
				
				//ra_num에 따른 m_num을 설정. 
				// m_num에 따른 무비 정보 저장. 
				//무비리스트에 넣고. 
				//두가지 리스트 합치기. 
				
			} catch(Exception e) {
					//예외 생기면 변수 e에 저장
					//예외를 잡아서 처리 -> 메시지 출력
					e.printStackTrace();
					}finally{
						//예외가 발생하든 말든 상관없이 마무리작업
						//객체 기억장소 마무리
						if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
						if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
						if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
					}
		 return vector;
	 }//end list
	
	public RatingBean getRating(String id, int mv_num){ 
	 Connection con=null;
	 String sql="";
	 PreparedStatement pstmt=null;
	 ResultSet rs=null;
	 RatingBean ratingBean = new RatingBean();
	 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
			con = getConnection();
			sql="select * from rating where ra_id =? and ra_p_num=?";				 				 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, mv_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				ratingBean.setRa_id(rs.getString("ra_id"));
				ratingBean.setRa_rating(rs.getInt("ra_rating")); //
			}
			
		} catch(Exception e) {
				//예외 생기면 변수 e에 저장
				//예외를 잡아서 처리 -> 메시지 출력
				e.printStackTrace();
				}finally{
					//예외가 발생하든 말든 상관없이 마무리작업
					//객체 기억장소 마무리
					if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
					if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
					if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
				}
	 return ratingBean;
}
	public float avgRating(int mv_num){
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 float avg = 0;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select avg(ra_rating) as avg from rating where ra_p_num=?";				 				 
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, mv_num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					avg=rs.getFloat("avg");
				}
				
			} catch(Exception e) {
					//예외 생기면 변수 e에 저장
					//예외를 잡아서 처리 -> 메시지 출력
					e.printStackTrace();
					}finally{
						//예외가 발생하든 말든 상관없이 마무리작업
						//객체 기억장소 마무리
						if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
						if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
						if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
					}
		 return avg;
	}
	
}
