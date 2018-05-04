package net.rating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.rating.db.RatingBean;
import net.rating.db.RatingDAO;

public class RatingAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("ratingAction execute()");
		
		//섭밋으로 넘겨진 파라미터값 받아오기. 
		//rating 테이블 인서트 or update
		
		
		//레이팅 한 사람 받아옴
//		HttpSession session= request.getSession();
/*		String ra_id=null;
		ra_id=(String)session.getAttribute("id");
*/
		System.out.println("7");
		String ra_id="wahchu";
		System.out.println("8");
		int ra_p_num=Integer.parseInt(request.getParameter("ra_p_num"));
		System.out.println("9");
		
		
		//빈파일에 저장
		RatingBean ratingbean= new RatingBean();
		ratingbean.setRa_id(ra_id);//레이팅 한 사람 받아옴
		ratingbean.setRa_p_num(ra_p_num);//레이팅 준 영화번호 받아옴
		ratingbean.setRa_rating(Integer.parseInt(request.getParameter("ra_rating")));//레이팅값 받아옴.
		

		//메소드 실행, insert, update
		RatingDAO rdao= new RatingDAO();
		//준 레이팅 확인하고(아이디, 영화)
		int check=rdao.ratingCheck(ra_id, ra_p_num);
		System.out.println("2");
		if(check==1){
			//새 레이팅이면 레이팅 넣고 
			rdao.insertRating(ratingbean);
			
		}else if (check==-1){
		//레이팅리스트에 있으면 수정하고. 
			rdao.updateRating(ratingbean);
		}
		System.out.println("rating0");

		ActionForward forward= new ActionForward();
		forward.setPath("./rating/ratinglist.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
