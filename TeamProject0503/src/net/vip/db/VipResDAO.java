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

public class VipResDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	//insertVipRes
	public void insertVipRes(VipResBean vipresbean){
		Connection con = null;
		String sql=null;
		PreparedStatement pstmt =null;

		try{	
			con=getConnection();
			
			sql="insert into vip_reservation (v_num, vr_id, vr_seat_num) values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, vipresbean.getV_num());
			pstmt.setString(2, vipresbean.getVr_id());
			pstmt.setString(3, vipresbean.getVr_seat_num());

			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
			if(con!=null)try{con.close();}catch(SQLException ex){};
		}
	}//insertVipRes



	//insertVipSeatTaken
	public void insertVipSeatTaken(String v_num, String vr_seat_num){
		Connection con = null;
		String sql=null;
		PreparedStatement pstmt =null;
	
		try{	
				con=getConnection();
				
			
				sql="UPDATE vip_seat SET v_seatSelected=?, v_num=? WHERE v_seatNum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "1");
				pstmt.setString(2, v_num);
				pstmt.setString(3, vr_seat_num);
				
				pstmt.executeUpdate();
				
				
			
		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
			if(con!=null)try{con.close();}catch(SQLException ex){};
		}
	}//insertVipSeatTaken
	
	
	//getVipSeatTakenList
	public List getVipSeatTakenList(){
		List VipSeatTakenList=new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		try{
			con=getConnection();
			
			sql="select*from vip_seat";
			/*sql="select*from vip_seat where v_seatSelected=0";*/
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				VipResBean vipresbean = new VipResBean();
				
				vipresbean.setV_seatNum(rs.getString("v_seatNum"));
				vipresbean.setV_seatSelected(rs.getString("v_seatSelected"));
				vipresbean.setV_num(rs.getString("v_num"));

				VipSeatTakenList.add(vipresbean);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return VipSeatTakenList;
	}//getVipSeatTakenList

	
	
	
	
	
	
	
}
