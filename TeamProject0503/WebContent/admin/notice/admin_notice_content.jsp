<%@page import="net.admin.notice.db.NoticeBean"%>
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
<%

NoticeBean noticebean = (NoticeBean)request.getAttribute("noticebean");

%>

	<!-- 헤더영역 -->
	<jsp:include page="../../inc/header.jsp" />
	<!-- 헤더영역 -->

<!-- 어드민 서브메뉴 -->
<jsp:include page="../admin_sub.jsp"/>
<!-- 어드민 서브메뉴 -->

	<div id="content">
		<h1>notice content</h1>
		<table class="db_list">
			<tr>
				<th class="th1">No</th>
				<th class="th2">제목</th>
				<th class="th3">작성자</th>
				<th class="th4">조회수</th>
				<th class="th5">작성일</th>
			</tr>
			<tr>
				<td><%=noticebean.getN_num() %></td>
				<td><%=noticebean.getN_subject() %></td>
				<td></td>
				<td><%=noticebean.getN_readcount() %></td>
				<td><%=noticebean.getN_date() %></td>
			</tr>
			<tr>
				<th colspan="5" class="th5">내용</th>
			</tr>
			<tr>
				<td colspan="5"><%=noticebean.getN_content() %></td>
			</tr>
			<tr>
				<th colspan="3" class="th5">이미지</th>
				<th colspan="2" class="th5">파일</th>
			</tr>
			<tr>
				<td colspan="3"><input type="image" src="<%=noticebean.getN_image() %>"></td>
				<td colspan="2"><%=noticebean.getN_file() %></td>
			</tr>

		</table>

		<div class="admin-notice-write">
			<form action="./AdminNoticeUpdate.an">
				<button type="submit" class="wirtebtn">글수정</button>
			</form>
			<form action="./AdminNoticeDelete.an">
				<button type="submit" class="wirtebtn">글삭제</button>
			</form>
		</div>
		<div class="admin-notice-write"></div>
	</div>

	<!-- 푸터 영역 -->
	<jsp:include page="../../inc/footer.jsp" />
	<!-- 푸터 영역 -->

</body>
</html>