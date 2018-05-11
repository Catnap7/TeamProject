package net.category.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.category.db.ReportChkDAO;
import net.category.db.ReviewBean;
import net.category.db.ReviewDAO;

public class ReportAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("ReportAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		ReviewBean reviewbean = new ReviewBean();
		ReviewDAO reviewdao = new ReviewDAO();
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		int r_p_num = Integer.parseInt(request.getParameter("mv_num"));
		String id = request.getParameter("id");	
		
		ReportChkDAO repdao = new ReportChkDAO();
		
		int check = repdao.reportCheck(r_num, id);
		
		if(check == 1) {
			reviewdao.reportReview(r_num);
		}else {
			response.setContentType("text/html;	charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('이미 신고한 리뷰 입니다')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./CategoryMovie.ca?mv_num="+r_p_num);
		return forward;
	}

}
