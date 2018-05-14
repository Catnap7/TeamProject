<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">

<!--  notice/writeForm.jsp -->
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<!-- 헤더영역 -->
	<jsp:include page="../header.jsp" />
	<!-- 헤더영역 -->

	<nav id="menu_bar">
	<ul>
		<li><a href="./AdminManageList.am">DB</a></li>
		<li><a href="./AdminNoticeList.an">공지</a></li>
		<li><a href="#">채팅</a></li>
		<li><a href="./VipAdmin.vi">VIP관리</a></li>
	</ul>
	</nav>

	<div id="content">
		<h1>Notice Write Form</h1>

		<form action="./AdminNoticeWriteAction.an" method="post">
			<table border="0" class="db_list_insert">
				<tr>
					<td>제목</td>
					<td><input type="text" name="n_subject"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea cols="100" rows="30" name="n_content"></textarea></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="n_image"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="n_file"></td>
				</tr>
				<tr>
					<td><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</div>


	<!-- 푸터 영역 -->
	<jsp:include page="../footer.jsp" />
	<!-- 푸터 영역 -->
</body>
</html>