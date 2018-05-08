package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		
		sql = "insert into member(m_id, m_pass, m_name,m_id_num1,m_id_num2,m_pay,m_reg_date) values(?,?,?,?,?,?,?)";
		 pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberbean.getM_id());			
		pstmt.setString(2, memberbean.getM_pass());		
		pstmt.setString(3, memberbean.getM_name());	
		pstmt.setInt(4, memberbean.getM_id_num1());	
		pstmt.setInt(5, memberbean.getM_id_num2());	
		pstmt.setInt(6, 0);	//pay
		pstmt.setDate(7, memberbean.getM_reg_date());
		
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
			
		sql="select * from member where m_id = ?";
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
				//자바빈 멤버변수 id=rs.getString("id");
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
		MemberBean memberbean = null;
		try {
			con=getConnection();
			sql = "SELECT m_grade FROM member WHERE m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
						if(rs.getInt("m_grade")==1) {
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
}
/*
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
			//占쎌굙占쎌뇚 占쎄문疫꿸퀡�늺 癰귨옙占쎈땾 e占쎈퓠 占쏙옙占쎌삢
			//占쎌굙占쎌뇚�몴占� 占쎌삜占쎈툡占쎄퐣 筌ｌ꼶�봺 -> 筌롫뗄�뻻筌욑옙 �빊�뮆�젾
			e.printStackTrace();
			}finally{
				//占쎌굙占쎌뇚揶쏉옙 獄쏆뮇源�占쎈릭占쎈군 筌띾Ŧ諭� 占쎄맒�꽴占쏙옙毓억옙�뵠 筌띾뜄龜�뵳�딆삂占쎈씜 => 疫꿸퀣堉뀐옙�삢占쎈꺖 占쎌젟�뵳占�
				//揶쏆빘猿� 疫꿸퀣堉뀐옙�삢占쎈꺖 筌띾뜄龜�뵳占�
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
			}*/
	//end updateMember
/*	public String connectEmail(String m_id){
		String to1=m_id; // 
		String host="smtp.naver.com"; // 
		String subject="임시비밀번호 발급"; // 
		String fromName="관리자"; // 
		String from="lhw4417@naver.com"; 
		String authNum=EmailConfirm.authNum(); // 
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
				    return new PasswordAuthentication("lhw4417","dnjsWld53"); // naver�④쑴�젟
			}
		});
		
		Message msg = new MIMEMessage(mailSession);
		InternetAddress []address1 = {new InternetAddress(to1)};
		msg.setFrom(new InternetAddress
                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
		msg.setRecipients(Message.RecipientType.TO, address1); // 獄쏆룆�뮉占쎄텢占쎌뿺 占쎄퐬占쎌젟
		msg.setSubject(subject); // 占쎌젫筌뤴뫗苑뺧옙�젟
		msg.setSentDate(new java.util.Date()); // 癰귣�沅∽옙�뮉 占쎄텊筌욑옙 占쎄퐬占쎌젟
		msg.setContent(content,"text/html; charset=utf-8"); // 占쎄땀占쎌뒠占쎄퐬占쎌젟
		
		Transport.send(msg); // 筌롫뗄�뵬癰귣�沅→묾占�
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
	}
}*/
