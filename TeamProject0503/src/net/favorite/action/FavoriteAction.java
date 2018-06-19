package net.favorite.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.favorite.db.FavoriteBean;
import net.favorite.db.FavoriteDAO;


public class FavoriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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

		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//bean파일에 저장
		FavoriteBean favoriteBean = new FavoriteBean();
		favoriteBean.setF_id(f_id);
		favoriteBean.setF_num(f_num);
		FavoriteDAO favoriteDAO =new FavoriteDAO();
		int check = favoriteDAO.favoriteCheck(f_id, f_num);
		if(check==1){
			favoriteDAO.insertFavortie(favoriteBean);
			out.print(check);
			out.close();
			return null;
		}else if(check==-1){
			favoriteDAO.favoritedelete(f_id, f_num);
			out.print(check);
			out.close();
			return null;
		}
		
		ActionForward forward= new ActionForward();
		forward.setPath("./Category.ca");
		forward.setRedirect(false);
		return forward;
	}		

}
