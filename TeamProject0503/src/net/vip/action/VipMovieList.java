package net.vip.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.vip.db.VipBean;
import net.vip.db.VipDAO;

public class VipMovieList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("VipMovieList execute");
		request.setCharacterEncoding("UTF8");
		
		VipDAO vipdao=new VipDAO();
		VipBean vipbean = new VipBean();
		
		List<VipBean> vipMovieList = (List)vipdao.getVipMovieList();
		request.setAttribute("vipMovieList", vipMovieList);
		
		
		
		//이동
		ActionForward forward=new ActionForward();
					
		forward.setRedirect(false);
		forward.setPath("./vip/VipMovieList.jsp");		
				
		return forward;
	}

}
