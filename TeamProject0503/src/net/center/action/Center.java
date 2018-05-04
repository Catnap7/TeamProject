package net.center.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Center implements Action {
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Center execute()");
		
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./customer/customer.jsp");						
			
		return forward;
	}

}
