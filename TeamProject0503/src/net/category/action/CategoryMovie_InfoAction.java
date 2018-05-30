package net.category.action;


import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;
import net.category.db.ReviewDAO;
import net.favorite.db.FavoriteBean;
import net.favorite.db.FavoriteDAO;
import net.follow.db.FollowBean;
import net.follow.db.FollowDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.rating.db.RatingBean;
import net.rating.db.RatingDAO;

public class CategoryMovie_InfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CategoryMovie_InfoAction execute()");
		request.setCharacterEncoding("utf-8");
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
		
		// 리뷰
		ReviewDAO reviewdao = new ReviewDAO();
//		List reviewList = reviewdao.getReview(mv_num);
//				
//		request.setAttribute("reviewList", reviewList);
		String order = request.getParameter("order");
		
		int count = reviewdao.getReviewCount(mv_num);
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		Vector vector = null;
		List reviewList = null;
		List memberName = null;
		
		int endRow = pageSize * currentPage;
		int pageCount = 0;
		int pageBlock=5;
		int startPage=0;
		int endPage=0;
		
		if(count!=0){
			
			pageCount = count/pageSize;
			pageCount= (count%pageSize)!=0?  pageCount+1:pageCount;
			
			startPage=((currentPage-1)/pageBlock)*pageBlock+1;		
			
			endPage=startPage+pageBlock-1;
			
			if(pageCount<endPage){
				endPage=pageCount;
			}
			
			if(order == null) {
				vector = reviewdao.getReview(mv_num, startRow, pageSize);
				reviewList = (List)vector.get(0);
				memberName = (List)vector.get(1);
			}else if(order.equals("newest")) {
				vector = reviewdao.dateSortReview(mv_num, startRow, pageSize);
				reviewList = (List)vector.get(0);
				memberName = (List)vector.get(1);
			}else if(order.equals("recommend")) {
				vector = reviewdao.getReview(mv_num, startRow, pageSize);
				reviewList = (List)vector.get(0);
				memberName = (List)vector.get(1);
			}
			
		}
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("memberName", memberName);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		// 리뷰
		
		ActionForward forward = new ActionForward();
	  	forward.setPath("./category/movie_info.jsp");
	  	forward.setRedirect(false);
      	return forward;
	}

}
