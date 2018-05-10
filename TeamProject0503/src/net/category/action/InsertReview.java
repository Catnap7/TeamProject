package net.category.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.category.db.ReviewBean;
import net.category.db.ReviewDAO;

public class InsertReview implements Action {

	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("InsertReview execute()");
		
		request.setCharacterEncoding("utf-8");
		
		ReviewBean reviewbean = new ReviewBean();
		ReviewDAO reviewdao = new ReviewDAO();
		
		int r_num = 0;
		int r_recommand = 0;
		int r_report = 0;
		int r_p_num = Integer.parseInt(request.getParameter("mv_num"));
		String r_content = request.getParameter("r_content");
		HttpSession session = request.getSession();
		String r_id = (String)session.getAttribute("m_id");
		
		if(r_id==null){
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		reviewbean.setR_num(r_num);
		reviewbean.setR_p_num(r_p_num);
		reviewbean.setR_id(r_id);
		reviewbean.setR_content(r_content);
		reviewbean.setR_recommand(r_recommand);
		reviewbean.setR_report(r_report);
		
		reviewdao.insertReview(reviewbean);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./CategoryMovie.ca?mv_num="+r_p_num);
		return forward;
		
	}

}
