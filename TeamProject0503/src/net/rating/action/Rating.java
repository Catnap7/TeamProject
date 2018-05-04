package net.rating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.rating.db.RatingDAO;

public class Rating implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("rating");
		
		//랜덤으로 영화를 챙겨올것.
		//랜덤으로 숫자를 생성할것.(총 10개의 숫자를 생성할것.)
		//랜덤으로 생성한 숫자는 크기가 영화 db넘버내의 숫자일것.
		//만약에 숫자가 없으면, 다시 숫자를 뽑을것.
		
		//인덱스값을가진 배열 10을 만들것. 
		//for문을 돌것.
		//랜덤으로 난수를 생성할것.(난수생성 최대값은 db값에서 챙겨서 들고올것.)
		//생성된 난수가 중복된정보인지 확인할것.
		//중복되었으면 다시 난수생성 반복.
		//db내에서 존재하는 db번호인지 확인할것.
		//인덱스 10번을 모두 돌아서 배열 10에 다 챙기고 나올것.
		
		//챙긴 배열값 10개를 moviebean에 setMv_num로 저장? 리턴
		//mv_num을 받아왔다!. 
		
		//내 id에서 레이팅 하지 않은 영화 불러 오기 id넘기기
		HttpSession session= request.getSession();
		String ra_id=null;
		ra_id=(String)session.getAttribute("id");
		
		
		RatingDAO rdao= new RatingDAO();
		System.out.println("rating0");
		//List movieList=rdao.randomMovieList(ra_id);
		List movielist=rdao.randomMovieList();
		
		//id넣을때, 
		
		
		request.setAttribute("movielist", movielist);
		System.out.println("rating2");
		
		ActionForward forward= new ActionForward();
		forward.setPath("./rating/ratinglist.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
