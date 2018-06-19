package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class FindPassAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward= new ActionForward();
		MemberBean memberbean= new MemberBean();
		
		MemberDAO memberdao = new MemberDAO();
		String m_id = request.getParameter("m_id");
		memberbean.setM_id(m_id);
		
		memberdao.connectEmail(m_id);
		
		forward.setRedirect(false);
		forward.setPath("./member/find_password_send.jsp");
		return forward;
	}

}
