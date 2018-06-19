package net.follow.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.MovieBean;
import net.admin.manage.db.MovieDAO;
import net.follow.db.FollowDAO;
import net.mypage.db.AlarmBean;
import net.mypage.db.AlarmDAO;

public class InsertFollowerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("InsertFollowerAction execute()");
		
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		String m_id = request.getParameter("m_id");
		String f_id = request.getParameter("f_id");
		
		FollowDAO followdao = new FollowDAO();
		followdao.insertFollower(m_id, f_id);
		
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
		MovieBean moviebean = moviedao.getMovie(0); //새추천 알람일 경우 주석제거하고 mv_num에 추천이 달린 영화 번호 넣어주세요.
		ab.setA_id(f_id); //아이디값 넣기
		ab.setA_alarm_name(4); // 0 : 새추천 알람, 1 : 후기쓰기 정지 알람, 2:후기쓰기 정지 해제 알람, 3: 로그인정지 임박 알람
		ab.setA_end_day(a_end_day);
		ab.setA_start_day(a_start_day);
		ab.setA_movie_name("팔로우"); //새추천 알림일 경우 주석제거하고 영화제목 넣어주세요.
		ab.setA_follower(m_id);

		AlarmDAO adao = new AlarmDAO();
		adao.insertAlarm(ab);
		
		return null;
	}

}
