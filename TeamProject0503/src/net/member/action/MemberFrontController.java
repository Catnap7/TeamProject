package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String requestURI= request.getRequestURI();
		String contextPath=request.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
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
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogin.me")) {
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
			
	}
	else if(command.equals("/MemberLogout.me")){
		action = new MemberLogoutAction();
		try {
			forward = action.execute(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}else if(command.equals("/EmailCheckAction.me")){
			action = new EmailCheckAction();
			try {
			forward = action.execute(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		}else if(command.equals("/FindPass.me")){
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
		
		}else if(command.equals("/EmailSend.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/emailsendaction.jsp");
			
		}else if(command.equals("/MemeberNameDup.me")){
			action = new MemberNameDup();
			try {
			forward = action.execute(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		}else if(command.equals("/MemeberIdDup.me")){
			action = new MemberIdDup();
			try {
			forward = action.execute(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		}
		
	if(forward!=null) {
			if(forward.isRedirect()) {
			
			response.sendRedirect(forward.getPath());
			}else{
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
	} 
}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
