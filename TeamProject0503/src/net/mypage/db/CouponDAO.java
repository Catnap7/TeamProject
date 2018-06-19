package net.mypage.db;

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

import net.member.db.MemberBean;

public class CouponDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public int getCouponCount(String id){
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 int count = 0;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select count(*) as count from coupon where c_id=?";				 				 
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
	
	public List<CouponBean> getCoupons(String id, int startRow, int pageSize){
		 List<CouponBean> couponlist = new ArrayList<CouponBean>();
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select * from coupon where c_id=? order by c_num desc limit ?,?";				 				 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				
				while(rs.next()){					 
					CouponBean cb = new CouponBean();
					cb.setC_id(rs.getString("c_id"));
					cb.setC_num(rs.getInt("c_num"));					
					cb.setC_name(rs.getInt("c_name"));
					cb.setC_end_day(rs.getString("c_end_day"));
					couponlist.add(cb);
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
		 return couponlist;
	 }//end list
	
	public List<CouponBean> getCoupons(String id){
		 List<CouponBean> couponlist = new ArrayList<CouponBean>();
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select * from coupon where c_id=? order by c_num desc";				 				 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);			
				rs = pstmt.executeQuery();
				
				while(rs.next()){					 
					CouponBean cb = new CouponBean();
					cb.setC_id(rs.getString("c_id"));
					cb.setC_num(rs.getInt("c_num"));					
					cb.setC_name(rs.getInt("c_name"));
					cb.setC_end_day(rs.getString("c_end_day"));
					couponlist.add(cb);
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
		 return couponlist;
	 }//end list
	
	public void insertCoupon(CouponBean cb){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
			 con = getConnection();
			 sql="insert into coupon (c_id,c_num,c_name,c_end_day) values(?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cb.getC_id()); 
			pstmt.setInt(2,cb.getC_num()); 
			pstmt.setInt(3, cb.getC_name()); 
			pstmt.setString(4, cb.getC_end_day()); 
			
			pstmt.executeUpdate();
		} catch(Exception e) {
				//예외 생기면 변수 e에 저장
				//예외를 잡아서 처리 -> 메시지 출력
				e.printStackTrace();
				}finally{
					//예외가 발생하든 말든 상관없이 마무리작업
					//객체 기억장소 마무리
					if(pstmt!=null){
						try{pstmt.close();						
						}catch(SQLException e){
							e.printStackTrace();
						}
					 }
						if(con!=null){
							try{con.close();
							}catch(SQLException e){
								e.printStackTrace();
							 }
							}
				}
		}//insertCoupon() 메서드

	public void deleteCoupon(int c_num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql b_num 에 해당하는 장바구니 삭제
			sql="delete from coupon where c_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c_num);
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}//end deleteCoupon
	
	
}
