<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="net.roulette.db.rouletteDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");
	String c_name = request.getParameter("c_name");	
	rouletteDAO rdao = new rouletteDAO();
	rdao.downRoulette(id, c_name);
%>

