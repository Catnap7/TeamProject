package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class FindPassAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		ActionForward forward= new ActionForward();
		MemberBean memberbean= new MemberBean();
		HttpSession session = request.getSession();
		
		MemberDAO memberdao = new MemberDAO();
		String m_id = request.getParameter("m_id");
		memberbean.setM_id(request.getParameter("m_id"));
		memberbean.setM_pass(request.getParameter("m_pass"));
		
		
		// 위에서 작성한 java파일 객체 생성
		EmailConfirm emailconfirm = new EmailConfirm();
		String authNum=emailconfirm.connectEmail(m_id);
		
		
		
		
		
		
		return forward;
	}

}
