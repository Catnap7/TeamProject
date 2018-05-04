package net.member.action;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.member.db.MemberBean;

import javax.mail.Session;

public class EmailConfirm{
	private Connection getConnection() throws Exception{
		Context init=new InitialContext();
		// 占쎌쁽占쎌뜚占쎌벥 占쎌뵠�뵳占� �겫�뜄�쑎占쎌궎疫뀐옙  占쎌쁽占쎌뜚占쎌맄燁삼옙 java:comp/env 占쎌쁽占쎌뜚占쎌뵠�뵳占� jdbc/Mysql
		//DataSource ds=init.lookup(占쎌쁽占쎌뜚占쎌벥 占쎌맄燁삼옙 占쎌쁽占쎌뜚占쎌벥占쎌뵠�뵳占�);
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
		}
	public void updateMember(String m_pass,String m_id){			
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
			}
	}//end updateMember
	public String connectEmail(String m_id){
		String to1=m_id; // 
		String host="smtp.naver.com"; // 
		String subject="임시비밀번호 발급"; // 
		String fromName="관리자"; // 
		String from="lhw4417@naver.com"; 
		String authNum=EmailConfirm.authNum(); // 
		String content="임시비밀번호 발급 ["+authNum+"]"; //         
		try{
	    updateMember(authNum,to1);
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

    // 占쎄텆占쎈땾獄쏆뮇源� function
	public static String authNum(){
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=4;i++){
			int num=(int)(Math.random()*9+1);
			buffer.append(num);
		}
		return buffer.toString();
	}


public void updateMember(MemberBean memberbean) {
	Connection con=null;
	String sql ="";
	PreparedStatement pstmt=null;
		try {
			
			con=getConnection();
			
			sql = "update member set m_name=? where m_id=? and m_pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberbean.getM_name());		
			pstmt.setString(2, memberbean.getM_id());
			pstmt.setString(3, memberbean.getM_pass());
								
			pstmt.executeUpdate();
		}catch(Exception e) {
			//예외를 잡아서 처리 --> 메세지 출력 
			e.printStackTrace();
			
		}finally {
			if(pstmt!=null) {
				try{
					pstmt.close();
					   //예외처리 안해주면 에러남
			}catch(SQLException ex) {}
			}
		}if(con!=null)try {con.close();}catch(SQLException ex) {};
		 if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
		
	 }
	
public void deleteMember(String m_id,String m_pass) {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	try {
		//d예외가 발생할것 같은 명령, 필수적으로 외부파일 접근,디비접근
		con=getConnection();
		
		sql = "delete from member where m_id=? and m_pass=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.setString(2, m_pass);
		
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
}
}


