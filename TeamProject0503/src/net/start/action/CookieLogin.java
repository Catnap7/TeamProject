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
		HttpSession session = request.getSession();
		String m_id = null;
		String m_pass = null;
		Cookie[] cookies = request.getCookies();
	
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("m_id")) {
					m_id = cookies[i].getValue();
				}
				if(cookies[i].getName().equals("m_pass")){
					m_pass=cookies[i].getValue();
				}
			}
		
		}if(m_pass!=null) {
			
			MemberDAO mdao = new MemberDAO();
			MemberBean memberbean= new MemberBean();
			memberbean = mdao.getMember(m_id);
			memberbean.setM_id(m_id);		
			memberbean.setM_pass(m_pass);
			session.setAttribute("m_id",memberbean.getM_id());
			request.setAttribute("m_name",memberbean.getM_name());
			ActionForward forward= new ActionForward();			
			forward.setRedirect(true);
			forward.setPath("./Main.ma");
			return forward;
		
		}else{                                            // 쿠키에서 이름 id를 찾지 못했을때
			ActionForward forward= new ActionForward();			
			forward.setRedirect(false);
			forward.setPath("./start/start.jsp");
			return forward;  
		}
	
}
}
