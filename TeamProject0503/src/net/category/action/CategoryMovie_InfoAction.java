package net.category.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;

public class CategoryMovie_InfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int mv_num = Integer.parseInt(request.getParameter("mv_num"));
		MovieDAO moviedao = new MovieDAO();
		MovieBean moviebean = moviedao.getMovie(mv_num);
		request.setAttribute("moviebean", moviebean);
		
		ActionForward forward = new ActionForward();
	  	forward.setPath("./category/movie_info.jsp");
	  	forward.setRedirect(false);
      	return forward;
	}

}
