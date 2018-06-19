package net.follow.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.follow.db.FollowBean;
import net.follow.db.FollowDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class TimeLine implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");								
		FollowDAO followdao = new FollowDAO();						
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		List timelinelist = followdao.timelinelist(id);
		request.setAttribute("timelinelist", timelinelist);
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./follow/timeline.jsp");						
			
		return forward;
	}

}
