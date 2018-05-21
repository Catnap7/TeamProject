package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.vip.db.VipBean;
import net.vip.db.VipDAO;


public class VipMovieModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("VipMovieModifyAction execute");
		request.setCharacterEncoding("UTF8");
	
		VipDAO vipdao = new VipDAO();
		VipBean vipbean = new VipBean();
		
		vipbean.setCategory(request.getParameter("category"));
		vipbean.setName(request.getParameter("name"));
		vipbean.setPrice(Integer.parseInt(request.getParameter("price")));
		vipbean.setColor(request.getParameter("color"));
		vipbean.setAmount(Integer.parseInt(request.getParameter("amount")));
		
		vipbean.setSize(request.getParameter("size"));
		vipbean.setBest(Integer.parseInt(request.getParameter("best")));
		vipbean.setContent(request.getParameter("content"));
		vipbean.setNum(Integer.parseInt(request.getParameter("num")));
		
		vipdao.VipMo(vipbean);
		
		
		//이동
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./VipMovieList.vi");
		return forward;
	}

}
