<%@page import="net.category.db.ReviewBean"%>
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
		List<ReviewBean> AdminReviewList = (List)request.getAttribute("AdminReviewList");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	%>
	<script type="text/javascript">
		function del(r_num) {
			if (confirm("정말로 삭제하시겠습니까?") == true) {
				location.href = "./AdminReviewDelete.am?r_num="+r_num;
			}
		}
	</script>

	<!-- 헤더영역 -->
	<jsp:include page="../header.jsp" />
	<!-- 헤더영역 -->

<!-- 어드민 서브메뉴 -->
<jsp:include page="../admin_sub.jsp"/>
<!-- 어드민 서브메뉴 -->

	<div id="content">
		<h1>review list [<%=count %>]</h1>

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
				<th class="rv_th3">댓글 내용</th>
				<th class="rv_th4">신고횟수</th>
				<th class="rv_th5">작성일</th>
				<th class="rv_th6">댓글삭제</th>
			</tr>
			<%
			
			for(int i = 0; i < AdminReviewList.size(); i++) {
				ReviewBean arb = (ReviewBean)AdminReviewList.get(i);
				%>


			<tr>
				<td><%=arb.getR_id() %></td>
				<td><%=arb.getR_content() %></td>
				<td><%=arb.getR_report() %></td>
				<td><%=arb.getR_date() %></td>
				<td><a href="javascript:del('<%=arb.getR_num() %>')">삭제</a></td>
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
				href="./AdminReviewListAction.am?pageNum=<%=startPage - pageBlock%>">[이전]</a>
			<%
				}

				// 1~10, 11~20, 21~30
				for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="./AdminReviewListAction.am?pageNum=<%=i%>">[<%=i%>페이지]
			</a>
			<%
				}

				// 다음
				if (endPage < pageCount) {
			%>
			<a
				href="./AdminReviewListAction.am?pageNum=<%=startPage + pageBlock%>">[다음]</a>
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