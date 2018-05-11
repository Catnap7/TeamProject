package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminReviewDAO;

public class AdminReviewDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminReviewDelete execute()");
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		AdminReviewDAO ardao = new AdminReviewDAO();
		ardao.AdminReviewDelete(r_num);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminReviewListAction.am");
		forward.setRedirect(false);
		return forward;
	}

}
