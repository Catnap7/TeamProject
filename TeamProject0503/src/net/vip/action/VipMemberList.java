package net.vip.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.vip.db.VipDAO;

public class VipMemberList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminMemberListAction execute()");
		
		VipDAO vipdao=new VipDAO();

		List<MemberBean> vipMemberList = vipdao.getVipMemberList();
		
		request.setAttribute("vipMemberList", vipMemberList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./vip/vip_member_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
