package net.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.CouponBean;
import net.mypage.db.CouponDAO;


public class Coupon implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		request.setCharacterEncoding("utf-8");						
		CouponDAO cdao = new CouponDAO();
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("m_id");
		if(id==null){
			forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		int count = cdao.getCouponCount(id)	;		
		int pageSize=3;		
		String pageNum= request.getParameter("pageNum");		
		if(pageNum==null){
			pageNum = "1";
		}		
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		List<CouponBean> couponlist=null;


		int endRow = pageSize*currentPage;
		int pageCount=0;
		int pageBlock=2;
		int startPage=0;
		int endPage=0;
		if(count!=0){
			pageCount = count/pageSize;
			pageCount= (count%pageSize)!=0?  pageCount+1:pageCount;
			startPage=((currentPage-1)/pageBlock)*pageBlock+1;		
			endPage=startPage+pageBlock-1;
			if(pageCount<endPage){
				endPage=pageCount;
			}
			couponlist= cdao.getCoupons(id, startRow, pageSize);			
		}
	
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("couponlist", couponlist);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/coupon.jsp");						
			
		return forward;
	}
	
}
