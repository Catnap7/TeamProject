<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 관리자 페이지</title>

<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">


</head>
<body>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<!-- 어드민 서브메뉴 -->
<jsp:include page="../inc/admin_sub.jsp"/>
<!-- 어드민 서브메뉴 -->

<article class="content">
	<div id="content">
		<div class="content_position">
		<label for="member">
			<div class="content_inner">
				<a href="./AdminMember_List_Search.am" id="member">member</a>
			</div>
		</label>
		<label for="movie">
			<div class="content_inner">
				<a href="./AdminMovieInsert.am" id="movie">movie</a>
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
</article>
<div class="clear"></div>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>