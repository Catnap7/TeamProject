package net.pay.db;

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
import net.mypage.db.CouponBean;

public class PayDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
	}
	
	public int getAdminPayCount(){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from payment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("count(*)");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}						
		}
		return count;
	}//End getAdminPaymentCount()
	
	public List<PayBean> getAdminPayList(int startRow, int pageSize) {
		List<PayBean> lpb = new ArrayList<PayBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from payment order by p_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				PayBean paybean = new PayBean();
				paybean.setP_auto(rs.getString("p_auto"));
				paybean.setP_charge(rs.getInt("p_charge"));
				paybean.setP_end_day(rs.getDate("p_end_day"));
				paybean.setP_id(rs.getString("p_id"));
				paybean.setP_num(rs.getInt("p_num"));
				paybean.setP_start_day(rs.getDate("p_start_day"));
				lpb.add(paybean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}				
		}
		return lpb;
	}//End getAdminMemberList
	

	
	
	
	
	
	
	

	//결제 내역 리스트 들고오기
	public List getPayList(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List paylist=new ArrayList();
		
		try {
			con=getConnection();
			
			sql="select * from payment where p_id=? order by p_start_day desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){	
				PayBean paybean= new PayBean();
				paybean.setP_id(rs.getString("p_id"));
				paybean.setP_start_day(rs.getDate("p_start_day"));
				paybean.setP_end_day(rs.getDate("p_end_day"));
				paybean.setP_auto(rs.getString("p_auto"));
				paybean.setP_charge(rs.getInt("p_charge"));
				paylist.add(paybean);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return paylist;
	}
	
	public List<PayBean> getPayList(String id, int startRow, int pageSize){
		 List<PayBean> paylist = new ArrayList<PayBean>();
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select * from payment where p_id=? order by p_num desc limit ?,?";				 				 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				
				while(rs.next()){					 
					PayBean paybean = new PayBean();
					paybean.setP_id(rs.getString("p_id"));
					paybean.setP_start_day(rs.getDate("p_start_day"));
					paybean.setP_end_day(rs.getDate("p_end_day"));
					paybean.setP_auto(rs.getString("p_auto"));
					paybean.setP_charge(rs.getInt("p_charge"));
					paylist.add(paybean);
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
		 return paylist;
	 }//end list

	
	//현재 이용권이 존재하는지.
	//이용권 저장하고 동작하는지 다시 확인
	public PayBean getCurrentPay(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		PayBean paybean=null;
		
		try {
			con=getConnection();
			
			sql="select * from payment where p_id=? and date(p_end_day)>=CURDATE()";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){	

				paybean=new PayBean();
				paybean.setP_id(rs.getString("p_id"));
				paybean.setP_start_day(rs.getDate("p_start_day"));
				paybean.setP_end_day(rs.getDate("p_end_day"));
				paybean.setP_auto(rs.getString("p_auto"));
				paybean.setP_charge(rs.getInt("p_charge"));
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return paybean;
	}
	
	
	
	//이용권 구매
	public void insertPay(PayBean paybean) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();
			
			sql="insert into payment (p_id,p_start_day,p_end_day,p_auto,p_charge) values(?,CURDATE()+0,CURDATE()+100,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, paybean.getP_id());
			pstmt.setString(2, paybean.getP_auto());
			pstmt.setInt(3, paybean.getP_charge());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}	
	
	
	
	//멤버의 mpay를 변경 updateMpay()
	public void updateMpaytoOne(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();

			sql="update member set m_pay=? where m_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "1");
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}	
	
	//멤버의 mpay를 변경 updateMpay()
	public void updateMpaytoZero(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();

			sql="update member set m_pay=? where m_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "0");
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}	
	
	
	//중복결제 방지. m_pay값 들고오기
	public int getMpay(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int m_pay=0;
		try {
			con=getConnection();

			sql="select m_pay from member where m_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()){
				m_pay=rs.getInt("m_pay");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return m_pay;
	}	
	
	
	//사용한 쿠폰 삭제 /////////같은종류의 쿠폰은 기간이 먼저 만료되는 쿠폰먼저 사용(강제)
	public void deleteUseCoupon(String id, int c_name) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();

			sql="delete from coupon where c_id=? and c_name=? order by c_end_day asc limit 1";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, c_name);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}	
	
	//정기결제 해지하기
	public void payCancel(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();

			sql="update payment set p_auto='해지' where p_id=? and p_end_day>=curdate() and p_auto='정기'";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}	
	
	
	
	
	
	
	
	
	
	
	//정기결제(만료 다음날00시00분에 정기결제자 전부 자동으로 결제되게 )
	public void autoInsertPay() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();
			
			sql="insert into payment (p_id,p_start_day,p_end_day,p_auto,p_charge) select p_id,CURDATE()+0 ,CURDATE()+100,p_auto,4900 from payment where p_auto='정기' and p_end_day=CURDATE()-1";
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	
	
	
	//한달결제 만료자, 해지하는 사람 m_pay조정
	public void autoUpdateMpaytoZero() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			con=getConnection();
			//sql구문 수정해야한다.
			sql="update member set m_pay=0 where m_id in (select p_id from payment	where p_auto in('한달','해지') and p_end_day=CURDATE()-1)";
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	public int getPayListCount(String id){
		 Connection con=null;
		 String sql="";
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 int count = 0;
		 try{ //예외가 발생할 것 같은 명령, 	필수적으로 외부파일접근, 디비접근
				con = getConnection();
				sql="select count(*) as count from payment where p_id=?";				 				 
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
