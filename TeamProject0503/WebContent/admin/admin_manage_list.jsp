<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : WATCHU</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
</head>
<body>
	<jsp:include page="../inc/header.jsp" />
	<jsp:include page="../inc/admin_sub.jsp" />
	<article class="content">
	<div id="maincontent">
		<div class="content_position">
			<label for="member"><a href="./AdminMember_List_Search.am" id="member"><div class="content_inner">member</div></a></label> 
			<label for="movie"><a href="./AdminMovie_List_Search.am" id="movie"><div class="content_inner">movie</div></a></label> 
			<label for="pay"><a href="./AdminPay_List_Search.am" id="pay"><div class="content_inner">pay</div></a></label> 
			<label for="review"> <a href="./AdminReview_List_Search.am"	id="review"><div class="content_inner">review</div></a></label>
		</div>
	</div>
	</article>
	<div class="clear"></div>
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>