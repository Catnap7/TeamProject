<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");

	MemberDAO mdao= new MemberDAO();
//	int check= idcheck(id)
//	check==1 out.println("아이디 중복")
//	check==0 out.println("선택한 아이디는 사용가능합니다.")	

	int check= mdao.idCheck(id);
	if(check==1){
		out.println("0");
	}else{
		out.println("1");

	}
%>
