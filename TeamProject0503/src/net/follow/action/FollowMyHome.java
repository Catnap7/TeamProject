package net.follow.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FollowMyHome implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("gd");
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./follow/myhome.jsp");
		return forward;
	}

}
