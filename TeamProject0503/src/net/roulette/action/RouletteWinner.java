package net.roulette.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.roulette.db.rouletteDAO;

public class RouletteWinner implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RouletteWinner execute()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session= request.getSession();
		String ro_id=(String)session.getAttribute("m_id");
				
		if(ro_id==null){
			ActionForward forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		
		String id= request.getParameter("id");
		String c_name = request.getParameter("c_name");	
		rouletteDAO rdao = new rouletteDAO();
		rdao.downRoulette(id, c_name);
		return null;
	}
}
