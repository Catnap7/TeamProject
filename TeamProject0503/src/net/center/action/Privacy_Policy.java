package net.center.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Privacy_Policy implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AccessTerms execute()");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./customer/privacy_policy.jsp");
		return forward;
	}
}
