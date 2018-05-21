<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="net.roulette.db.rouletteDAO"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");
	
	MemberDAO mdao= new MemberDAO();
	rouletteDAO rdao = new rouletteDAO();

	List <Double>chancelist = rdao.getChances(id);
	int check= mdao.checkChance(id);

	JSONArray arr = new JSONArray();
	JSONObject obj = new JSONObject();
//	자바빈 id변수 <= 첫행 id 열데이터 가져와서 저장
//	obj.put("이름",디비내용);
	obj.put("ten",chancelist.get(0));
	obj.put("fif",chancelist.get(1));
	obj.put("hun",chancelist.get(2));
	obj.put("checknum",check);
//	배열변수 한 칸 저장 <= 한 사람의 정보(자바빈)
	arr.add(obj);
%>

<%=arr%>