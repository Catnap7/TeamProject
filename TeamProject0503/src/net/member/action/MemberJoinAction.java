package net.member.action;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xml.internal.utils.SystemIDResolver;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public  class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("utf-8");
		// 자바빈 MemberBean mb 객체생성
		MemberBean memberbean = new MemberBean();
		// 자바빈 멤버변수 <--폼파라미터 가져와서 저장
		memberbean.setM_id(request.getParameter("m_id"));
		memberbean.setM_pass(request.getParameter("m_pass"));
		memberbean.setM_name(request.getParameter("m_name"));
		memberbean.setM_id_num1(Integer.parseInt(request.getParameter("m_num1")));
		memberbean.setM_id_num2(Integer.parseInt(request.getParameter("m_num2")));
		memberbean.setM_reg_date(new Date(System.currentTimeMillis()));
		MemberDAO memberdao = new MemberDAO();
		memberdao.insertMember(memberbean);
		
		String m_id = request.getParameter("m_id"); 
		HttpSession session = request.getSession();
		session.setAttribute("m_id", m_id);
		
		
		//이동 ActionForward forward 객체생성
		ActionForward forward= new ActionForward();
		//방식, 경로 저장 "./MemberLogin.me" 저장
		forward.setRedirect(false);
		forward.setPath("./EmailCheck.me");
		
		return forward;
	}
}
