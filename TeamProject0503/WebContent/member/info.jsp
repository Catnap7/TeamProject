<%@page import="net.member.db.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");
//문자열 = 폼 파라미터 가져오기
String m_id=(String)session.getAttribute("m_id");

if(m_id==null){
	response.sendRedirect("./MemberLogin.me");
}
//저장된 mb정보 가져오기
	MemberBean memberbean= (MemberBean)request.getAttribute("memberbean");

%>


<h1>회원정보조회</h1>

아이디:<%=memberbean.getM_id() %> <br>
비밀번호:<%=memberbean.getM_pass() %> <br>
이름:<%=memberbean.getM_name() %> <br>
가입날짜:<%=memberbean.getM_reg_date() %> <br> 

<a href="main.jsp">메인화면으로이동</a>

</body>
</html>