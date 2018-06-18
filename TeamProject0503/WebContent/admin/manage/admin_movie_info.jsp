<%@page import="net.admin.manage.db.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<title>Movie Information</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">

<!--  border/writeForm.jsp -->
</head>
<%

MovieBean movieBean = (MovieBean)request.getAttribute("movieBean");

%>
<body>
	<!-- 헤더영역 -->
	<jsp:include page="../../inc/header.jsp" />
	<!-- 헤더영역 -->

	<!-- 어드민 서브메뉴 -->
	<jsp:include page="../../inc/admin_sub.jsp" />
	<!-- 어드민 서브메뉴 -->

	<section class="content_member">
	<div id="content">
	<form action="./AdminMovieUpdate.am?mv_num=<%=movieBean.getMv_num() %>">
			<table class="db_list db_list_mv">
				<tr>
					<th>제목(한글)</th>
					<td><%=movieBean.getMv_kor_title() %></td>
				</tr>
				<tr>
					<th>제목(영문)</th>
					<td><%=movieBean.getMv_eng_title() %></td>
				</tr>
				<tr>
					<th>개봉년도</th>
					<td><%=movieBean.getMv_year() %></td>
				</tr>
				<tr>
					<th>국내 | 해외</th>
					<td><%=movieBean.getMv_country() %></td>
				</tr>
				<tr>
					<th>관람등급</th>
					<td><%=movieBean.getMv_age() %></td>
				</tr>
				<tr>
					<th>장르</th>
					<td><%=movieBean.getMv_genre() %></td>
				</tr>
				<tr>
					<th>상영시간</th>
					<td><%=movieBean.getMv_time() %></td>
				</tr>
				<tr>
					<th>감독</th>
					<td><%=movieBean.getMv_director() %></td>
				</tr>
				<tr>
					<th>출연</th>
					<td><%=movieBean.getMv_actor() %></td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td><textarea cols="155" rows="10" name="mv_story" readonly="readonly"><%=movieBean.getMv_story() %></textarea></td>
				</tr>
				<tr>
					<th>예고편 링크</th>
					<td><a href="<%=movieBean.getMv_video() %>" target="_blank"><%=movieBean.getMv_video() %></a></td>
				</tr>
			</table>
			<div class="mv_btn">
			<input type="button" value="수정하기"onclick="location.href('./AdminMovieUpdate.am?mv_num=<%=movieBean.getMv_num() %>')">
			<input type="button" value="삭제하기" onclick="location.href('./AdminMovieDelete.am?mv_num=<%=movieBean.getMv_num() %>')">
			<input type="button" value="돌아가기" onclick="history.back()">
			</div>
			</form>
	</div>
	</section>

	<!-- 푸터 영역 -->
	<jsp:include page="../../inc/footer.jsp" />
	<!-- 푸터 영역 -->
</body>
</html>