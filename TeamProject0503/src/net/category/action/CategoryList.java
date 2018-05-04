package net.category.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;

public class CategoryList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		  request.setCharacterEncoding("utf-8");
		  String mv_genre = request.getParameter("mv_genre");
		  MovieDAO moviedao = new MovieDAO();
		  List CategoryList = moviedao.getCategoryList(mv_genre);
		  request.setAttribute("CategoryList", CategoryList);
		  
		  ActionForward forward = new ActionForward();
	      forward.setPath("./category/category.jsp");
	      forward.setRedirect(false);

	      return forward;
	}

}
