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
		
		
		
		
		int count = vipdao.getVipMovieCount();
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		/*List<VipBean> vipMovieList = (List)vipdao.getVipMovieList();
		request.setAttribute("vipMovieList", vipMovieList);*/
		
		List<VipBean> vipMovieList = null;
		
		if(count!=0){
			vipMovieList=(List)vipdao.getVipMovieList(startRow, pageSize);
		}
		int pageCount = count/pageSize + ((count%pageSize == 0) ? 0 : 1);
		int pageBlock = 3;
		int startPage = (((currentPage-1)/pageBlock)*pageBlock)+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		request.setAttribute("vipMovieList", vipMovieList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		//이동
		ActionForward forward=new ActionForward();			
		forward.setRedirect(false);
		forward.setPath("./vip/VipMovieList.jsp");		
		return forward;
	}

}
