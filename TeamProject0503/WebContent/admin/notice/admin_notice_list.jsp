<%@page import="net.admin.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : WATCHU</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		List<NoticeBean> AdminNoticeList = (List) request.getAttribute("AdminNoticeList");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
		String name = (String) session.getAttribute("m_name");
	%>
	<jsp:include page="../../inc/header.jsp" />
	<jsp:include page="../../inc/admin_sub.jsp" />
	<article>
	<div id="content">
		<h1 class="adminTitle">공지사항</h1>
		<table class="db_list">
			<tr>
				<th class="th1">No</th>
				<th class="th2">제목</th>
				<th class="th5">작성일</th>
			</tr>
			<%
				if (AdminNoticeList == null) {
			%>
			<tr>
				<td colspan="5">공지사항 없습니다.</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < AdminNoticeList.size(); i++) {
						NoticeBean nb = (NoticeBean) AdminNoticeList.get(i);
			%>
			<tr>
				<td><%=nb.getN_num()%></td>
				<td><a href="./AdminNoticeContent.an?n_num=<%=nb.getN_num()%>"><%=nb.getN_subject()%></a></td>
				<td><%=nb.getN_date()%></td>
			</tr>
			<%
				}
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
				if (startPage > pageBlock) {
			%>
			<a href="./AdminNoticeList.am?pageNum=<%=startPage - pageBlock%>">[이전]</a>
			<%
				}
				for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="./AdminNoticeList.am?pageNum=<%=i%>"> <%
 			int pageNumm = Integer.parseInt(pageNum);
 				if (pageNumm == i) {
 			%> <span class="thisPage"><%=i%></span> <%
 			} else {
 			%> <span class="normalPage"><%=i%></span> <%
 			}
 			%>
			</a>
			<%
				}
				if (endPage < pageCount) {
			%>
			<a href="./AdminNoticeList.am?pageNum=<%=startPage + pageBlock%>">[다음]</a>
			<%
				}
			%>
		</div>
	</article>
	<jsp:include page="../../inc/footer.jsp" />
</body>
</html>