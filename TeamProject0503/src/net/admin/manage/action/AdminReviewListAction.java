package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminReviewListAction execute()");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/manage/admin_review_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
