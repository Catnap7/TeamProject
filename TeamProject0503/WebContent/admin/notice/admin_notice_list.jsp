<%@page import="net.admin.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
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
		List<NoticeBean> AdminNoticeList = (List) request.getAttribute("AdminNoticeList");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
		String name = (String)session.getAttribute("m_name");
	%>

	<!-- 헤더영역 -->
	<jsp:include page="../../inc/header.jsp" />
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
		<h1>
			notice [<%=count %>]
		</h1>
		<table class="db_list">
			<tr>
				<th class="th1">No</th>
				<th class="th2">제목</th>
				<th class="th3">작성자</th>
				<th class="th4">조회수</th>
				<th class="th5">작성일</th>
			</tr>
			<%
				for (int i = 0; i < AdminNoticeList.size(); i++) {
					NoticeBean nb = (NoticeBean) AdminNoticeList.get(i);
			%>

			<tr>
				<td><%=nb.getN_num() %></td>
				<td><a href="#"><%=nb.getN_subject() %></a></td>
				<td><%=name %></td>
				<td>1</td>
				<td><%=nb.getN_date() %></td>
			</tr>

			<%
				}
			%>

		</table>

		<div class="admin-notice-write">
			<form action="./AdminNoticeWrite.an">
				<button type="submit" class="wirtebtn">글쓰기</button>
			</form>
		</div>

		<div class="prev_next">
			<%
				// 이전
				if (startPage > pageBlock) {
			%>
			<a
				href="./AdminNoticeList.am?pageNum=<%=startPage - pageBlock%>">[이전]</a>
			<%
				}

				// 1~10, 11~20, 21~30
				for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="./AdminNoticeList.am?pageNum=<%=i%>">[<%=i%>페이지]
			</a>
			<%
				}

				// 다음
				if (endPage < pageCount) {
			%>
			<a
				href="./AdminNoticeList.am?pageNum=<%=startPage + pageBlock%>">[다음]</a>
			<%
				}
			%>
		</div>
	</div>

	<!-- 푸터 영역 -->
	<jsp:include page="../../inc/footer.jsp" />
	<!-- 푸터 영역 -->

</body>
</html>