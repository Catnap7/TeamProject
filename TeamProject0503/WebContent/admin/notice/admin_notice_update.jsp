<%@page import="net.admin.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
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
	NoticeBean noticebean = (NoticeBean)request.getAttribute("noticebean");
	int n_num = Integer.parseInt(request.getParameter("n_num"));
	%>
	<!-- 헤더영역 -->
	<jsp:include page="../../inc/header.jsp" />
	<!-- 헤더영역 -->

<!-- 어드민 서브메뉴 -->
<jsp:include page="../../inc/admin_sub.jsp"/>
<!-- 어드민 서브메뉴 -->

	<div id="content">
		<h1>Notice Update Form</h1>

		<form action="./AdminNoticeUpdateAction.an?n_num=<%=n_num %>" method="post" enctype="multipart/form-data">
			<table border="0" class="db_list_insert">
				<tr>
					<td>제목</td>
					<td><input type="text" name="n_subject" value="<%=noticebean.getN_subject() %>"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea cols="100" rows="30" name="n_content"><%=noticebean.getN_content() %></textarea></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="n_image" value="<%=noticebean.getN_image() %>"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="n_file" value="<%=noticebean.getN_file() %>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="수정"></td>
					<td><button type="button" onclick="history.back()">돌아가기</button></td>
				</tr>
			</table>
		</form>
	</div>


	<!-- 푸터 영역 -->
	<jsp:include page="../../inc/footer.jsp" />
	<!-- 푸터 영역 -->
</body>
</html>