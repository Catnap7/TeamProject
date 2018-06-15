package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.AdminMovieDAO;
import net.admin.manage.db.MovieBean;

public class AdminMovieUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("AdminMovieUpdateAction execute()");
		String mv_num = request.getParameter("mv_num");
		AdminMovieDAO amdao = new AdminMovieDAO();
		MovieBean movieBean = new MovieBean();
		movieBean.setMv_num(Integer.parseInt(mv_num));
		movieBean.setMv_actor(request.getParameter("mv_actor"));
		movieBean.setMv_age(Integer.parseInt(request.getParameter("mv_age")));
		movieBean.setMv_country(request.getParameter("mv_country"));
		movieBean.setMv_director(request.getParameter("mv_director"));
		movieBean.setMv_eng_title(request.getParameter("mv_eng_title"));
		movieBean.setMv_genre(request.getParameter("mv_genre"));
		movieBean.setMv_kor_title(request.getParameter("mv_kor_title"));
		movieBean.setMv_story(request.getParameter("mv_story"));
		movieBean.setMv_time(Integer.parseInt(request.getParameter("mv_time")));
		movieBean.setMv_video(request.getParameter("mv_video"));
		movieBean.setMv_year(Integer.parseInt(request.getParameter("mv_year")));		
		amdao.movieUpdate(movieBean);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminMovie_List_Search.am");
		forward.setRedirect(false);
		return forward;
	}

}
