<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<title>I왓츄 : 공지사항 쓰기</title>

<script src="./js/jquery-3.3.1.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">
function chk() {
	alert("11");
	alert($('#11').val());
	alert($('#22').val());
}



</script>


<!--  notice/writeForm.jsp -->
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<!-- 헤더영역 -->
	<jsp:include page="../../inc/header.jsp" />
	<!-- 헤더영역 -->

<!-- 어드민 서브메뉴 -->
<jsp:include page="../../inc/admin_sub.jsp"/>
<!-- 어드민 서브메뉴 -->

	<div id="content">
		<h1 class="adminTitle">관리자 공지사항 글쓰기</h1>

		<form action="./AdminNoticeWriteAction.an" method="post" enctype="multipart/form-data" onsubmit="chk()">
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
					<td><input type="file" name="n_image" id="11"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="n_file"id="22"></td>
				</tr>				
				<tr>
				<div class="u_admin-notice-write">
					<input type="submit" class="wirtebtn" value="등록">
					<button type="button" class="wirtebtn" onclick="history.back()">돌아가기</button>
				</div>
				</tr>
			</table>
		</form>
	</div>


	<!-- 푸터 영역 -->
	<jsp:include page="../../inc/footer.jsp" />
	<!-- 푸터 영역 -->
</body>
</html>