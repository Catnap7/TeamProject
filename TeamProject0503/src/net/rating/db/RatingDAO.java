package net.rating.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
	
	public List randomMovieList(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List movieList=new ArrayList();
		int[]randomNum=new int[10];
		int check=0;
		try {
			con=getConnection();
			//평가하지 않은 영화를 불러올것
			////////////////////////////////////db완성되면 꼭 수정해야 하는곳[아이디 생성되고 세션값받을때]
//			sql="select mv_num from movie where mv_num not in (select mv_num from rating where ra_id=? and mv_num is not null)"
//					+ "order by mv_num desc";
			sql="select mv_num from movie order by mv_num desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//영화 마지막 번호 들고오기
			int lastNum=0;
			if(rs.next()){
				lastNum=rs.getInt("mv_num");
			}

			for(int i=0; i<randomNum.length;i++){
				Random r= new Random();
				//randomNum[인덱스]=랜덤한 숫자 하나 넣을것.
				randomNum[i]=r.nextInt(lastNum);

				//인덱스에 저장된 넘버가 디비에 있는지 확인
				sql="select * from movie where mv_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, randomNum[i]);
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
					movieList.add(moviebean);
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
	
}
