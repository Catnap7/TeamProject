package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.vip.db.VipBean;
import net.vip.db.VipDAO;

public class VipMovieModify implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("VipMovieModify execute");
		request.setCharacterEncoding("UTF8");
	
		
		VipDAO vipdao = new VipDAO();
		VipBean vipbean = new VipBean();
		
		int v_num=Integer.parseInt(request.getParameter("v_num"));
		vipbean=vipdao.getVipMovieContent(v_num);
		
		request.setAttribute("vipbean", vipbean);
	
	
		ActionForward forward=new ActionForward();
					
		forward.setRedirect(false);
		forward.setPath("./vip/vip_movie_modify.jsp");
	
		return forward;
	}

}
