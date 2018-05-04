package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminPayListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminPayListAction execute()");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/manage/admin_pay_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
