package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.vip.db.VipBean;
import net.vip.db.VipDAO;



public class VipMovieContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("VipMovieContent execute()"); 
		
		
		
		int v_num = Integer.parseInt(request.getParameter("v_num"));
		System.out.println("v_num : " +v_num);
		VipDAO vipdao = new VipDAO();
		VipBean vipbean = vipdao.getVipMovieContent(v_num);
		
		request.setAttribute("vipbean", vipbean);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./vip/vip_movie_content.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
