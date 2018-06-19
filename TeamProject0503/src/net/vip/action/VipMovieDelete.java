package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.vip.db.VipBean;
import net.vip.db.VipDAO;


public class VipMovieDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("GoodsDeleteAction execute");
		request.setCharacterEncoding("UTF8");
		
		VipDAO vipdao = new VipDAO();
		VipBean vipbean = new VipBean();
		
		vipdao.deleteVipMovie(Integer.parseInt(request.getParameter("v_num")));
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./VipMovieList.vi");
		return forward;
	}

}
