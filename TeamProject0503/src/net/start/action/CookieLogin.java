package net.start.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class CookieLogin implements Action{
	ActionForward forward;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String m_pass = null;
		String m_id = null;
		String m_id1 = null;
		String m_id2 = null;
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("m_id1")) {
					 m_id1 = cookies[i].getValue();
				}
				if(cookies[i].getName().equals("m_id2")) {
					 m_id2 = cookies[i].getValue();
				}
				if(cookies[i].getName().equals("m_pass")){
					m_pass=cookies[i].getValue();
				}
			}
		
		}if(m_pass!=null) {
			System.out.println("쿠키로그인시도");
			m_id = m_id1+"@"+m_id2;
			MemberDAO mdao = new MemberDAO();
			MemberBean memberbean=new MemberBean();
			memberbean.setM_id(m_id);		
			memberbean.setM_pass(m_pass);
			memberbean =mdao.getMember(m_id); 
			session.setAttribute("m_id",m_id);
			session.setAttribute("m_name",memberbean.getM_name());
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
