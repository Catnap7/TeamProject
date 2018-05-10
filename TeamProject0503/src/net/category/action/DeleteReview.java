package net.category.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.category.db.ReviewDAO;

public class DeleteReview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("DeleteReview execute()");
		
		request.setCharacterEncoding("utf-8");
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		int mv_num = Integer.parseInt(request.getParameter("mv_num"));
		
		ReviewDAO reviewdao = new ReviewDAO();
		reviewdao.deleteReview(r_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./CategoryMovie.ca?mv_num="+mv_num);
		return forward;
	}

}
