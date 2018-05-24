package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class EmailCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberDAO memberdao = new MemberDAO();
		String m_id = request.getParameter("m_id");
		MemberBean memberbean = memberdao.getMember(m_id);
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		HelloCoupon.couponnum();
		
		memberdao.setUserEmailChecked(m_id);
		session.setAttribute("m_id", memberbean.getM_id());
		session.setAttribute("m_name", memberbean.getM_name());

		forward.setRedirect(false);
		forward.setPath("./Main.me");
		return forward;
	}
}
