package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;


public class AdminMovieInsert implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null || !id.equals("admin@watchu.com")){
			ActionForward forward= new ActionForward();
			forward.setPath("./intro.st");
			forward.setRedirect(true);
			return forward;
		}
		MovieBean mob = new MovieBean();
		mob.setMv_kor_title(request.getParameter("mv_kor_title"));
		mob.setMv_eng_title(request.getParameter("mv_eng_title"));
		mob.setMv_year(Integer.parseInt(request.getParameter("mv_year")));
		mob.setMv_country(request.getParameter("mv_country"));
		mob.setMv_age(Integer.parseInt(request.getParameter("mv_age")));
		mob.setMv_genre(request.getParameter("mv_genre"));
		mob.setMv_time(Integer.parseInt(request.getParameter("mv_time")));
		mob.setMv_director(request.getParameter("mv_director"));
		mob.setMv_actor(request.getParameter("mv_actor"));
		mob.setMv_story(request.getParameter("mv_story"));
		mob.setMv_video(request.getParameter("mv_video"));
		MovieDAO mdao = new MovieDAO();
		mdao.insertMovie(mob);		
		ActionForward forward = new ActionForward();
	    forward.setPath("./AdminManageList.am");
	    forward.setRedirect(false);
	    return forward;
	}

}
