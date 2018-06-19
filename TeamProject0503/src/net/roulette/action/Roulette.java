package net.roulette.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.roulette.db.rouletteDAO;


public class Roulette implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");	
		
		HttpSession session= request.getSession();
		String ro_id=(String)session.getAttribute("m_id");
		rouletteDAO rdao = new rouletteDAO();
		
		if(ro_id==null){
			ActionForward forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
																
		ActionForward forward= new ActionForward();
		forward.setPath("./roulette/roulette.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
