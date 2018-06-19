package net.follow.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;
import net.category.db.ReviewDAO;
import net.follow.db.FollowDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class FollowReview implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String m_id=(String)session.getAttribute("m_id");
		if(m_id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		String f_id=request.getParameter("m_id");
		
		MemberBean memberbean = new MemberBean();
		MemberDAO memberdao = new MemberDAO();
		memberbean=memberdao.getMember(f_id);
		
		FollowDAO followdao = new FollowDAO();
		int followercount= followdao.Followercount(f_id);
		int followingcount= followdao.Followingcount(f_id);
		
		ReviewDAO reviewdao = new ReviewDAO();
		int reviewcount=reviewdao.getReviewCount(f_id);
		MovieDAO moviedao = new MovieDAO();
		MovieBean moviebean = new MovieBean();
		moviebean=moviedao.getfavorite(f_id);
		
		
		
		
	
		
		FollowDAO fdao= new FollowDAO();
		
		Vector vector=fdao.followreview(f_id);
		List followreviewlist=(List)vector.get(0);
		List followmovielist=(List)vector.get(1);
		request.setAttribute("followreviewlist", followreviewlist);
		request.setAttribute("followmovielist", followmovielist);
		request.setAttribute("moviebean", moviebean);

		
		request.setAttribute("memberbean", memberbean);
		request.setAttribute("followercount", followercount);
		request.setAttribute("followingcount", followingcount);
		request.setAttribute("reviewcount", reviewcount);
		

		ActionForward forward = new ActionForward();
	    forward.setPath("./follow/followreviewlist.jsp");
	    forward.setRedirect(false);

		return forward;
	}

}
