package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String requestURI= request.getRequestURI();
		String contextPath=request.getContextPath();
		
		//System.out.println("컨텍스트경로:"+contextPath);
		//System.out.println("컨텍스트경로 길이:"+contextPath.length());
		//						/MemberJoin.me
		// URI					/MemberJoinAction.me
		String command = requestURI.substring(contextPath.length());
		//System.out.println("뽑아온 가상주소 경로 "+command);
		//주소 비교 
		ActionForward forward=null;
		Action action = null;
		
		if(command.equals("/MemberJoin.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/join.jsp");
		
		}else if(command.equals("/MemberJoinAction.me")){
			action= new MemberJoinAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogin.me")) {
				//	./member/loginForm.jsp 이동
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/login.jsp");
			
			}else if(command.equals("/MemberLoginAction.me")){
				action = new MemberLoginAction();
				try {
					forward = action.execute(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/Main.me")) {
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./main/main.jsp");
				
			}else if(command.equals("/EmailCheckAction.me")){
				action = new EmailCheckAction();
				try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			}else if(command.equals("/FindPassword.me")){
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/find_password.jsp");
				
			}else if(command.equals("/FindPassAction.me")){
				action = new FindPassAction();
				try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			}else if(command.equals("/EmailCheck.me")){
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./member/emailsendaction.jsp");
			}else if(command.equals("/MemberLogout.me")){
				action = new MemberLogoutAction();
				try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			}
	
		if(forward!=null) {
			if(forward.isRedirect()) {
				//true이면 response
			response.sendRedirect(forward.getPath());
			}else{
				//false이면 forward
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			
			}
	} 
}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
}

