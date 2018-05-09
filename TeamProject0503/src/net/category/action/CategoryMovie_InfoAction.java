package net.category.action;


import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;
import net.favorite.db.FavoriteBean;
import net.favorite.db.FavoriteDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.rating.db.RatingBean;
import net.rating.db.RatingDAO;

public class CategoryMovie_InfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		/*int mv_num = Integer.parseInt(request.getParameter("mv_num"));
		Vector vector = new Vector();
		MovieDAO moviedao = new MovieDAO();
		List movietList =null;
		List favoriteList =null;
		
		vector= moviedao.getMovie(mv_num);
		movietList = (List)vector.get(0);
		favoriteList = (List)vector.get(1);
		request.setAttribute("movietList", movietList);
		request.setAttribute("favoriteList", favoriteList);*/
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		int mv_num = Integer.parseInt(request.getParameter("mv_num"));
		int f_num=Integer.parseInt(request.getParameter("mv_num"));
		FavoriteDAO favoriteDAO = new FavoriteDAO();
		FavoriteBean favoritebean = favoriteDAO.getfavorite(f_num, id);
		
		MovieDAO moviedao = new MovieDAO();
		MovieBean moviebean = moviedao.getMovie(mv_num);
		
		RatingDAO ratingdao = new RatingDAO();
		RatingBean ratingBean = ratingdao.getRating(id,mv_num);

		float avg =ratingdao.avgRating(mv_num);
		
		MemberDAO memberdao = new MemberDAO();
		MemberBean memberbean = memberdao.getMember(id);
		
		request.setAttribute("moviebean", moviebean);
		request.setAttribute("favoritebean", favoritebean);
		request.setAttribute("ratingBean", ratingBean);
		request.setAttribute("avg", avg);
		request.setAttribute("memberbean", memberbean);
		
		
		ActionForward forward = new ActionForward();
	  	forward.setPath("./category/movie_info.jsp");
	  	forward.setRedirect(false);
      	return forward;
	}

}
