package net.member.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.mypage.db.CouponBean;
import net.mypage.db.CouponDAO;

public class EmailCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO memberdao = new MemberDAO();
		String m_id = request.getParameter("m_id");
		MemberBean memberbean = memberdao.getMember(m_id);
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		Calendar cal= new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		cal.add(Calendar.MONTH,1);
		cal.clear(Calendar.MILLISECOND);
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String c_end_day=date.format(cal.getTime());
				//date.format(cal.getActualMaximum(Calendar.DATE)).toString();

		CouponBean cb= new CouponBean();
		String hellocoupon= HelloCoupon.couponnum();
		cb.setC_id(m_id);
		cb.setC_num(Integer.parseInt(hellocoupon));
		cb.setC_name(1);
		cb.setC_end_day(c_end_day);
		CouponDAO cdao = new CouponDAO();
		cdao.insertCoupon(cb);
		
		memberdao.setUserEmailChecked(m_id);
		session.setAttribute("m_id", memberbean.getM_id());
		session.setAttribute("m_name", memberbean.getM_name());

		forward.setRedirect(true);
		forward.setPath("./Main.ma");
		return forward;
	}
}
