package net.category.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.category.db.ReviewBean;
import net.category.db.ReviewDAO;

public class ModifyReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		int mv_num = Integer.parseInt(request.getParameter("mv_num"));
		
		ReviewBean reviewbean = new ReviewBean();
		ReviewDAO reviewdao =new ReviewDAO();
		
		reviewbean.setR_num(Integer.parseInt(request.getParameter("r_num")));
		reviewbean.setR_content(request.getParameter("r_content"));
		
		reviewdao.updateReview(reviewbean);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./CategoryMovie.ca?mv_num="+mv_num);
		return forward;
	}

}
