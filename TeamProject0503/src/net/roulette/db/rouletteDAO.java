package net.roulette.db;

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

public class rouletteDAO {
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public List<Double> getChances(String id){	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List chancelist = new ArrayList<Integer>();
		double ten = 0; /*10프로 쿠폰 확률*/
		double fif = 0; /*50프로 쿠폰 확률*/
		double hun = 0; /*100프로 쿠폰 확률*/
		try {
			con=getConnection();
			/*오늘 당첨된 사실이 있는지 확인하기*/
			sql="select * from roulette where ro_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			/*오늘 당첨된 사실이 없으면*/
			if(!rs.next()){
				/*10프로 쿠폰 재고 있는지 확인하기 */
				sql="select ro_count from roulette where ro_name='10% 쿠폰' order by ro_count";
				pstmt=con.prepareStatement(sql);			
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("ro_count")>0) {ten = 0.1;}													
				}
				
				/*50프로 쿠폰 재고 있는지 확인하기 */
				sql="select ro_count from roulette where ro_name='50% 쿠폰' order by ro_count";
				pstmt=con.prepareStatement(sql);			
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("ro_count")>0) {fif = 0.05;}													
				}
				
				/*100프로 쿠폰 재고 있는지 확인하기 */
				sql="select ro_count from roulette where ro_name='100% 쿠폰' order by ro_count";
				pstmt=con.prepareStatement(sql);			
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					if(rs.getInt("ro_count")>0) {hun = 0.01;}													
				}
				
			}//end if
			
			chancelist.add(ten);
			chancelist.add(fif);
			chancelist.add(hun);
			
		} catch (Exception e) {			
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return chancelist;
	}//end getchances
	
	public void downRoulette(String id, String c_name){
		int count=0;
		Connection con=null;
		String sql =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			con=getConnection();
			
		sql="select max(ro_count) as max from roulette where ro_name=?";
		 pstmt= con.prepareStatement(sql);
		 pstmt.setString(1, c_name);
		 rs= pstmt.executeQuery();
		if(rs.next()){
			count = rs.getInt("max")-1;		
		}
		
		sql="insert into roulette(ro_name,ro_count,ro_id) values(?,?,?)";
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, c_name);
		pstmt.setInt(2, count);
		pstmt.setString(3, id);
		pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {};
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			
		}
	}//end down
	
	public void rouletteReset(){
		Connection con=null;
		String sql =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			con=getConnection();
									
		sql="delete from roulette where ro_num>3";
		pstmt= con.prepareStatement(sql);		
		pstmt.executeUpdate();
		
		sql="alter table roulette AUTO_INCREMENT=4";
		pstmt= con.prepareStatement(sql);		
		pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {};
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			
		}
	}//end reset
}
