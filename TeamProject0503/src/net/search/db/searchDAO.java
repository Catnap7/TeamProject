package net.search.db;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class searchDAO {
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
/*	//getBoardList
			public List<BoardBean> getBoardList(String search, int startRow, int pageSize){//괄호 안의 것을 안 썼다.
				
				List<BoardBean> boardList=new ArrayList<BoardBean>();
				Connection con = null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="";
				
				try{
					con=getConnection();
					
					sql="select*from board where subject like ? order by num desc limit ?,?"; 
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, "%"+search+"%");
					pstmt.setInt(2,startRow-1);  
					pstmt.setInt(3, pageSize); 
					rs=pstmt.executeQuery();
					
					
					while(rs.next()){
						BoardBean bb=new BoardBean();
						bb.setNum(rs.getInt("num"));
						bb.setSubject(rs.getString("subject"));
						bb.setName(rs.getString("name"));
						bb.setContent(rs.getString("content"));
						bb.setDate(rs.getDate("date"));
						bb.setReadcount(rs.getInt("readcount"));
						bb.setFile(rs.getString("file"));
						boardList.add(bb);
					}

				}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(pstmt!=null){
						try{
						pstmt.close();
						}catch(SQLException ex){}
					}
					
					if(con!=null){
						try{
							con.close();
						}catch(SQLException ex){}
					}
				}
				return boardList;
			}//getboardlist
*/	
	
	
	
	
	
}
