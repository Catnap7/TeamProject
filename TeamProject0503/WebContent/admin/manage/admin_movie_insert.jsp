<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<title>왓츄 영화 DB입력</title>

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

	<div id="content">
		<h1>영화 등록</h1>
		<form action="./AdminMovieInsertAction.am" method="post">
			<table border="0" class="db_list_insert">
				<tr>
					<td>제목(한글)</td>
					<td><input type="text" name="mv_kor_title"></td>
				</tr>
				<tr>
					<td>제목(영문)</td>
					<td><input type="text" name="mv_eng_title"></td>
				</tr>
				<tr>
					<td>개봉년도</td>
					<td><input type="text" name="mv_year"></td>
				</tr>
				<tr>
					<td>국내 | 해외</td>
					<td><input type="text" name="mv_country"></td>
				</tr>
				<tr>
					<td>관람등급</td>
					<td><input type="text" name="mv_age"></td>
				</tr>
				<tr>
					<td>장르</td>
					<td><input type="text" name="mv_genre"></td>
				</tr>
				<tr>
					<td>상영시간</td>
					<td><input type="text" name="mv_time"></td>
				</tr>
				<tr>
					<td>감독</td>
					<td><input type="text" name="mv_director"></td>
				</tr>
				<tr>
					<td>출연</td>
					<td><input type="text" name="mv_actor"></td>
				</tr>
				<tr>
					<td>줄거리</td>
					<td><textarea cols="40" rows="10" name="mv_story"></textarea>
				</tr>
				<tr>
					<td>예고편 링크</td>
					<td><input type="text" name="mv_video"></td>
				</tr>
				<tr>
					<td><input type="submit" value="글쓰기"></td>
					<td><input type="button" value="돌아가기" onclick="history.back()"></td>
				</tr>
			</table>
		</form>
	</div>


	<!-- 푸터 영역 -->
	<jsp:include page="../../inc/footer.jsp" />
	<!-- 푸터 영역 -->
</body>
</html>