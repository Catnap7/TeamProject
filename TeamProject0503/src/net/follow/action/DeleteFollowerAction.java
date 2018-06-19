package net.follow.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.follow.db.FollowDAO;



public class DeleteFollowerAction implements Action {

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
		request.setCharacterEncoding("utf-8");
		
		String m_id = request.getParameter("m_id");
		String f_id = request.getParameter("f_id");
		
		FollowDAO followdao = new FollowDAO();
		followdao.deleteFollower(m_id, f_id);
		
		return null;
	}

}
