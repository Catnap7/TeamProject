package net.follow.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.follow.db.FollowDAO;

public class TimeLine implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");								
		FollowDAO followdao = new FollowDAO();						
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		List timelinelist = followdao.timelinelist(id);
		
		request.setAttribute("timelinelist", timelinelist);
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./follow/timeline.jsp");						
			
		return forward;
	}

}
