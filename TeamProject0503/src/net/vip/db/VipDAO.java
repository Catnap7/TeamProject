package net.vip.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class VipDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	//insertVip
		public void insertVip(VipBean vipbean){
			Connection con = null;
			String sql=null;
			PreparedStatement pstmt =null;
			ResultSet rs=null;
			int num=0;
			try{
				con=getConnection();

				sql="select max(v_num) from vip_cinema_prev";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
					if(rs.next()){
						num=rs.getInt(1)+1;
					}else{
						num=1;
					}
					
				sql="insert into vip_cinema_prev (v_num, v_kor_title, v_eng_title, v_year, v_country, v_age, v_genre, v_time, v_director, v_actor, v_story, v_video, v_date, v_when) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, vipbean.getV_kor_title());
				pstmt.setString(3, vipbean.getV_eng_title());
				pstmt.setInt(4, vipbean.getV_year());
				pstmt.setString(5, vipbean.getV_country());
				pstmt.setInt(6, vipbean.getV_age());
				pstmt.setString(7, vipbean.getV_genre());
				pstmt.setInt(8, vipbean.getV_time());
				pstmt.setString(9, vipbean.getV_director());
				pstmt.setString(10, vipbean.getV_actor());
				pstmt.setString(11, vipbean.getV_story());
				pstmt.setString(12, vipbean.getV_video());
				pstmt.setString(13, vipbean.getV_date());
				pstmt.setString(14, vipbean.getV_when());
				
				pstmt.setString(15, vipbean.getV_critic_1_by());
				pstmt.setString(16, vipbean.getV_critic_1());
				pstmt.setString(17, vipbean.getV_critic_2_by());
				pstmt.setString(18, vipbean.getV_critic_2());
			
				
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){};
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
				if(con!=null)try{con.close();}catch(SQLException ex){};
			}
		}//insertVip
	
		
	//getVipMovieCount	
	public int getVipMovieCount(){
			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int count = 0;		
			try {
				con = getConnection();
				sql = "select count(*) from vip_cinema_prev";
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
	}//getVipMovieCount
		
		
		
	//getVipMovieList
	public List<VipBean> getVipMovieList(int startRow, int pageSize){
		List<VipBean> vipMovieList=new ArrayList<VipBean>();
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		try{
			con=getConnection();
			sql="select*from vip_cinema_prev order by v_num asc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				VipBean vipbean = new VipBean();
				
				vipbean.setV_num(rs.getInt("v_num"));
				vipbean.setV_kor_title(rs.getString("v_kor_title"));
				vipbean.setV_eng_title(rs.getString("v_eng_title"));
				vipbean.setV_year(rs.getInt("v_year"));
				vipbean.setV_country(rs.getString("v_country"));
				vipbean.setV_age(rs.getInt("v_age"));
				vipbean.setV_genre(rs.getString("v_genre"));
				vipbean.setV_time(rs.getInt("v_time"));
				vipbean.setV_director(rs.getString("v_director"));
				vipbean.setV_actor(rs.getString("v_actor"));
				vipbean.setV_story(rs.getString("v_story"));
				vipbean.setV_video(rs.getString("v_video"));
				vipbean.setV_date(rs.getString("v_date"));
				vipbean.setV_when(rs.getString("v_when"));
				vipbean.setV_critic_1_by(rs.getString("v_critic_1_by"));
				vipbean.setV_critic_1(rs.getString("v_critic_1"));
				vipbean.setV_critic_2_by(rs.getString("v_critic_2_by"));
				vipbean.setV_critic_2(rs.getString("v_critic_2"));
				
				vipMovieList.add(vipbean);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return vipMovieList;
	}//getVipMovieList
	
	
	
		
		
	//getVipMovie
		public VipBean getVipMovie(){
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql=null;
			VipBean vipbean=null;
			int max=0;
			
			try{
				con=getConnection();
				
				sql="select max(v_num) as max from vip_cinema_prev";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				
				if(rs.next()){
					max=rs.getInt("max");	
				}

				sql="select * from vip_cinema_prev where v_num=?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, max);
				
				
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					vipbean=new VipBean();
					vipbean.setV_num(rs.getInt("v_num"));
					vipbean.setV_kor_title(rs.getString("v_kor_title"));
					vipbean.setV_eng_title(rs.getString("v_eng_title"));
					vipbean.setV_year(rs.getInt("v_year"));
					vipbean.setV_country(rs.getString("v_country"));
					vipbean.setV_age(rs.getInt("v_age"));
					vipbean.setV_genre(rs.getString("v_genre"));
					vipbean.setV_time(rs.getInt("v_time"));
					vipbean.setV_director(rs.getString("v_director"));
					vipbean.setV_actor(rs.getString("v_actor"));
					vipbean.setV_story(rs.getString("v_story"));
					vipbean.setV_video(rs.getString("v_video"));
					vipbean.setV_date(rs.getString("v_date"));
					vipbean.setV_when(rs.getString("v_when"));
					
					vipbean.setV_critic_1_by(rs.getString("v_critic_1_by"));
					vipbean.setV_critic_1(rs.getString("v_critic_1"));
					vipbean.setV_critic_2_by(rs.getString("v_critic_2_by"));
					vipbean.setV_critic_2(rs.getString("v_critic_2"));
					
				}	
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null)try{con.close();}catch(SQLException ex){}
			}
			return vipbean;
		}//getVipMovie
		
		
	
		//resetVipSeat
		public void resetVipSeat(){
			Connection con = null;
			String sql=null;
			PreparedStatement pstmt =null;
		
			try{	
					con=getConnection();
					
				
					sql="UPDATE vip_seat SET v_seatSelected=?, v_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, "0");
					pstmt.setString(2, "0");
					
					pstmt.executeUpdate();
					

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
				if(con!=null)try{con.close();}catch(SQLException ex){};
			}
		}

		//AutoselectVIP
		public void AutoselectVip(){
			Connection con = null;
			String sql=null;
			PreparedStatement pstmt =null;
			ResultSet rs=null;
			try{
				con=getConnection();
				sql="update member m join review r "
						+ "on m.m_id = r.r_id"
						+ "set m.m_grade=2"
						+ "where m.m_grade in("
						+ "select * from ("
						+ "select distinct m_grade "
						+ "from review join member"
						+ "on review.r_id = member.m_id"
						+ "group by r_id"
						+ "order by r_recommand desc limit 10) as lim"
						+ ")";
				pstmt=con.prepareStatement(sql);
				pstmt.executeQuery();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null)try{con.close();}catch(SQLException ex){}
			}
		}
		//AutoselectVIPend
		
		
		//AutodeleteVip
		public void AutodeleteVip(){
			Connection con = null;
			String sql=null;
			PreparedStatement pstmt =null;
			ResultSet rs=null;
			try{
				con=getConnection();
				sql="update member m join review r "
						+ "on m.m_id = r.r_id"
						+ "set m.m_grade=1"
						+ "where m.m_grade in("
						+ "select * from ("
						+ "select distinct m_grade "
						+ "from review join member"
						+ "on review.r_id = member.m_id"
						+ "group by r_id"
						+ "order by r_recommand desc limit 10) as lim"
						+ ")";
				pstmt=con.prepareStatement(sql);
				pstmt.executeQuery();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null)try{con.close();}catch(SQLException ex){}
			}
		}
		//AutodeleteVIPend
		}
