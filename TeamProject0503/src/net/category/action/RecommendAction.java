package net.category.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;
import net.category.db.RecChkBean;
import net.category.db.RecChkDAO;
import net.category.db.ReviewBean;
import net.category.db.ReviewDAO;
import net.mypage.db.AlarmBean;
import net.mypage.db.AlarmDAO;

public class RecommendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String m_id=(String)session.getAttribute("m_id");
		if(m_id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		ReviewBean reviewbean = new ReviewBean();
		ReviewDAO reviewdao = new ReviewDAO();
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		int r_p_num = Integer.parseInt(request.getParameter("mv_num"));
		String id = request.getParameter("id");
		String r_id = request.getParameter("r_id");
		
		RecChkDAO reccdao = new RecChkDAO();
		
		int check = reccdao.reccomendCheck(r_num, id);
		
		if(check == 1) {
			reviewdao.recommandReview(r_num);
			
			Calendar cal= new GregorianCalendar();
			cal.add(Calendar.MONTH,1);
			cal.clear(Calendar.MILLISECOND);
			SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
			String a_end_day=date.format(cal.getTime()).toString();

			Calendar cal2= new GregorianCalendar();				
			cal2.clear(Calendar.MILLISECOND);
			SimpleDateFormat date2 = new SimpleDateFormat("yyyy/MM/dd");
			String a_start_day=date.format(cal2.getTime()).toString();

			MovieDAO moviedao = new MovieDAO();
			AlarmBean ab = new AlarmBean();
			MovieBean moviebean = moviedao.getMovie(r_p_num); //새추천 알람일 경우 주석제거하고 mv_num에 추천이 달린 영화 번호 넣어주세요.
			ab.setA_id(r_id); //아이디값 넣기
			ab.setA_alarm_name(0); // 0 : 새추천 알람, 1 : 후기쓰기 정지 알람, 2:후기쓰기 정지 해제 알람, 3: 로그인정지 임박 알람
			ab.setA_end_day(a_end_day);
			ab.setA_start_day(a_start_day);
			ab.setA_movie_name(moviebean.getMv_kor_title()); //새추천 알림일 경우 주석제거하고 영화제목 넣어주세요.

			AlarmDAO adao = new AlarmDAO();
			adao.insertAlarm(ab);
			
			response.setContentType("text/html;	charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println(check);
			out.close();
			return null;
		}else {
			response.setContentType("text/html;	charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println(check);
			out.close();
			return null;
		}
		
	}

}
