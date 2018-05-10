package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DeleteCheck execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");											
		//이동 ActionForward 객체 생성    
		// 방식,경로 저장
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./mypage/deletecheck.jsp");				
		return forward;
	}
	
}
