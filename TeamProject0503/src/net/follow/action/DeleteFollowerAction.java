package net.follow.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.follow.db.FollowDAO;



public class DeleteFollowerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DeleteFollowerAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		String m_id = request.getParameter("m_id");
		String f_id = request.getParameter("f_id");
		
		FollowDAO followdao = new FollowDAO();
		followdao.deleteFollower(m_id, f_id);
		
		return null;
	}

}
