package net.start.action;

import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class CookieLogin implements Action{
	ActionForward forward;
	
	
	@SuppressWarnings("deprecation")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String m_pass = null;
		String m_id = null;
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("m_id")) {
					 m_id = URLDecoder.decode(cookies[i].getValue());
					 System.out.println(m_id);
				}
				if(cookies[i].getName().equals("m_pass")){
					m_pass=cookies[i].getValue();
				}
			}
		
		}if(m_pass!=null) {
			System.out.println("쿠키로그인시도");
			MemberDAO mdao = new MemberDAO();
			MemberBean memberbean=new MemberBean();
			memberbean.setM_id(m_id);		
			memberbean.setM_pass(m_pass);
			memberbean =mdao.getMember(m_id); 
					
			
			//m_name = memberbean.getM_name();
			session.setAttribute("m_id",m_id);
			session.setAttribute("m_name",memberbean.getM_name());
			//request.setAttribute("m_name",m_name);
			System.out.println(memberbean.getM_id());
			System.out.println(memberbean.getM_name());
			forward= new ActionForward();			
			forward.setRedirect(true);
			forward.setPath("./Main.ma");
			return forward;
		
		}else{                                            // 쿠키에서 이름 id를 찾지 못했을때
			 forward= new ActionForward();			
			forward.setRedirect(false);
			forward.setPath("./member/login.jsp");
			return forward;  
		}
}
}
