package net.admin.manage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.AdminMovieDAO;

public class AdminMovieDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id == null || !id.equals("admin@watchu.com")){
			ActionForward forward= new ActionForward();
			forward.setPath("./intro.st");
			forward.setRedirect(true);
			return forward;
		}
		String mv_num = request.getParameter("mv_num");
		AdminMovieDAO amdao = new AdminMovieDAO();
		amdao.movieDelete(mv_num);
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminMovie_List_Search.am");
		forward.setRedirect(false);
		return forward;
	}

}
