<%@page import="net.admin.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<title>와츄 : WATCHU</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
</head>
<body>
	<%
		NoticeBean noticebean = (NoticeBean) request.getAttribute("noticebean");
		int n_num = Integer.parseInt(request.getParameter("n_num"));
	%>
	<jsp:include page="../../inc/header.jsp" />
	<jsp:include page="../../inc/admin_sub.jsp" />
	<div id="content">
		<h1 class="adminTitle">관리자 공지사항 글 수정</h1>

		<form action="./AdminNoticeUpdateAction.an?n_num=<%=n_num%>"
			method="post" enctype="multipart/form-data">
			<table border="0" class="db_list_insert">
				<tr>
					<td>제목</td>
					<td><input type="text" name="n_subject"
						value="<%=noticebean.getN_subject()%>"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea cols="100" rows="30" name="n_content"><%=noticebean.getN_content()%></textarea></td>
				</tr>
				<tr>

					<div class="u_admin-notice-write">
						<input type="submit" class="wirtebtn" value="수정">
						<button type="button" class="wirtebtn" onclick="history.back()">돌아가기</button>
					</div>
			</table>
		</form>
	</div>
	<jsp:include page="../../inc/footer.jsp" />
</body>
</html>