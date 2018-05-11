package net.start.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;


public class CookieLogin implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id = null;
		String pass = null;
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("id")) {
					id = cookies[i].getValue();
				}
				if(cookies[i].getName().equals("pass")){
					pass=cookies[i].getValue();
				}
			}
			MemberDAO mdao = new MemberDAO();
			MemberBean memberbean= mdao.getMember(id);
			memberbean.setM_id(id);		
			memberbean.setM_pass(pass);
			ActionForward forward= new ActionForward();			
			forward.setRedirect(true);
			forward.setPath("./Main.ma");
			return forward;
			
		}
		if(cookies==null){                                            // 쿠키에서 이름 id를 찾지 못했을때
			ActionForward forward= new ActionForward();			
			forward.setRedirect(true);
			forward.setPath("./start.st");
			return forward;  
		}
		
	
		return null;

}
}
