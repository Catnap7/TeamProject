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

<!-- 헤더영역 -->
<jsp:include page="../header.jsp"/>
<!-- 헤더영역 -->

<nav id="menu_bar">
	<ul>
		<li><a href="./AdminManageList.am">DB</a></li>
		<li><a href="./AdminNoticeList.an">공지</a></li>
		<li><a href="#">채팅</a></li>
	</ul>
</nav>

<div id="content">
<h1>pay list</h1>

<div class="admin-search-container">
	<form action="admin_pay_list_search.jsp">
		<input type="text" placeholder="Search.." name="search">
		<button type="submit" class="searchBtn"><img src="./images/search.png" width="20px" height="20px"></button>
	</form>
</div>

<table class="db_list">
<tr><th class="th1">No</th>
    <th class="th2">ID</th>
    <th class="th3">닉네임</th>
    <th class="th4">결제일</th>
    <th class="th5">쿠폰만료일</th></tr>
<tr><td>1</td>
	<td>kim@watchu.com</td>
	<td>홍길동</td>
	<td>18-05-01</td>
	<td>18-06-01</td></tr>
<tr><td>2</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
<tr><td>3</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
<tr><td>4</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
<tr><td>5</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
<tr><td>6</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
<tr><td>7</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
<tr><td>8</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
<tr><td>9</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
<tr><td>10</td>
	<td>bb</td>
	<td>ddd</td>
	<td>vip</td>
	<td>yymmdd</td></tr>
</table>

	<div class="prev_next">
		<a href="#">prev</a>
		<a href="#">1</a>
		<a href="#">2</a>
		<a href="#">3</a>
		<a href="#">next</a>
	</div>
</div>

<!-- 푸터 영역 -->
<jsp:include page="../footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>