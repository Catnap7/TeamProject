package net.category.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.AdminSuspendDAO;
import net.category.db.ReviewBean;
import net.category.db.ReviewDAO;

public class InsertReview implements Action {

	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String r_id=(String)session.getAttribute("m_id");
		if(r_id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		ReviewBean reviewbean = new ReviewBean();
		ReviewDAO reviewdao = new ReviewDAO();
		AdminSuspendDAO asdao = new AdminSuspendDAO();
		

		asdao.AdminMemberSuspend(r_id);
		
		if(r_id==null){
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		int r_p_num = Integer.parseInt(request.getParameter("mv_num"));
		String r_content = request.getParameter("r_content");
		
		List checkList = reviewdao.checkReview(r_id, r_p_num);
		
		int r_num_ =(Integer)checkList.get(0);
		int check =(Integer)checkList.get(1);
		
		if(check == 1) {
			reviewbean.setR_num(r_num_);
			reviewbean.setR_content(r_content);
			
			reviewdao.updateReview(reviewbean);
		}else {
			int r_num = 0;
			int r_recommand = 0;
			int r_report = 0;
			
			reviewbean.setR_num(r_num);
			reviewbean.setR_p_num(r_p_num);
			reviewbean.setR_id(r_id);
			reviewbean.setR_content(r_content);
			reviewbean.setR_recommand(r_recommand);
			reviewbean.setR_report(r_report);
			reviewdao.insertReview(reviewbean);
		}
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./CategoryMovie.ca?mv_num="+r_p_num);
		return forward;
		
	}

}
