<%@page import="net.member.db.MemberBean"%>
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
		List<MemberBean> AdminMemberList = (List) request.getAttribute("AdminMemberList");
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	%>
	<script type="text/javascript">
		function del(id) {
			if (confirm("정말로 내보내시겠습니까?") == true) {
				location.href = "./AdminMemberDeleteAction.am?id=" + id;
			}
		}
	</script>
	<!-- 헤더영역 -->
	<jsp:include page="../header.jsp" />
	<!-- 헤더영역 -->

	<nav id="menu_bar">
	<ul>
		<li><a href="./AdminManageList.am">DB</a></li>
		<li><a href="../notice/admin_notice_list.jsp">공지</a></li>
		<li><a href="#">채팅</a></li>
	</ul>
	</nav>

	<div id="content">
		<h1>
			member list [<%=count%>]
		</h1>

		<div class="search_type">
			<select>
				<option>ID</option>
				<option>닉네임</option>
				<option>등급</option>
			</select>
		</div>

		<div class="admin-search-container">
			<form action="./AdminMemberSearch.am">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit" class="searchBtn">
					<img src="../../images/search.png" width="20px" height="20px">
				</button>
			</form>
		</div>

		<div class="orderby">
			<a href="./AdminMemberSort.am?sort=1">이름순</a> | <a href="./AdminMemberSort.am?sort=2">등급순</a> | <a href="./AdminMemberSort.am?sort=3">가입순</a>
		</div>

		<table class="db_list">
			<tr>
				<th class="th2">ID</th>
				<th class="th3">닉네임</th>
				<th class="th4">회원등급</th>
				<th class="th5">가입일</th>
				<th class="th6">탈퇴</th>
			</tr>
			<%
				for (int i = 0; i < AdminMemberList.size(); i++) {
					MemberBean mb = (MemberBean) AdminMemberList.get(i);
			%>
			<tr>
				<td><%=mb.getM_id()%></td>
				<td><%=mb.getM_name()%></td>
				<%
					String grade = "";
						if (mb.getM_grade() == 0) {
							grade = "준회원";
						} else if (mb.getM_grade() == 1) {
							grade = "정회원";
						} else if (mb.getM_grade() == 2) {
							grade = "VIP";
						} else if (mb.getM_grade() == -1) {
							grade = "댓글정지회원";
						} else if (mb.getM_grade() == -2) {
							grade = "로그인정지회원";
						}
				%>
				<td><%=grade%></td>
				<td><%=mb.getM_reg_date()%></td>
				<td><a href="javascript:del('<%=mb.getM_id()%>')">내보내기</a></td>
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