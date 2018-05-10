<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄: VIP</title>


<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="../js/jquery-3.3.1.js"></script>

  
<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body>


<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->




<!-- 아티클 영역 -->
<article>

<%
String id=(String)session.getAttribute("m_id");

if(id==null){
	response.sendRedirect("./MemberLogin.me");
}

MemberBean memberbean=(MemberBean)request.getAttribute("memberbean");
int m_grade=memberbean.getM_grade();

String grade="";

if(m_grade==1 || m_grade==0){
	grade="준회원";
}else if(m_grade==2){
	grade="VIP";
	%>
	<a href="./Vip.vi">VIP페이지로 가기</a>
<%} %>




vipinfo

<%="회원님의 등급은 "+grade+"입니다"%>



</article>
<!-- 아티클 영역 -->





<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->



</body>
</html>