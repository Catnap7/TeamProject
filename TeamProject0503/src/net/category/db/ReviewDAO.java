package net.category.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.member.db.MemberBean;

public class ReviewDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
public int getReviewCount(int mv_num) {
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count = 0;
		
		try {
			con = getConnection();
			sql = "select count(*) as count from review where r_p_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mv_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException e){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
			if(con!=null)try{con.close();}catch(SQLException e){};
		}
		
		return count;
	}	// 댓글수
	
public int getReviewCount(String m_id) {
	
	Connection con=null;
	String sql="";
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int reviewcount = 0;
	
	try {
		con = getConnection();
		sql = "select count(*) as count from review where r_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			reviewcount = rs.getInt("count");
		}
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	} finally {
		if(rs!=null)try{rs.close();}catch(SQLException e){};
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
		if(con!=null)try{con.close();}catch(SQLException e){};
	}
	
	return reviewcount;
}	// 아이디에 따른 댓글수

	public List checkReview(String r_id, int r_p_num) {
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List checkList = new ArrayList();
		ReviewBean reviewbean = new ReviewBean();
		
		try {
			con = getConnection();
			sql = "select * from review where r_id = ? and r_p_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r_id);
			pstmt.setInt(2, r_p_num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				reviewbean.setR_num(rs.getInt("r_num"));
				checkList.add(reviewbean.getR_num());
				checkList.add(1);
			}else {
				checkList.add(reviewbean.getR_num());
				checkList.add(0);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException e){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
			if(con!=null)try{con.close();}catch(SQLException e){};
		}
		
		return checkList;
	}	// 댓글 중복 확인
	
	public void insertReview(ReviewBean reviewbean) {
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int r_num = reviewbean.getR_num();
		
		try {
			con = getConnection();
			sql = "select max(r_num) as r_num from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				r_num = rs.getInt(1)+1;
			}else {
				r_num = 1;
			}
			
			sql = "insert into review(r_num,r_id,r_p_num,r_recommand,r_content,r_report,r_date) values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setString(2, reviewbean.getR_id());
			pstmt.setInt(3, reviewbean.getR_p_num());
			pstmt.setInt(4, reviewbean.getR_recommand());
			pstmt.setString(5, reviewbean.getR_content());
			pstmt.setInt(6, reviewbean.getR_report());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException e){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){};
			if(con!=null)try{con.close();}catch(SQLException e){};
		}
	}	// 댓글 입력
	
	public Vector getReview(int mv_num, int startRow, int pageSize) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		
		Vector vector=new Vector();//////////////////////
		List reviewList = new ArrayList();
		List memberName = new ArrayList();//////////////
		try {
			con=getConnection();
			
			
				//sql = "select * from review where r_p_num=?";
				sql = "select * from review rev join member mem on rev.r_id = mem.m_id where r_p_num= ? order by r_recommand desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, mv_num);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBean reviewbean = new ReviewBean();
				reviewbean.setR_num(rs.getInt("r_num"));
				reviewbean.setR_id(rs.getString("r_id"));
				reviewbean.setR_p_num(rs.getInt("r_p_num"));
				reviewbean.setR_recommand(rs.getInt("r_recommand"));
				reviewbean.setR_report(rs.getInt("r_report"));
				reviewbean.setR_content(rs.getString("r_content"));
				reviewbean.setR_date(rs.getTimestamp("r_date"));
				reviewList.add(reviewbean);
				MemberBean memberbean = new MemberBean();///////////
				memberbean.setM_name(rs.getString("m_name"));///////////
				memberName.add(memberbean);
				
				vector.add(reviewList);
				vector.add(memberName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return vector;
	}	// 댓글 리스트
	
	public void deleteReview(int r_num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		
		try {
			con = getConnection();
			
			sql = "delete from review where r_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}	// 댓글 삭제
	
	
	
	public void updateReview(ReviewBean reviewbean) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		
		try {
			con = getConnection();
			
			sql = "update review set r_content = ? where r_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewbean.getR_content());
			pstmt.setInt(2, reviewbean.getR_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}	// 댓글 수정
	
	public void recommandReview(int r_num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		
		try {
			con = getConnection();
			
			sql = "update review set r_recommand = r_recommand+1 where r_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}	// 댓글 추천
	
	public void reportReview(int r_num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		
		try {
			con = getConnection();
			
			sql = "update review set r_report = r_report+1 where r_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}	// 댓글 신고

	public Vector dateSortReview(int mv_num, int startRow, int pageSize) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		Vector vector=new Vector();//////////////////////
		List reviewList = new ArrayList();
		List memberName = new ArrayList();//////////////
		System.out.println("\t"+"ReviewDAO dateSortReview()");
		try {
			con=getConnection();
			
				//sql = "select * from review where r_p_num=?";
				sql = "select * from review rev join member mem on rev.r_id = mem.m_id where r_p_num= ? order by r_date desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, mv_num);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBean reviewbean = new ReviewBean();
				reviewbean.setR_num(rs.getInt("r_num"));
				reviewbean.setR_id(rs.getString("r_id"));
				reviewbean.setR_p_num(rs.getInt("r_p_num"));
				reviewbean.setR_recommand(rs.getInt("r_recommand"));
				reviewbean.setR_report(rs.getInt("r_report"));
				reviewbean.setR_content(rs.getString("r_content"));
				reviewbean.setR_date(rs.getTimestamp("r_date"));
				reviewList.add(reviewbean);
				MemberBean memberbean = new MemberBean();///////////
				memberbean.setM_name(rs.getString("m_name"));///////////
				memberName.add(memberbean);
				
				vector.add(reviewList);
				vector.add(memberName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return vector;
	}	// 최신순 정렬 
	
}








