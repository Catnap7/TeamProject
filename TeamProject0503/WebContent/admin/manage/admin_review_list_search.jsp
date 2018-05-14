<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- 헤더영역 -->
	<jsp:include page="../header.jsp" />
	<!-- 헤더영역 -->

<!-- 어드민 서브메뉴 -->
<jsp:include page="../admin_sub.jsp"/>
<!-- 어드민 서브메뉴 -->

	<div id="content">
		<h1>review list</h1>

		<div class="admin-search-container">
			<form action="admin_review_list_search.jsp">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit" class="searchBtn">
					<img src="./images/search.png" width="20px" height="20px">
				</button>
			</form>
		</div>

		<table class="db_list">
			<tr>
				<th class="rv_th1">ID</th>
				<th class="rv_th2">닉네임</th>
				<th class="rv_th3">댓글 내용</th>
				<th class="rv_th4">신고횟수</th>
				<th class="rv_th5">댓글단날</th>
				<th class="rv_th6">댓글삭제</th>
			</tr>
			<tr>
				<td>TEST</td>
				<td>TEST</td>
				<td>TEST</td>
				<td>TEST</td>
				<td>TEST</td>
				<td><a href="#">삭제</a></td>
			</tr>
		</table>

		<div class="prev_next">
			<a href="#">prev</a> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
			<a href="#">next</a>
		</div>
	</div>

	<!-- 푸터 영역 -->
	<jsp:include page="../footer.jsp" />
	<!-- 푸터 영역 -->

</body>
</html>