package net.rating.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.rating.db.RatingBean;
import net.rating.db.RatingDAO;

public class RatingAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");	
		
		HttpSession session= request.getSession();
		String m_id=(String)session.getAttribute("m_id");
		if(m_id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		int ra_p_num=Integer.parseInt(request.getParameter("ra_p_num"));
		
		RatingBean ratingbean= new RatingBean();
		ratingbean.setRa_id(m_id);
		ratingbean.setRa_p_num(ra_p_num);
		ratingbean.setRa_rating(Integer.parseInt(request.getParameter("ra_rating")));

		RatingDAO rdao= new RatingDAO();
		//평점 남긴 영화인지 확인 후 insert or update
		int check=rdao.ratingCheck(m_id, ra_p_num);
		if(check==1){
			rdao.insertRating(ratingbean);
		}else if (check==-1){
			rdao.updateRating(ratingbean);
		}

//		ajax
		return null;
		
	}

}
