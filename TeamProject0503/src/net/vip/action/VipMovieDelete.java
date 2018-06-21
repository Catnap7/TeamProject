package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.vip.db.VipBean;
import net.vip.db.VipDAO;


public class VipMovieDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		VipDAO vipdao = new VipDAO();
		VipBean vipbean = new VipBean();
		
		vipdao.deleteVipMovie(Integer.parseInt(request.getParameter("v_num")));
		
		
		ActionForward forward=new ActionForward();
		forward.setPath("./VipMovieList.vi");
		forward.setRedirect(true);
		return forward;
	}

}
