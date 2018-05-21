<%@page import="net.vip.db.VipBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VIP 영화 목록</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<!-- vip 서브메뉴 -->
<jsp:include page="../vip/vipAdmin_sub.jsp"/>
<!-- vip 서브메뉴 -->


<%
	request.setCharacterEncoding("utf-8");
	
	List<VipBean> vipMovieList = (List)request.getAttribute("vipMovieList");
	int count = ((Integer) request.getAttribute("count")).intValue();
	String pageNum = (String) request.getAttribute("pageNum");
	int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
	int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();	
%>

<div id="content">
	<h1>
		VIP 시사회 영화 목록 [<%=count %>]
	</h1>	
	배우, 줄거리, 리뷰등은 목록에 나타나지 않습니다. 영화 상세 보기로 들어가야함.
	
	<table class="vip_db_list">
		<tr>
			<th>번호</th><th>한글제목</th><th>영문제목</th><th>년도</th><th>국가</th>
			<th>관람등급</th><th>장르</th><th>감독</th><th>주연</th><th>시사회 날짜</th><th>시사회 시간</th>
		</tr>
		
		<%for(int i=0;i<vipMovieList.size();i++){
			VipBean vipbean =(VipBean)vipMovieList.get(i);%>
		<tr>
			<td><%=vipbean.getV_num()%></td><td><%=vipbean.getV_kor_title()%></td>
			<td><%=vipbean.getV_eng_title()%></td><td><%=vipbean.getV_year()%></td>
			<td><%=vipbean.getV_country()%></td><td><%=vipbean.getV_age()%></td>
			<td><%=vipbean.getV_genre()%></td><td><%=vipbean.getV_director()%></td>
			<td><%=vipbean.getV_actor()%></td><td><%=vipbean.getV_date()%></td>
			<td><%=vipbean.getV_when()%></td>
		</tr>
		<%} %>
	</table>
	
	
	<!-- 페이징 -->
	<div class="prev_next">
		<%// 이전
			if (startPage > pageBlock) {%>
			<a href="./AdminNoticeList.am?pageNum=<%=startPage - pageBlock%>">[이전]</a>
			<%}
				// 1~10, 11~20, 21~30
				for (int i = startPage; i <= endPage; i++) {%>
				<a href="./AdminNoticeList.am?pageNum=<%=i%>">[<%=i%>]</a>
			<%}
				// 다음
				if (endPage < pageCount) {%>
			<a href="./AdminNoticeList.am?pageNum=<%=startPage + pageBlock%>">[다음]</a>
			<%}
			%>
	</div>
	<!-- 페이징 -->
	
	
</div><!-- content -->


<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>