<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원리스트</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<nav id="menu_bar">
	<ul>
		<li><a href="./AdminManageList.am">DB</a></li>
		<li><a href="./AdminNoticeList.an">공지</a></li>
		<li><a href="./AdminChatServer.ac">채팅</a></li>
		<li><a href="./VipAdmin.vi">VIP관리</a></li>
	</ul>
</nav>

<div id="content">
	<div class="content_position">
	<label for="member">
		<div class="content_inner">
			<a href="./AdminMemberListAction.am" id="member">member</a>
		</div>
	</label>
	<label for="movie">
		<div class="content_inner">
			<a href="./AdminMovieJoin.am" id="movie">movie</a>
		</div>
	</label>
	<label for="pay">
		<div class="content_inner">
			<a href="./AdminPayListAction.am" id="pay">pay</a>
		</div>
	</label>
	<label for="review">
		<div class="content_inner">
			<a href="./AdminReviewListAction.am" id="review">review</a>
		</div>
	</label>
	</div>
</div>

<div class="clear"></div>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>