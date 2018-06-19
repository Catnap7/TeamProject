<%@page import="net.vip.db.VipBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄 : WATCHU</title>
<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip_admin.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body>
<%VipBean vipbean =(VipBean)request.getAttribute("vipbean"); 

	String age = "";
	switch(vipbean.getV_age()){
	case 0  : age="전체이용가"; break;
	case 12	: age="12세이용가"; break;
	case 15	: age="15세이용가"; break;
	case 19 : age="청소년관람불가"; break;
	}
%>
				


<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<!-- vip 서브메뉴 -->
<jsp:include page="../vip/vipAdmin_sub.jsp"/>
<!-- vip 서브메뉴 -->

<div id="movieContent">		
	<h1  class="adminTitle">VIP영화 상세보기</h1>	
	
	<table class="movieContent">
		<tr>
			<th><%=vipbean.getV_kor_title()%></th>
		</tr>
		<tr>
			<td><%=vipbean.getV_eng_title()%></td>
			<td><%=vipbean.getV_year()%>년도</td>
			<td><%=age%></td>
		</tr>
		<tr>	
			<td><%=vipbean.getV_director()%> 감독</td><td colspan="2"><%=vipbean.getV_actor()%></td>
		</tr>	
		<tr>
			<td><%=vipbean.getV_country()%></td>
			<td><%=vipbean.getV_genre()%></td>
			<td><%=vipbean.getV_time()%>분</td>
		</tr>
		
		<tr>
			<td colspan="1">시사회 날짜 [<%=vipbean.getV_date()%>]</td>
			<td colspan="2">시사회 시간 [<%=vipbean.getV_when()%>]</td>
		</tr>
		<tr>
			<th colspan="3">줄거리</th>
		</tr>
		<tr>
			<td colspan="3" id="needsPadding"><%=vipbean.getV_story() %></td>
		</tr>
		<tr>
			<th colspan="1">review 1</th>
			<td colspan="2"> <%=vipbean.getV_critic_1_by() %></td>
		</tr>
		<tr>
			<td colspan="3" id="needsPadding"><%=vipbean.getV_critic_1() %></td>
		</tr>
		<tr>
			<th colspan="1">review 2</th>
			<td colspan="2"> <%=vipbean.getV_critic_2_by() %></td>
		</tr>
		<tr>
			<td colspan="3" id="needsPadding"><%=vipbean.getV_critic_2() %></td>
		</tr>
		<tr>
			<th colspan="3">VOD</th>
		</tr>
		<tr>
			<td colspan="3" id="needsPadding"><iframe width="1040px" height="760px" src="<%=vipbean.getV_video()%>" allowfullscreen frameborder="0" scrolling="no"></iframe></td>
		</tr>	
	</table>

	<!-- 수정/삭제 버튼 -->
	<div class="vip_movie_btn">
		<a href="./VipMovieModify.vi?v_num=<%=vipbean.getV_num()%>" class="wirtebtn">수정</a>
		<a href="./VipMovieDelete.vi?v_num=<%=vipbean.getV_num()%>" class="wirtebtn">삭제</a>
	</div>
	<!-- 수정/삭제 버튼 -->

</div><!-- content -->

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>