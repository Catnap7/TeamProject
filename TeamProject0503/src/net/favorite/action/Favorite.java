package net.favorite.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieDAO;
import net.favorite.db.FavoriteDAO;


public class Favorite implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Favorite execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");								
		FavoriteDAO fdao = new FavoriteDAO();		
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		
		if(id==null){
			forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		Vector<List> v = fdao.getFavoriteList(id);
		List favoritelist = v.get(0);
		List movielist = v.get(1);
		request.setAttribute("favoritelist", favoritelist);	
		request.setAttribute("movielist", movielist);	
		
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./favorite/favorite.jsp");						
			
		return forward;
	}
	
}
