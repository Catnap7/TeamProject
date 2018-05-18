<%@page import="java.util.List"%>
<%@page import="net.pay.db.PayBean"%>
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
		List<PayBean> AdminPayList = (List)request.getAttribute("AdminPayList");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	%>

	<!-- 헤더영역 -->
	<jsp:include page="../header.jsp" />
	<!-- 헤더영역 -->

	<!-- 어드민 서브메뉴 -->
	<jsp:include page="../admin_sub.jsp" />
	<!-- 어드민 서브메뉴 -->

	<div id="content">
		<h1>pay list [<%=count %>]</h1>

		<div class="admin-search-container">
			<form action="admin_pay_list_search.jsp">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit" class="searchBtn">
					<img src="./images/search.png" width="20px" height="20px">
				</button>
			</form>
		</div>

		<table class="db_list">
			<tr>
				<th class="pay_th1">No</th>
				<th class="pay_th2">ID</th>
				<th class="pay_th4">결제 방식</th>
				<th class="pay_th5">결제일</th>
				<th class="pay_th6">쿠폰만료일</th>
			</tr>
			<%
			
			for(int i = 0; i < AdminPayList.size(); i++) {
				PayBean paybean = AdminPayList.get(i);
				
				%>
				
				<tr>
				<td class="pay_th1"><%=paybean.getP_num() %></td>
				<td class="pay_th2"><%=paybean.getP_id() %></td>
				<td class="pay_th4"><%=paybean.getP_auto() %> 방식</td>
				<td class="pay_th5"><%=paybean.getP_start_day() %></td>
				<td class="pay_th6"><%=paybean.getP_end_day() %></td>
			</tr>
				
				<%
			}
			
			%>
		</table>

		<div class="prev_next">
			<%
				// 이전
				if (startPage > pageBlock) {
			%>
			<a
				href="./AdminMemberListAction.am?pageNum=<%=startPage - pageBlock%>">[이전]</a>
			<%
				}

				// 1~10, 11~20, 21~30
				for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="./AdminMemberListAction.am?pageNum=<%=i%>">[<%=i%>페이지]
			</a>
			<%
				}

				// 다음
				if (endPage < pageCount) {
			%>
			<a
				href="./AdminMemberListAction.am?pageNum=<%=startPage + pageBlock%>">[다음]</a>
			<%
				}
			%>
		</div>

	</div>

	<!-- 푸터 영역 -->
	<jsp:include page="../footer.jsp" />
	<!-- 푸터 영역 -->

</body>
</html>