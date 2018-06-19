package net.mypage.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.mypage.db.CouponDAO;
import net.rating.db.RatingBean;
import net.rating.db.RatingDAO;

public class Myrating implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				request.setCharacterEncoding("utf-8");				
				RatingBean ratingbean = new RatingBean();
				RatingDAO rdao = new RatingDAO();
				
				
				
				HttpSession session=request.getSession();		
				String id = (String)session.getAttribute("m_id");				
				int count = rdao.getRatingCount(id);	 				 
				int pageSize=10;
				String pageNum= request.getParameter("pageNum");
				if(pageNum==null){
					pageNum = "1";
				}
				
				int currentPage=Integer.parseInt(pageNum);
				int startRow=(currentPage-1)*pageSize+1;
				
				
				Vector vector= new Vector();
				List<MovieBean> movielist=null;
				List<RatingBean> ratinglist=null;


				int endRow = pageSize*currentPage;
				int pageCount=0;
				int pageBlock=3;
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
					
					vector= rdao.getRatingList(id, startRow, pageSize);	
					ratinglist=(List)vector.get(0);
					movielist=(List)vector.get(1);
				}
			
				

				request.setAttribute("ratinglist", ratinglist);
				request.setAttribute("movielist", movielist);
				
				request.setAttribute("pageNum", pageNum);				
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);				
				request.setAttribute("count", count);
				
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./mypage/myrating.jsp");						
					
				return forward;
	}
	
}
