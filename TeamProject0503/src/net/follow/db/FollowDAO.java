package net.follow.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Vector;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.admin.manage.db.MovieBean;
import net.category.db.ReviewBean;
import net.favorite.db.FavoriteBean;
import net.member.db.MemberBean;

public class FollowDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public int Followercount(String m_id){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int followercount = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from follow where fo_following=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				followercount = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}						
		}
		return followercount;
	}
	public int Followingcount(String m_id){
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int followingcount = 0;		
		try {
			con = getConnection();
			sql = "select count(*) from follow where fo_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				followingcount = rs.getInt("count(*)");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}						
		}
		return followingcount;
	}
	
	
	// 팔로잉 리스트
	public Vector followingList(String m_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Vector vector= new Vector();
		List<FollowBean> f_followingList = new ArrayList<FollowBean>();
		List<MemberBean> m_followingList = new ArrayList<MemberBean>();
		
		try {
			con=getConnection();

			sql="select f.fo_following, m.m_pic, m.m_name from follow f join member m on f.fo_following = m.m_id where fo_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FollowBean fbean = new FollowBean();
				MemberBean mbean = new MemberBean();
				
				fbean.setFo_following(rs.getString("fo_following"));
				mbean.setM_pic(rs.getInt("m_pic"));
				mbean.setM_name(rs.getString("m_name"));
				
				f_followingList.add(fbean);
				m_followingList.add(mbean);
			}
			vector.add(f_followingList);
			vector.add(m_followingList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return vector;
	}	// 팔로잉 리스트
	
	// 팔로워 리스트
	public Vector followerList(String m_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Vector vector= new Vector();
		List<FollowBean> f_followerList = new ArrayList<FollowBean>();
		List<MemberBean> m_followerList = new ArrayList<MemberBean>();
		
		try {
			con=getConnection();

			sql="select f.fo_id, m.m_pic, m.m_name from follow f join member m on f.fo_id = m.m_id where fo_following = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FollowBean fbean = new FollowBean();
				MemberBean mbean = new MemberBean();
				
				fbean.setFo_id(rs.getString("fo_id"));
				mbean.setM_pic(rs.getInt("m_pic"));
				mbean.setM_name(rs.getString("m_name"));
				
				f_followerList.add(fbean);
				m_followerList.add(mbean);
			}
			vector.add(f_followerList);
			vector.add(m_followerList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return vector;
	}	// 팔로워 리스트	
	
	// 팔로워 리스트 언팔
		public void deleteFollower(String m_id, String f_id) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			
			try {
				con=getConnection();

				sql="delete from follow where fo_id = ? and fo_following = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_id);
				pstmt.setString(2, f_id);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
			}
		}	// 팔로워 리스트 언팔
		
		// 팔로워 리스트 팔로잉
			public void insertFollower(String m_id, String f_id) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="";
				
				try {
					con=getConnection();

					sql="insert into follow values(?, ?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_id);
					pstmt.setString(2, f_id);
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
					if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
					if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
				}
			}	// 팔로워 리스트 팔로잉
		
		// 팔로잉 체크
			public List<Integer> followingCheck(String m_id, String following_id) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="";
				int check = 0;
				List<Integer> followingCheckList = new ArrayList<>();
				System.out.println("내 아이디 "+m_id);
				System.out.println("받아온 팔로워 아이디 "+following_id);
				try {
					con=getConnection();

					sql="select fo_id, fo_following from follow where fo_id = ? and fo_following = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_id);
					pstmt.setString(2, following_id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						check = 1; // 이미 팔로우 하고있으면 1
						followingCheckList.add(1);
					}else {
						check = 0; // 아니면 0
						followingCheckList.add(0);
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
					if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
					if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
				}
				
				return followingCheckList;
			}	// 팔로잉 체크
		
		// 팔로워 체크
		public List<Integer> followCheck(String m_id, String f_id) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			int check = 0;
			List<Integer> followCheckList = new ArrayList<>();
			System.out.println("내 아이디 "+m_id);
			System.out.println("받아온 팔로워 아이디 "+f_id);
			try {
				con=getConnection();

//				sql="select m.fo_id, m.fo_following, f.fo_id, f.fo_following from follow m join follow f on m.fo_id = f.fo_following where m.fo_id = ? and m.fo_following = ? and f.fo_id = ?";
				sql="select fo_id, fo_following from follow where fo_id = ? and fo_following = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_id);
				pstmt.setString(2, f_id);
//				pstmt.setString(3, f_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					check = 1; // 내 팔로워 중 내가 팔로잉 하는 사람이 있으면 1(언팔로우)
					followCheckList.add(1);
				}else {
					check = 0; // 아니면 0
					followCheckList.add(0);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
			}
			
			return followCheckList;
		}	// 팔로워 체크
	

	//followfavorite
		public List followfavorite(String id){
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			List movieList=new ArrayList();
			try {
				con=getConnection();

				sql="select * from favorite f join movie m on f.f_num=m.mv_num where f_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					MovieBean moviebean= new MovieBean();
					moviebean.setMv_num(rs.getInt("mv_num"));
					moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
					moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
					moviebean.setMv_genre(rs.getString("mv_genre"));
					moviebean.setMv_year(rs.getInt("mv_year"));
					moviebean.setMv_age(rs.getInt("mv_age"));
					moviebean.setMv_time(rs.getInt("mv_time"));
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

	//followReview
		public Vector followreview(String id){
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			List reviewList=new ArrayList();
			List movieList=new ArrayList();
			Vector vector=new Vector();
			try {
				con=getConnection();

				sql="select * from review r join movie m on r.r_p_num=m.mv_num where r.r_id=? order by r.r_date desc";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					ReviewBean reviewbean= new ReviewBean();
					//왓츄그램 리뷰리스트에서 날짜 포맷 바꿀때 쓸것.
					//Date date=rs.getTimestamp("r_date");

					
					reviewbean.setR_id(rs.getString("r_id"));
					reviewbean.setR_num(rs.getInt("r_num"));
					reviewbean.setR_p_num(rs.getInt("r_p_num"));
					reviewbean.setR_recommand(rs.getInt("r_recommand"));
					reviewbean.setR_report(rs.getInt("r_report"));
					reviewbean.setR_date(rs.getTimestamp("r_date"));
					reviewbean.setR_content(rs.getString("r_content"));
					reviewList.add(reviewbean);
					
					MovieBean moviebean= new MovieBean();
					moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
					movieList.add(moviebean);
				}
				vector.add(reviewList);
				vector.add(movieList);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
			}
			return vector;		
		}
	
	/*public Vector top5followfavorite(String m_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Vector vector= new Vector();
		List<FavoriteBean> top5favoritelist= new ArrayList<FavoriteBean>();
		List<MovieBean> top5movielist2= new ArrayList<MovieBean>();
		try {
			con=getConnection();

			sql= "select * from favorite f join movie m"
					+ "on f.f_num = m.mv_num "
					+ "where f_id = ? order by rand()";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				FavoriteBean favoritebean = new FavoriteBean();
				favoritebean.setF_id(rs.getString("f_id"));
				favoritebean.setF_id(rs.getString("f_num"));
				top5favoritelist.add(favoritebean);
				
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				top5movielist2.add(moviebean);
			}
			vector.add(top5favoritelist);
			vector.add(top5movielist2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return vector;		
	}*/
	public List top5followfavorite(String m_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List<MovieBean> top5favoritelist= new ArrayList<MovieBean>();
		try {
			con=getConnection();

			sql= "select * from favorite f join movie m on f.f_num = m.mv_num where f_id = ? order by rand() limit 6";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
		
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				top5favoritelist.add(moviebean);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return top5favoritelist;		
	}
	

	//followReview
	public Vector top5followreview(String m_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Vector vector= new Vector();
		List<ReviewBean> top5reviewlist= new ArrayList<ReviewBean>();
		List<MovieBean> top5movielist= new ArrayList<MovieBean>();
		
		try {
			con=getConnection();

			sql="select * "
					+ "from review r join movie m "
					+ "on r.r_p_num = m.mv_num "
					+ "where r_id = ?"
					+ " order by r_date desc limit 5";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			
	while(rs.next()){
				
				ReviewBean reviewbean = new ReviewBean();
				reviewbean.setR_num(rs.getInt("r_num"));
				reviewbean.setR_content(rs.getString("r_content"));
				reviewbean.setR_date(rs.getTimestamp("r_date"));
				reviewbean.setR_recommand(rs.getInt("r_recommand"));
				reviewbean.setR_report(rs.getInt("r_report"));
				top5reviewlist.add(reviewbean);
				
				
				MovieBean moviebean= new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
				moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
				moviebean.setMv_genre(rs.getString("mv_genre"));
				moviebean.setMv_year(rs.getInt("mv_year"));
				moviebean.setMv_age(rs.getInt("mv_age"));
				moviebean.setMv_time(rs.getInt("mv_time"));
				top5movielist.add(moviebean);
			}
			vector.add(top5reviewlist);
			vector.add(top5movielist);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return vector;		
	}
	public List timelinelist(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List timelinelist= new ArrayList();
		try {
			con=getConnection();

			sql="select  kind,fo_following,title,engtitle,pic,num,date,genre "
					+ "from (select 'rating' as kind, ra_id as id, ra_date as regdate, mv.mv_kor_title as title ,mv.mv_eng_title as engtitle,m.m_pic as pic,mv.mv_num as num,ra.ra_date as date,mv.mv_genre as genre "
					+ "from rating ra "
					+ "join movie mv "
					+ "on  mv.mv_num=ra.ra_p_num "
					+ "join member m "
					+ "on m.m_id = ra.ra_id "
					+ "union "
					+ "select 'favorite' as kind, f_id as id, f_date as regdate, mv.mv_kor_title as title,mv.mv_eng_title as engtitle ,m.m_pic as pic,mv.mv_num as num,f.f_date as date,mv.mv_genre as genre "
					+ "from favorite f "
					+ "join movie mv "
					+ "on  mv.mv_num=f.f_num "
					+ "join member m "
					+ "on m.m_id = f.f_id "
					+ "union "
					+ "select 'review' as kind, r_id as id, r_date as regdate, mv.mv_kor_title  as title,mv.mv_eng_title as engtitle ,m.m_pic as pic,mv.mv_num as num,r.r_date as date,mv.mv_genre as genre "
					+ "from review r "
					+ "join movie mv "
					+ "on  mv.mv_num=r.r_p_num "
					+ "join member m "
					+ "on m.m_id = r.r_id) a "
					+ "join follow fo "
					+ "on a.id = fo.fo_following "
					+ "where fo.fo_id=? "
					+ "order by regdate desc ";

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				TimeLineBean timelinebean = new TimeLineBean();
				timelinebean.setKind(rs.getString("kind"));
				timelinebean.setFo_following(rs.getString("fo_following"));
				timelinebean.setTitle(rs.getString("title"));
				timelinebean.setEngtitle(rs.getString("engtitle"));
				timelinebean.setGenre(rs.getString("genre"));
				timelinebean.setDate(rs.getTimestamp("date"));
				timelinebean.setNum(rs.getInt("num"));
				timelinebean.setPic(rs.getInt("pic"));
				
				timelinelist.add(timelinebean);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return timelinelist;		
	}
	public Vector TimeLineReview(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Vector vector= new Vector();
		List timelinereview= new ArrayList();
		List timelinemovie = new ArrayList();
		try {
			con=getConnection();

			sql="select mv.mv_num,r.r_content,r.r_id,r.r_date "
					+ "from movie mv join review r "
					+ "on mv.mv_num = r.r_p_num "
					+ "join follow fo "
					+ "on r.r_id = fo.fo_following "
					+ "where fo.fo_id=? "
					+ "order by r.r_date desc;";

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				MovieBean moviebean = new MovieBean();
				moviebean.setMv_num(rs.getInt("mv_num"));
				timelinemovie.add(moviebean);
				ReviewBean reviewbean = new ReviewBean();
				reviewbean.setR_content(rs.getString("r_content"));
				reviewbean.setR_id(rs.getString("r_id"));
				reviewbean.setR_date(rs.getTimestamp("r_date"));
				timelinereview.add(reviewbean);
			}
			vector.add(timelinemovie);
			vector.add(timelinereview);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(con!=null)try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return vector;		
	}
}
