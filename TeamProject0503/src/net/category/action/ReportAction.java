package net.category.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.admin.manage.db.AdminSuspendDAO;
import net.admin.manage.db.MovieDAO;
import net.category.db.ReportChkDAO;
import net.category.db.ReviewBean;
import net.category.db.ReviewDAO;
import net.mypage.db.AlarmBean;
import net.mypage.db.AlarmDAO;

public class ReportAction implements Action {

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
		AdminSuspendDAO asdao = new AdminSuspendDAO();		
		ReportChkDAO repdao = new ReportChkDAO();

		String id = request.getParameter("id");
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		int r_p_num = Integer.parseInt(request.getParameter("mv_num"));		
		int check = repdao.reportCheck(r_num, id);		
		
		if(check == 1) {
			reviewdao.reportReview(r_num);
			int total = repdao.totalReport(r_num); //해당 리뷰를 쓴 유저의 총 신고수 반환 메소드
			if(total==5){
				String user = repdao.ReportUser(r_num); //해당 리뷰를 쓴 유저 반환 메소드
				alarmInsert(user, 1); //1 : 후기쓰기 정지 알람, 2:후기쓰기 정지 해제 알람, 3: 로그인정지 임박 알람
				alarmInsert("admin", 5, user); //5 : 리뷰쓰기 정지
			}else if(total==9){
				String user = repdao.ReportUser(r_num);
				alarmInsert(user, 3); //1 : 후기쓰기 정지 알람, 2:후기쓰기 정지 해제 알람, 3: 로그인정지 임박 알람
			}else if(total==10){
				String user = repdao.ReportUser(r_num);
				alarmInsert("admin", 6, user); //6 : 로그인 정지
			}
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
	
	public void alarmInsert(String user, int name){ // 알람 등록하는 메소드
		//알람 등록하기 코드
		Calendar cal= new GregorianCalendar();
		cal.add(Calendar.MONTH,1);
		cal.clear(Calendar.MILLISECOND);
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String a_end_day=date.format(cal.getTime()).toString();

		Calendar cal2= new GregorianCalendar();				
		cal2.clear(Calendar.MILLISECOND);
		SimpleDateFormat date2 = new SimpleDateFormat("yyyy/MM/dd");
		String a_start_day=date.format(cal2.getTime()).toString();

		AlarmBean ab = new AlarmBean();		
		ab.setA_id(user); //아이디값 넣기
		ab.setA_alarm_name(name); // 0 : 새추천 알람, 1 : 후기쓰기 정지 알람, 2:후기쓰기 정지 해제 알람, 3: 로그인정지 임박 알람
		ab.setA_end_day(a_end_day);
		ab.setA_start_day(a_start_day);				
		ab.setA_movie_name("핫칙");//그냥 아무 영화 제목이나...오류 떠서
		
		AlarmDAO adao = new AlarmDAO();
		adao.insertAlarm(ab);
		//알람 등록하기 코드
	}
	
	public void alarmInsert(String user, int name, String forAdmin){ // 알람 등록하는 메소드
		//알람 등록하기 코드
		Calendar cal= new GregorianCalendar();
		cal.add(Calendar.MONTH,1);
		cal.clear(Calendar.MILLISECOND);
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String a_end_day=date.format(cal.getTime()).toString();

		Calendar cal2= new GregorianCalendar();				
		cal2.clear(Calendar.MILLISECOND);
		SimpleDateFormat date2 = new SimpleDateFormat("yyyy/MM/dd");
		String a_start_day=date.format(cal2.getTime()).toString();

		AlarmBean ab = new AlarmBean();		
		ab.setA_id(user); //아이디값 넣기
		ab.setA_alarm_name(name); // 0 : 새추천 알람, 1 : 후기쓰기 정지 알람, 2:후기쓰기 정지 해제 알람, 3: 로그인정지 임박 알람
		ab.setA_end_day(a_end_day);
		ab.setA_start_day(a_start_day);				
		ab.setA_movie_name("핫칙");//그냥 아무 영화 제목이나...오류 떠서
		ab.setA_forAdmin(forAdmin);
		AlarmDAO adao = new AlarmDAO();
		adao.insertAlarm(ab);
		//알람 등록하기 코드
	}
	
}
