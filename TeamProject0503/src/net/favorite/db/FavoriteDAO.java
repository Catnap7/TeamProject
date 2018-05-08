package net.favorite.db;

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

import net.admin.manage.db.MovieBean;
import net.mypage.db.CouponBean;

public class FavoriteDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	public int favoriteCheck(String f_id, int f_num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int check=0;
		try {
			con=getConnection();
			
			sql="select * from favorite where f_id=? and f_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, f_id);
			pstmt.setInt(2, f_num);
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
	
	public void insertFavortie(FavoriteBean favoriteBean){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = getConnection();
			sql="insert into favorite(f_id,f_num) values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, favoriteBean.getF_id());
			pstmt.setInt(2, favoriteBean.getF_num());
			pstmt.executeUpdate();
		 }catch(Exception e) {
			//예외 생기면 변수 e에 저장
			//예외를 잡아서 처리 -> 메시지 출력
			e.printStackTrace();
			}finally{
				//예외가 발생하든 말든 상관없이 마무리작업
				//객체 기억장소 마무리
				if(rs!=null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
				if(con!=null)try{con.close();}catch(SQLException e){e.printStackTrace();}
			}
	}
	public void favoritedelete(String f_id, int f_num){
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();
			
			sql="delete from favorite where f_id=? and f_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, f_id);
			pstmt.setInt(2, f_num);
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
	
	public List <FavoriteBean>getFavoritelist(String id){
		List<FavoriteBean> favoritelist = new ArrayList<FavoriteBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = getConnection();
			sql="select * from favorite where f_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){			
				FavoriteBean fb = new FavoriteBean();
				fb.setF_id(rs.getString("f_id"));
				fb.setF_num(rs.getInt("f_num"));
							
				favoritelist.add(fb);
				}
		 }catch(Exception e) {
			//예외 생기면 변수 e에 저장
			//예외를 잡아서 처리 -> 메시지 출력
			e.printStackTrace();
			}finally{
				//예외가 발생하든 말든 상관없이 마무리작업
				//객체 기억장소 마무리
				if(rs!=null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
				if(con!=null)try{con.close();}catch(SQLException e){e.printStackTrace();}
			}
		return favoritelist;
	}//end getFavoritelist
	public FavoriteBean getfavorite(int f_num, String f_id){
		 Connection con = null;
	      String sql = "";
	      PreparedStatement pstmt =null;
	      ResultSet rs = null;
	      FavoriteBean favoriteBean =null;
	      try{
			con = getConnection();
			sql = "select * from favorite where f_id =? f_num=?";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
		         //Step.04 객체실행
			if (rs.next()) {
				favoriteBean = new FavoriteBean();
				favoriteBean.setF_id(f_id);
				favoriteBean.setF_num(f_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
	         if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}
	         if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
		}
		return favoriteBean;
	}
	
}
