<%@page import="net.vip.db.VipBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VIP 영화 목록</title>
</head>
<body>
	<h2>VIP 영화 목록</h2>

<%
	request.setCharacterEncoding("utf-8");
	
	List<VipBean> vipMovieList = (List)request.getAttribute("vipMovieList");
	
%>
	<table border="1">
		<tr>
			<td>번호</td><td>한글제목</td><td>영문제목</td><td>년도</td><td>국가</td>
			<td>관람등급</td><td>장르</td><td>감독</td><td>주연</td>
		</tr>
		
		<%for(int i=0;i<vipMovieList.size();i++){
			VipBean vipbean =(VipBean)vipMovieList.get(i);%>
		<tr>
			<td><%=vipbean.getV_num()%></td><td><%=vipbean.getV_kor_title()%></td>
			<td><%=vipbean.getV_eng_title()%></td><td><%=vipbean.getV_year()%></td>
			<td><%=vipbean.getV_country()%></td><td><%=vipbean.getV_age()%></td>
			<td><%=vipbean.getV_genre()%></td><td><%=vipbean.getV_director()%></td>
			<td><%=vipbean.getV_actor()%></td>
		</tr>
		<%} %>
	</table>

</body>
</html>