package net.member.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.follow.db.FollowDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.mypage.db.AlarmBean;
import net.mypage.db.AlarmDAO;
import net.mypage.db.CouponBean;
import net.mypage.db.CouponDAO;


public class MemberLoginAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		MemberDAO mdao = new MemberDAO();
		String m_id = request.getParameter("m_id");
		
		MemberBean memberbean= new MemberBean();
		
		Calendar cal= new GregorianCalendar();
		cal.clear(Calendar.MILLISECOND);
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		int today = Integer.parseInt(date.format(cal.getTime()).toString());

		AlarmDAO adao = new AlarmDAO();
		CouponDAO cdao = new CouponDAO();

		List <CouponBean>couponlist = cdao.getCoupons(m_id);
		List <AlarmBean>alarmlist = adao.getAlarms(m_id);
		
		memberbean.setM_id(request.getParameter("m_id"));		
		memberbean.setM_pass(request.getParameter("m_pass"));
		
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check=mdao.userCheck(memberbean.getM_id(),memberbean.getM_pass());
		int Echeck=mdao.EmailChecked(memberbean.getM_id());
		
		if(check==0) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}else if(check==-1){
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다');");
			out.println("history.back()");
			out.println("</script>");
		}else if(check==1){
			
			if(Echeck==0) {
				out.println("<script>");
				out.println("alert('이메일 인증을 완료해주세요');");
				out.println("history.back()");
				out.println("</script>");
			}else if(Echeck==2) {
				out.println("<script>");
				out.println("alert('회원님은 현재 로그인 정지중인 회원입니다');");
				out.println("history.back()");
				out.println("</script>");
			}
			else {
			
			if(couponlist != null){
				for(CouponBean couponbean:couponlist){
				 String c_array[] = couponbean.getC_end_day().split("/");  
				 String c_day = c_array[0]+c_array[1]+c_array[2];
				 
				 int c_end_day = Integer.parseInt(c_day);
				 if(today>=c_end_day){
					cdao.deleteCoupon(couponbean.getC_num());
					}  
				 }//end for
				}//end if
			
			if(alarmlist != null){
				for(AlarmBean alarmbean:alarmlist){
				 String a_array[] = alarmbean.getA_end_day().split("/");  
				 String a_day = a_array[0]+a_array[1]+a_array[2];
				 
				 int c_end_day = Integer.parseInt(a_day);
				 if(today>=c_end_day){
					adao.deleteAlarm(alarmbean.getA_num());
					}  
				 }//end for
				}//end if
			memberbean = mdao.getMember(m_id);
			session.setAttribute("m_id",memberbean.getM_id());
			session.setAttribute("m_name",memberbean.getM_name());
			
			if(request.getParameter("m_id").equals("admin")) {
				ActionForward forward= new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./AdminManageList.am");
				return forward;	
			}
			ActionForward forward= new ActionForward();			
			forward.setRedirect(true);
			forward.setPath("./Main.ma");
			return forward;
			}
	
	}
		return null;
		
	}

}
