package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.vip.db.VipBean;
import net.vip.db.VipDAO;

public class Vip implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("Vip execute");
		request.setCharacterEncoding("utf-8");
		
		
		//회원 이름 가져오기
		MemberDAO memberdao=new MemberDAO();
		MemberBean memberbean=new MemberBean();
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id"); 

		memberbean=memberdao.getMember(m_id);

		request.setAttribute("memberbean", memberbean);

		
		
		//vip 시네마 영화 정보 가져오기 
		
		VipDAO vipdao=new VipDAO();
		VipBean vipbean=new VipBean();
		
		
		
		
		
		//이동 
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./vip/vip_reservation_test.jsp");
				
		return forward;

	}

}
