package net.follow.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.category.db.ReviewDAO;
import net.follow.db.FollowDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class FollowReview implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//
		//FollowFavorite.fo?id=<%mv.getm_id%/>들고오기
		//id값 챙겨왔다.

		
		/*String id= request.getParameter("m_id");
		FollowDAO fdao= new FollowDAO();
		List followfavoritelist=fdao.followreview(id);
		*/
		
		
		HttpSession session= request.getSession();
		String m_id=(String)session.getAttribute("m_id");
		if(m_id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		MemberBean memberbean = new MemberBean();
		MemberDAO memberdao = new MemberDAO();
		memberbean=memberdao.getMember(m_id);
		
		FollowDAO followdao = new FollowDAO();
		int followercount= followdao.Followercount(m_id);
		int followingcount= followdao.Followingcount(m_id);
		
		ReviewDAO reviewdao = new ReviewDAO();
		int reviewcount=reviewdao.getReviewCount(m_id);
		
		
 /*		Vector vector2 = new Vector();
		vector2 = followdao.top5followfavorite(m_id);
		List<ReviewBean> top5favoritelist=(List)vector2.get(0);
		List<MovieBean> top5movielist2=(List)vector2.get(1);*/
		
		
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
