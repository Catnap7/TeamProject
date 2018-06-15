<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<title>WATCHU DB INSERT</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">

<!--  border/writeForm.jsp -->
</head>
<body>
	<!-- 헤더영역 -->
	<jsp:include page="../../inc/header.jsp" />
	<!-- 헤더영역 -->

	<!-- 어드민 서브메뉴 -->
	<jsp:include page="../../inc/admin_sub.jsp" />
	<!-- 어드민 서브메뉴 -->

	<section class="content_member">
	<div id="content">
		<h1 class="adminTitle">영화 등록</h1>
		<form action="./AdminMovieInsertAction.am" method="post">
			<table class="db_list db_list_mv">
				<tr>
					<th>제목(한글)</th>
					<td><input type="text" name="mv_kor_title"></td>
				</tr>
				<tr>
					<th>제목(영문)</th>
					<td><input type="text" name="mv_eng_title"></td>
				</tr>
				<tr>
					<th>개봉년도</th>
					<td><input type="text" name="mv_year"></td>
				</tr>
				<tr>
					<th>국내 | 해외</th>
					<td><input type="text" name="mv_country"></td>
				</tr>
				<tr>
					<th>관람등급</th>
					<td><input type="text" name="mv_age"></td>
				</tr>
				<tr>
					<th>장르</th>
					<td><input type="text" name="mv_genre"></td>
				</tr>
				<tr>
					<th>상영시간</th>
					<td><input type="text" name="mv_time"></td>
				</tr>
				<tr>
					<th>감독</th>
					<td><input type="text" name="mv_director"></td>
				</tr>
				<tr>
					<th>출연</th>
					<td><input type="text" name="mv_actor"></td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td><textarea cols="35" rows="10" name="mv_story"></textarea>
				</tr>
				<tr>
					<th>예고편 링크</th>
					<td><input type="text" name="mv_video"></td>
				</tr>
			</table>
			<div class="mv_btn">
			<input type="submit" value="입력하기">
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