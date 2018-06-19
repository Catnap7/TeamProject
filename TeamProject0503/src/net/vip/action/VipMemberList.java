package net.vip.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.vip.db.VipDAO;

public class VipMemberList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		String id=(String)session.getAttribute("m_id");
		if(id==null){
			ActionForward forward= new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		Vector vector=new Vector();
		VipDAO vipdao=new VipDAO();

		vector = vipdao.getVipMemberList();
		
		List vipMemberList=(List)vector.get(0);
		List seatList=(List)vector.get(1);
		
		
		request.setAttribute("vipMemberList", vipMemberList);
		request.setAttribute("seatList", seatList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./vip/vip_member_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
