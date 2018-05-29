package net.follow.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javafx.scene.input.KeyCombination.ModifierValue;
import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;
import net.category.db.ReviewBean;
import net.category.db.ReviewDAO;
import net.favorite.db.FavoriteBean;
import net.favorite.db.FavoriteDAO;
import net.follow.db.FollowBean;
import net.follow.db.FollowDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;


public class FollowMyHome implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session= request.getSession();
		String m_id=(String)session.getAttribute("m_id");
		if(m_id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		Vector vector = new Vector();
		MemberBean memberbean = new MemberBean();
		MemberDAO memberdao = new MemberDAO();
		memberbean=memberdao.getMember(m_id);
		
		FollowDAO followdao = new FollowDAO();
		int followercount= followdao.Followercount(m_id);
		int followingcount= followdao.Followingcount(m_id);
		// 팔로잉 리스트
		vector = followdao.followingList(m_id);
		List<FollowBean> f_followingList = (List)vector.get(0);
		List<MemberBean> m_followingList = (List)vector.get(1);
		// 팔로워 리스트
		vector = followdao.followerList(m_id);
		List<FollowBean> f_followerList = (List)vector.get(0);
		List<MemberBean> m_followerList = (List)vector.get(1);
		
		ReviewDAO reviewdao = new ReviewDAO();
		int reviewcount=reviewdao.getReviewCount(m_id);
		
		MovieDAO moviedao = new MovieDAO();
		MovieBean moviebean = new MovieBean();
		MovieBean moviebean2 = new MovieBean();
		moviebean=moviedao.getfavorite(m_id);
		moviebean2 =moviedao.getfavorite2(m_id);
		
//		Vector vector = new Vector();
		vector=followdao.top5followreview(m_id);
		List<ReviewBean> top5reviewlist=(List)vector.get(0);
		List<MovieBean> top5movielist=(List)vector.get(1);
		
		List top5favoritelist = followdao.top5followfavorite(m_id);
 /*		Vector vector2 = new Vector();
		vector2 = followdao.top5followfavorite(m_id);
		List<ReviewBean> top5favoritelist=(List)vector2.get(0);
		List<MovieBean> top5movielist2=(List)vector2.get(1);*/
		
		request.setAttribute("memberbean", memberbean);
		request.setAttribute("followercount", followercount);
		request.setAttribute("followingcount", followingcount);
		request.setAttribute("reviewcount", reviewcount);
		request.setAttribute("moviebean", moviebean);
		request.setAttribute("moviebean2", moviebean2);
		request.setAttribute("top5reviewlist", top5reviewlist);
		request.setAttribute("top5movielist", top5movielist);
		request.setAttribute("top5favoritelist", top5favoritelist);
		request.setAttribute("f_followingList", f_followingList);
		request.setAttribute("m_followingList", m_followingList);
		request.setAttribute("f_followerList", f_followerList);
		request.setAttribute("m_followerList", m_followerList);
		
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./follow/myhome.jsp");
		return forward;
	}

}
