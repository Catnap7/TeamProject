package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	
private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		//자원의 이름 불러오기 자원위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con= ds.getConnection();
		return con;
		
}
	public void  insertMember(MemberBean memberbean) {
	 Connection con = null;
	 String sql =null;
	 PreparedStatement pstmt =null;
	 try {
		con=getConnection();
		
		sql = "insert into member(m_id, m_pass, m_name,m_id_num1,m_id_num2,m_pay,m_grade, m_reg_date) values(?,?,?,?,?,?,?,?)";
		 pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberbean.getM_id());			
		pstmt.setString(2, memberbean.getM_pass());		
		pstmt.setString(3, memberbean.getM_name());	
		pstmt.setInt(4, memberbean.getM_id_num1());	
		pstmt.setInt(5, memberbean.getM_id_num2());	
		pstmt.setInt(6, 0);	//pay
		pstmt.setInt(7, 0); //grade	
		pstmt.setDate(8, memberbean.getM_reg_date());
		pstmt.executeUpdate();
	}catch(Exception e) {
		//예외를 잡아서 처리 --> 메세지 출력 
		e.printStackTrace();
		
	}finally {
		//예외가 발생하든 말든 상관없이 마무리작업
		//객체 기억장소 마무리
		if(con!=null)try {con.close();}catch(SQLException ex) {};
		if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
	}
	
 }//insertMember() 메서드

	public int idcheck(String m_id) {
		int check =0;
		Connection con=null;
		String sql =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			con=getConnection();
			
		sql="select * from member where m_id = ?";
		 pstmt= con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		 rs= pstmt.executeQuery();
		if(rs.next()){
			if(m_id.equals(rs.getString("m_id"))){
				check=1;
			}else {
				check=0;
			}
		
		}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {};
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			
		}return check;
	}
	
	public int userCheck(String m_id,String m_pass) {
		int check =3;
		Connection con=null;
		String sql =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			con=getConnection();
			
		sql="select * from member where m_id=?";
		 pstmt= con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		 rs= pstmt.executeQuery();
		if(rs.next()){
			if(m_pass.equals(rs.getString("m_pass"))){
				check=1;
			}else {
				check=0;
			}
		}else {
			check=-1;
		}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			if(rs!=null)try {rs.close();}catch(SQLException ex) {};
			
		}return check;
	}
	
	public MemberBean getMember(String m_id) {
		MemberBean memberbean = null;
		String sql =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		Connection con = null;
		try {
			con=getConnection();
			
			sql = "select * from member where m_id=?"; 
			 pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberbean = new MemberBean(); //자바빈 객체생성
				memberbean.setM_id(rs.getString("m_id"));  
				memberbean.setM_pass(rs.getString("m_pass"));  
				memberbean.setM_name(rs.getString("m_name"));  
				memberbean.setM_grade(rs.getInt("m_grade"));  
				memberbean.setM_reg_date(rs.getDate("m_reg_date"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
			if(rs!=null)try {rs.close();}catch(SQLException ex) {};
		}
		
		return memberbean;
	
	}
	
	public int EmailChecked(String m_id){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int Echeck=0;
		String sql ="";
		Connection con = null;
		try {
			con=getConnection();
			sql = "SELECT m_grade FROM member WHERE m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
						if(rs.getInt("m_grade")==1 ||rs.getInt("m_grade")==2) {
							Echeck=1;
						}else {
							Echeck=0;
						}
			}

		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Echeck;
	}

	public void setUserEmailChecked(String m_id) {
		PreparedStatement pstmt = null;
		String sql =null;
		Connection con = null;
		try {
			con=getConnection();
			sql = "update member SET m_grade=? WHERE m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "1");
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
		}
	}

	public void passUpdateMember(String m_pass,String m_id){			
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		try{con = getConnection();
		sql="update member set m_pass=? where m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,m_pass);
		pstmt.setString(2,m_id);
		pstmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
			}finally{
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
	}//end  of passUpdateMember
	public String connectEmail(String m_id){
		String to1=m_id; // 
		String host="smtp.naver.com"; // 
		String subject="임시비밀번호 발급"; // 
		String fromName="관리자"; // 
		String from="lhw4417@naver.com"; 
		String authNum=authNum(); // 
		String content="임시비밀번호 발급 ["+authNum+"]"; //         
		try{
			passUpdateMember(authNum,to1);
		Properties props=new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host);
		props.setProperty
                       ("mail.smtp.socketFactory.class",
                        "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.port","587");
		props.put("mail.smtp.user",from);
		props.put("mail.smtp.auth","true");
		
		Session mailSession 
           = Session.getInstance(props,new javax.mail.Authenticator(){
			    protected PasswordAuthentication getPasswordAuthentication(){
				    return new PasswordAuthentication
                                        ("lhw4417","dnjsWld53"); // naver�④쑴�젟
			}
		});
		
		Message msg = new MimeMessage(mailSession);
		InternetAddress []address1 = {new InternetAddress(to1)};
		msg.setFrom(new InternetAddress
                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
		msg.setRecipients(Message.RecipientType.TO, address1); // 獄쏆룆�뮉占쎄텢占쎌뿺 占쎄퐬占쎌젟
		msg.setSubject(subject); 
		msg.setSentDate(new java.util.Date());
		msg.setContent(content,"text/html; charset=utf-8"); // 占쎄땀占쎌뒠占쎄퐬占쎌젟
		
		Transport.send(msg); 
		}catch(MessagingException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return authNum;
	}

	public static String authNum(){
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=4;i++){
			int num=(int)(Math.random()*9+1);
			buffer.append(num);
		}
		return buffer.toString();
	} //end of authNum()
	
	
}

	
	
	
	

	
	
	
	
	

