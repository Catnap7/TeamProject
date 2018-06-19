package net.roulette.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.member.db.MemberDAO;
import net.roulette.db.rouletteDAO;

public class RouletteAction implements Action{

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
		
		MemberDAO mdao= new MemberDAO();
		
		List<Double>chancelist = rdao.getChances(ro_id);
		int check= mdao.checkChance(ro_id);

		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
//		자바빈 id변수 <= 첫행 id 열데이터 가져와서 저장
//		obj.put("이름",디비내용);
		obj.put("ten",chancelist.get(0));
		obj.put("fif",chancelist.get(1));
		obj.put("hun",chancelist.get(2));
		obj.put("checknum",check);
//		배열변수 한 칸 저장 <= 한 사람의 정보(자바빈)
		arr.add(obj);
		
		PrintWriter out;
		response.setContentType("application/json;charset=utf-8");
		out=response.getWriter();
		out.println(arr);		
		out.close();		
		return null;
	}
	
}
