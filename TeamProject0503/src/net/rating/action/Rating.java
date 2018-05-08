package net.rating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.rating.db.RatingDAO;

public class Rating implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("rating execute()");

		//내 id에서 레이팅 하지 않은 영화 불러 오기 id넘기기
		HttpSession session= request.getSession();
		String ra_id=null;
		ra_id=(String)session.getAttribute("m_id");
		
		
		RatingDAO rdao= new RatingDAO();
		//List movieList=rdao.randomMovieList(ra_id);
		List movielist=rdao.randomMovieList(ra_id);
		
		//id넣을때, 
		
		
		request.setAttribute("movielist", movielist);
		
		ActionForward forward= new ActionForward();
		forward.setPath("./rating/ratinglist.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
