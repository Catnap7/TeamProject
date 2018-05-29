package net.favorite.db;

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
			sql="insert into favorite(f_id,f_num,f_date) values(?,?,now())";
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
			sql = "select * from favorite where f_id =? and f_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, f_id);
			pstmt.setInt(2, f_num);
			rs = pstmt.executeQuery();
			
		         //Step.04 객체실행
			if (rs.next()) {
				favoriteBean = new FavoriteBean();
				favoriteBean.setF_id(rs.getString("f_id"));
				favoriteBean.setF_num(rs.getInt("f_num"));
				favoriteBean.setF_date(rs.getTimestamp("f_date"));
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

	public List randomFavoriteList(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int[]randomNum=null;
		int[]favorite = new int[getFavoriteCount(id)];
		
		if(getFavoriteCount(id)>=13){
			randomNum=new int[13];	
		}else{
			randomNum=new int[getFavoriteCount(id)];		
		}
						
		List favoriteList=new ArrayList();		 
		int check=0;
		try {
			con=getConnection();
			//해당 아이디의 즐겨찾기 내역 들고오기
			////////////////////////////////////db완성되면 꼭 수정해야 하는곳[아이디 생성되고 세션값받을때]
			sql="select f_num from favorite where f_id=? order by f_num desc";
					
			//sql="select mv_num from movie order by mv_num desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			//영화 마지막 번호 들고오기
			int Num=0;			
			while(rs.next()){
				favorite[Num]=rs.getInt("f_num");
				Num++;
			}

			for(int i=0; i<randomNum.length;i++){
				Random r= new Random();
				//randomNum[인덱스]=랜덤한 숫자 하나 넣을것.
				randomNum[i]=favorite[r.nextInt(favorite.length)];

				//인덱스에 저장된 넘버가 디비에 있는지 확인
				sql="select * from movie join favorite on mv_num = f_num where f_num=? and f_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, randomNum[i]);
				pstmt.setString(2, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					//이러면 패스.
					//중복 제거
					for(int j=0;j<i; j++){
						if(randomNum[i]==randomNum[j]){
							check=-1;
						}
					}
				}else{
					check=-1;
					//다시 랜덤생성. 
				}
				
				//중복이 없을때, db에도 있는 번호일때, 되돌려줄 moviebean저장
				if(check!=-1){
					MovieBean moviebean= new MovieBean();
					moviebean.setMv_num(randomNum[i]);
					moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
					moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
					moviebean.setMv_genre(rs.getString("mv_genre"));
					moviebean.setMv_year(rs.getInt("mv_year"));
					moviebean.setMv_age(rs.getInt("mv_age"));
					moviebean.setMv_time(rs.getInt("mv_time"));
					favoriteList.add(moviebean);
				}else{
					check=0;
					i--;									
				}
			}
//			무비리스트에 다 다른 주소가 저장되었는지 확인			
//			for (int j = 0; j < 10; j++) {
//				System.out.println(movieList.get(j));
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return favoriteList;
	}//end random
	
	public int getFavoriteCount(String id){
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 int count = 0;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select count(*) as count from favorite where f_id=?";				 				 
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
						
						if(rs!=null){
							try{rs.close();
							}catch(SQLException e){
								e.printStackTrace();
							 }
							}//end if
						if(pstmt!=null){
							try{pstmt.close();						
							}catch(SQLException e){
								e.printStackTrace();
							}
						 }//end if
							if(con!=null){
								try{con.close();
								}catch(SQLException e){
									e.printStackTrace();
								 }
								}//end if
					}
		 return count;
	 }//end count
	
}
