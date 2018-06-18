package net.vip.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.vip.db.VipBean;
import net.vip.db.VipDAO;
import net.vip.db.VipResBean;
import net.vip.db.VipResDAO;

public class Vip implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("Vip execute");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		
		
		//회원 정보 가져오기
		MemberDAO memberdao=new MemberDAO();
		MemberBean memberbean=new MemberBean();
		
		String m_id = (String)session.getAttribute("m_id"); 

		if(m_id==null){
			ActionForward forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		memberbean=memberdao.getMember(m_id);
		int grade=memberbean.getM_grade();
		String name=memberbean.getM_name();
		

		
		
		//vip 시네마 영화 정보 가져오기 
		VipDAO vipdao=new VipDAO();
		VipBean vipbean=new VipBean();
		vipbean=vipdao.getVipMovie(); 

		int v_num=vipbean.getV_num();

		
		//예약 여부 가져오기
		VipResBean vipresbean=new VipResBean();
		VipResDAO vipresdao=new VipResDAO();
		List<VipResBean> VipSeatTakenList = (List)vipresdao.getVipSeatTakenList();
		
		//VipSeatTakenListCheck
		int check=vipresdao.VipSeatTakenListCheck(m_id);
		
		vipresbean=vipresdao.getYourSeat(m_id);
		
		String selectedSeat=request.getParameter("seat");
		
		request.setAttribute("memberbean", memberbean);
		request.setAttribute("vipresbean", vipresbean);
		request.setAttribute("vipbean", vipbean);
		request.setAttribute("VipSeatTakenList", VipSeatTakenList);
		request.setAttribute("v_num", v_num);
		request.setAttribute("check", check);
		request.setAttribute("selectedSeat", selectedSeat);
		
		//이동 
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./vip/vip_reservation.jsp");
				
		return forward;

	}

}
