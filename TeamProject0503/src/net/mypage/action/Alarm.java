package net.mypage.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mypage.db.AlarmBean;
import net.mypage.db.AlarmDAO;
import net.mypage.db.CouponBean;
import net.mypage.db.CouponDAO;


public class Alarm implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				//한글처리
				request.setCharacterEncoding("utf-8");				
				AlarmBean ab = new AlarmBean();
				AlarmDAO adao = new AlarmDAO();
				HttpSession session=request.getSession();		
				String id = (String)session.getAttribute("m_id");
				session.setAttribute("alarm_num", "0");
				if(id==null){
					forward=new ActionForward();
					forward.setRedirect(true);		
					forward.setPath("./MemberLogin.me");
					return forward;
				}
				int count = adao.getAlarmCount(id);		
				// 한 화면에 보여줄 글 개수 설정
				int pageSize=5;		
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
				List<AlarmBean> alarmlist=null;

				// 마지막행 구하기

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
					Vector<List> v = adao.getAlarmlist(id, startRow, pageSize);
					alarmlist = v.get(0);
					List movielist = v.get(1);		
					List memberList = v.get(2);
					request.setAttribute("movielist", movielist);
					request.setAttribute("memberList", memberList);
				}
				
				
				
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("alarmlist", alarmlist);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("count", count);
				
				
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./mypage/alaram.jsp");						
					
				return forward;
	}
	
}
