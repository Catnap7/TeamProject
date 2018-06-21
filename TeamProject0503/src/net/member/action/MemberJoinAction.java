
package net.member.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import util.Gmail;

public  class MemberJoinAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      //한글처리
      request.setCharacterEncoding("utf-8");
      HttpSession session= request.getSession();
      
      MemberBean memberbean = new MemberBean();
      
      int jumin2=Integer.parseInt(request.getParameter("m_num2"));
      
      memberbean.setM_id(request.getParameter("m_id"));
      //memberbean.setM_pass(request.getParameter("m_pass"));
      memberbean.setM_name(request.getParameter("m_name"));
      if(jumin2==3||jumin2==4) {
      memberbean.setM_id_num1(Integer.parseInt("20"+request.getParameter("m_num1")));
      }else {
       memberbean.setM_id_num1(Integer.parseInt("19"+request.getParameter("m_num1")));
      }
      memberbean.setM_id_num2(Integer.parseInt(request.getParameter("m_num2")));
      memberbean.setM_grade(0);
      memberbean.setM_pay(0);
      memberbean.setM_reg_date(new Date(System.currentTimeMillis()));
      
      //pass를 암호화 
      String planText=request.getParameter("m_pass");
      String salt = Sha256.getSalt();
      String passText=Sha256.encrypt(planText, salt);
      memberbean.setM_pass(passText);
      memberbean.setM_salt(salt);
      
      MemberDAO memberdao = new MemberDAO();
      memberdao.insertMember(memberbean);
   
      String m_id = request.getParameter("m_id"); 
      session.setAttribute("m_id", m_id);
   
   int Echeck = memberdao.EmailChecked(m_id);
   if(Echeck==1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('이미 인증 된 회원입니다.');");
      script.println("location.href = './Main.me'");
      script.println("</script>");
      script.close();      
      return null;
   }

   //String host = "http://itwillbs6.cafe24.com/WATCHU/EmailCheckAction.me";
   //String host = "http://localhost:8080/TeamProject0503/EmailCheckAction.me";
   String host = "http://192.168.2.5:8080/TeamProject0503/EmailCheckAction.me";
   String from = "wkdwodn22@gmail.com";
   String fromname = "왓츄";
   String to = m_id;
   String subject = " 이메일 확인 메일입니다.";
   String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +
      "<a href='" + host +"?m_id="+m_id + "'>이메일 인증하기</a>";

   Properties p = new Properties();
   p.put("mail.smtp.user", from);
   p.put("mail.smtp.host", "smtp.googlemail.com");
   p.put("mail.smtp.port", "465");
   p.put("mail.smtp.starttls.enable", "true");
   p.put("mail.smtp.auth", "true");
   p.put("mail.smtp.debug", "true");
   p.put("mail.smtp.socketFactory.port", "465");
   p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
   p.put("mail.smtp.socketFactory.fallback", "false");
   try{
       Authenticator auth = new Gmail();
       Session ses = Session.getInstance(p, auth);
       ses.setDebug(true);
       MimeMessage msg = new MimeMessage(ses); 
       msg.setSubject(subject);
       
       msg.setFrom(new InternetAddress
                (from, MimeUtility.encodeText(fromname,"utf-8","B")));
       
       Address toAddr = new InternetAddress(to);
       msg.addRecipient(Message.RecipientType.TO, toAddr);
       msg.setContent(content, "text/html;charset=UTF-8");
       Transport.send(msg);
   } catch(Exception e){
       e.printStackTrace();
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('오류가 발생했습니다..');");
      script.println("history.back();");
      script.println("</script>");
      script.close();   
      return null;
   }

      ActionForward forward= new ActionForward();
      
      forward.setRedirect(true);
      forward.setPath("./EmailSend.me");
      
      return forward;
   }
}

