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
		
		
		List timelinelist = followdao.timelinelist(id);
		/*Vector vector = new Vector();
		
		vector = followdao.TimeLineReview(id);
		List<FollowBean> timelinemovie = (List)vector.get(0);
		List<MemberBean> timelinereview = (List)vector.get(1);
		
		*/
		request.setAttribute("timelinelist", timelinelist);
		/*request.setAttribute("timelinemovie", timelinemovie);
		request.setAttribute("timelinereview", timelinereview);*/
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./follow/timeline.jsp");						
			
		return forward;
	}

}
