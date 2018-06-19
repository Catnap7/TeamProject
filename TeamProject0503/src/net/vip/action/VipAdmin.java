package net.vip.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.vip.db.VipBean;
import net.vip.db.VipDAO;
import net.vip.db.VipResBean;
import net.vip.db.VipResDAO;

public class VipAdmin implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("VipAdmin execute");
		request.setCharacterEncoding("utf-8");
		
		//vip 시네마 영화 정보 가져오기 
		VipDAO vipdao=new VipDAO();
		VipBean vipbean=new VipBean();
		vipbean=vipdao.getVipMovie(); 

		//예약 여부 가져오기
		VipResBean vipresbean=new VipResBean();
		VipResDAO vipresdao=new VipResDAO();
		List<VipResBean> VipSeatTakenList = (List)vipresdao.getVipSeatTakenList();
		
		//vip멤버 리스트 가져오기
		MemberBean memberbean = new MemberBean();
		Vector vector=new Vector();

		vector = vipdao.getVipMemberList();
		
		List vipMemberList=(List)vector.get(0);
		List seatList=(List)vector.get(1);
		
		
		request.setAttribute("memberbean", memberbean);
		request.setAttribute("vipresbean", vipresbean);
		request.setAttribute("vipbean", vipbean);
		request.setAttribute("VipSeatTakenList", VipSeatTakenList);
		request.setAttribute("vipMemberList", vipMemberList);
		request.setAttribute("seatList", seatList);
		
		 
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./vip/VipAdmin.jsp");
				
		return forward;

	}

}
