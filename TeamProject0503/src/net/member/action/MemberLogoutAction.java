package net.member.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.invalidate();

		Cookie cookies[]=request.getCookies();
		   
		   if(cookies !=null){
			   for(int i=0; i<cookies.length; i++){
				   if(cookies[i].getName().equals("m_id")){
					   cookies[i].setMaxAge(0);
					   response.addCookie(cookies[i]);
				   }
				   if(cookies[i].getName().equals("m_pass")){
					   cookies[i].setMaxAge(0);
					   response.addCookie(cookies[i]);
				   }
			   }
		   }
		
		ActionForward forward= new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./intro.st");
		
		return forward;
	}
	
}
