package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
				System.out.println("UpdateCheck execute()");
				//한글처리
				request.setCharacterEncoding("utf-8");											
				//이동 ActionForward 객체 생성    
				// 방식,경로 저장
				ActionForward forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./mypage/updatecheck.jsp");				
				return forward;
	}
	
}
