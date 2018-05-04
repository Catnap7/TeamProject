package net.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.favorite.db.FavoriteBean;
import net.favorite.db.FavoriteDAO;

public class Main implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		
		if(id==null){
			forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		FavoriteDAO fdao = new FavoriteDAO();
		List <MovieBean>favoritelist = fdao.randomFavoriteList(id);		
		request.setAttribute("id", id);
		request.setAttribute("favoritelist", favoritelist);
		
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/main.jsp");						
			
		return forward;
	}
	
}
