package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class UpdateAction implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		MemberBean mb = new MemberBean();		
		mb.setM_pass(request.getParameter("pass"));
		mb.setM_name(request.getParameter("m_name"));		
		session.setAttribute("m_name", request.getParameter("m_name"));
		mb.setM_id(id);
		MemberDAO mdao = new MemberDAO();		
		mdao.updateMember(mb);		
		
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./Mypage.my");																											
									
		return forward;		
	}

}
