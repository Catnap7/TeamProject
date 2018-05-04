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
		// count, pageNum, boardList, pageCount
		// pageBlock, startPage, endPage 저장				
		System.out.println("Coupon execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");				
		CouponBean cb = new CouponBean();
		CouponDAO cdao = new CouponDAO();
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("id");
		if(id==null){
			forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		int count = cdao.getCouponCount(id)	;		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=3;		
		// 페이지 번호(파라미터"pageNum") 가져오기
		String pageNum= request.getParameter("pageNum");		
		// 페이지 번호가 없으면 무조건 "1"페이지 설정		
		if(pageNum==null){
			pageNum = "1";
		}		
		//10개씩 첫번째페이지 첫행 구하기
		int currentPage=Integer.parseInt(pageNum);
		// 1페이지 10 => 1  2페이지 10 => 11  3페이지 10 => 21
		int startRow=(currentPage-1)*pageSize+1;
		List<CouponBean> couponlist=null;

		// 마지막행 구하기

		int endRow = pageSize*currentPage;
		int pageCount=0;
		int pageBlock=2;
		int startPage=0;
		int endPage=0;
		if(count!=0){
			//게시판 전체 페이지수 구하기
			//   전체 글개수count 50개 한 화면에 보여줄 글개수 pageSize 10개
			// count 50 pageSize 10 => 전체 페이지수 50/10=>5+나머지 =>5+0
			// count 58 pageSize 10 => 전체 페이지수 58/10+나머지1=>5+1=6
			pageCount = count/pageSize;
			pageCount= (count%pageSize)!=0?  pageCount+1:pageCount;
			//int pageCount = count/pageSize+(count%pageSize==0? 0:1);		
			//한 화면에 보여줄 페이지수 설정			
			// 시작하는 페이지 번호 구하기
			// 1~10 => 1		11~20 =>11		21~30=>21
			startPage=((currentPage-1)/pageBlock)*pageBlock+1;		
			// 끝나는 페이지 번호 구하기
			endPage=startPage+pageBlock-1;
			// 구한 끝페이지 보다 전체페이지 수가 작은 경우
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
