<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VIP 멤버 리스트</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip_admin.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	List<MemberBean> vipMemberList = (List)request.getAttribute("vipMemberList");
%>
<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<!-- vip 서브메뉴 -->
<jsp:include page="../vip/vipAdmin_sub.jsp"/>
<!-- vip 서브메뉴 -->

<div id="content">
	<h1>VIP 멤버 목록</h1>	

	<table class="vip_db_list">
		<tr>
			<th>아이디</th><th>이름</th><th>등급</th><th>생년월일</th><th>가입일</th>
		</tr>
		
		<%for(int i=0;i<vipMemberList.size();i++){
			MemberBean memberbean =(MemberBean)vipMemberList.get(i);	
		%>
		<tr>
			<td><%=memberbean.getM_id()%></td><td><%=memberbean.getM_name()%></td>
			<td><%=memberbean.getM_grade()%></td><td><%=memberbean.getM_id_num1()%></td>
			<td><%=memberbean.getM_reg_date()%></td>
		</tr>
		<%} %>
	</table>
</div>




</body>
</html>