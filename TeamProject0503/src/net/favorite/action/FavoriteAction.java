package net.favorite.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.favorite.db.FavoriteBean;
import net.favorite.db.FavoriteDAO;


public class FavoriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
System.out.println("FavoriteAction execute()");
		
		//섭밋으로 넘겨진 파라미터값 받아오기. 
		//rating 테이블 인서트 or update
		
		
		//레이팅 한 사람 받아옴
		HttpSession session= request.getSession();
		String f_id=(String)session.getAttribute("m_id");
		int f_num=Integer.parseInt(request.getParameter("f_num"));
		if(f_id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}

//		세션값 없을때 쓴 아이디	(강제 아이디 설정)
//		String ra_id="wahchu";
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//bean파일에 저장
		FavoriteBean favoriteBean = new FavoriteBean();
		favoriteBean.setF_id(f_id);
		favoriteBean.setF_num(f_num);
		

		//메소드 실행, insert, update
		FavoriteDAO favoriteDAO =new FavoriteDAO();
		int check = favoriteDAO.favoriteCheck(f_id, f_num);
		//준 레이팅 확인하고(아이디, 영화)
		if(check==1){
			favoriteDAO.insertFavortie(favoriteBean);
		}else if(check==-1){
			favoriteDAO.favoritedelete(f_id, f_num);
		}
		
		ActionForward forward= new ActionForward();
		forward.setPath("./Category.ca");
		forward.setRedirect(false);
		return forward;
	}		

}
