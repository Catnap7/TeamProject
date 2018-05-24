package net.follow.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		MemberBean memberbean = new MemberBean();
		MemberDAO memberdao = new MemberDAO();
		memberbean=memberdao.getMember(m_id);
		
		FollowDAO followdao = new FollowDAO();
		int followercount= followdao.Followercount(m_id);
		int followingcount= followdao.Followingcount(m_id);
		
		/*if(followercount==null ||followingcount==null ){
			followercount=0;
			followingcount=0;
		}*/
		
		System.out.println(followercount+"123"+followingcount+"sdfdsf");
		request.setAttribute("memberbean", memberbean);
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./follow/myhome.jsp");
		return forward;
	}

}
