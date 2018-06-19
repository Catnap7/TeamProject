<%@page import="net.admin.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>와츄 : WATCHU</title>

<!-- JQuery -->
<script src="./js/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/customer.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function chat(){
	window.open('./AdminChat.ac', 'chat', 'width=400 height=690');
}
</script>
</head>
<body>
	<%
		List<NoticeBean> AdminNoticeList = (List) request.getAttribute("AdminNoticeList");
		String id = (String)session.getAttribute("m_id");
	%>

	<!-- 헤더영역 -->
	<jsp:include page="../inc/header.jsp" />
	<!-- 헤더영역 -->

	<article>
	<div class="wrap">
		<div class="container">
			<div class="subject">
				<h1>공지사항</h1>
			</div>
			<div class="notice">
				<%
					for (int a = 0; a < AdminNoticeList.size(); a++) {
						NoticeBean nb = (NoticeBean) AdminNoticeList.get(a);
				%>				
				<script type="text/javascript">
					$(document).ready(function() {
							$('#sub_<%=a %>').click(function() {
								$('#con_<%=a %>').toggle();
							});
					});
				</script>
				<h2 id="sub_<%=a%>" class="jemok"><%=nb.getN_subject()%></h2>
				<div id="con_<%=a%>" style="display: none;" class="naeyong">
				<%
				if(nb.getN_image() != null) {
					%>
					<input type="image" src="./upload/<%=nb.getN_image() %>"><br>
					<%=nb.getN_content()%>
					<%
				}else {
					%>
					<%=nb.getN_content()%>
					<%
				}
				%>								
				</div>
				<hr>
				<%
					}
				%>
			</div>
		</div>
		<div class="chat">
			<input type="button" value="영화 토론방" onclick="chat()">
		</div>

	</div>
	</article>

	<!-- 푸터 영역 -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- 푸터 영역 -->

</body>
</html>