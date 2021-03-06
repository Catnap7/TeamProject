package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				request.setCharacterEncoding("utf-8");
				HttpSession session= request.getSession();
				String id=(String)session.getAttribute("m_id");
				if(id==null){
					ActionForward forward= new ActionForward();
					forward.setPath("./MemberLogin.me");
					forward.setRedirect(true);
					return forward;
				}
				ActionForward forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./mypage/updatecheck.jsp");				
				return forward;
	}
	
}
