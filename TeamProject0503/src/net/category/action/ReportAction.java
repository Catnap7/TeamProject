package net.category.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminSuspendDAO;
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
		AdminSuspendDAO asdao = new AdminSuspendDAO();		
		ReportChkDAO repdao = new ReportChkDAO();

		String id = request.getParameter("id");
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		int r_p_num = Integer.parseInt(request.getParameter("mv_num"));		
		int check = repdao.reportCheck(r_num, id);		
		
		if(check == 1) {
			reviewdao.reportReview(r_num);
			response.setContentType("text/html;	charset=UTF-8");
			PrintWriter out = response.getWriter();			
			out.println(check);
			out.close();
			return null;
		}else {
			response.setContentType("text/html;	charset=UTF-8");
			PrintWriter out = response.getWriter();			
			out.println(check);
			out.close();
			return null;
		}
	}
}
