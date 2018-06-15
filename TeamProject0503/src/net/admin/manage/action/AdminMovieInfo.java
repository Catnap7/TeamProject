package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminMovieDAO;
import net.admin.manage.db.MovieBean;

public class AdminMovieInfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMovieInfo execute()");
		ActionForward forward = new ActionForward();
		String mv_num = request.getParameter("mv_num");
		AdminMovieDAO amdao = new AdminMovieDAO();
		MovieBean movieBean = amdao.getMovieInfo(mv_num);
		
		request.setAttribute("movieBean", movieBean);
		
		forward.setPath("./admin/manage/admin_movie_info.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
