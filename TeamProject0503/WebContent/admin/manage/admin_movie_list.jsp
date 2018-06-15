<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie List & AJAX Search</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">

<!-- script -->

<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction() {
		request.open("Post", "./AdminMovieSearch?searchValue="+encodeURIComponent(document.getElementById("searchValue").value)+"&select="+encodeURIComponent(document.getElementById("select").value), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess() {
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		if (request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			for (var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for (var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
	window.onload = function() {
		searchFunction();
	}
</script>

<!-- script -->

</head>
<body>

	<!-- JSP -->
	<!-- JSP -->

	<!-- Header -->
	<jsp:include page="../../inc/header.jsp" />
	<!-- Header -->
	
	<!-- Sub -->
	<jsp:include page="../../inc/admin_sub.jsp" />
	<!-- Sub -->
	
	<section class="content_member">
	<div id="content_member">
		<h1 class="adminTitle">MOVIE LIST</h1>
		<div class="admin-search-container">
		<select id="select">
			<option value="mv_kor_title" selected="selected">한글제목</option>
			<option value="mv_eng_title" selected="selected">영어제목</option>
			<option value="mv_director" selected="selected">감독</option>
			<option value="mv_year" selected="selected">개봉년도</option>
			<option value="mv_genre" selected="selected">장르</option>
		</select>
		<input type="text" onkeyup="searchFunction()" id="searchValue" placeholder="검색어">
		<button type="button" onclick="searchFunction();"><img src="./images/search.png" width="20px" height="20px"></button>
		<input type="button" onclick="location.href('./AdminMovieInsert.am')" value="영화입력하기">
		</div>
		<table class="db_list">
			<thead>
				<tr>
					<th class="th1">NO</th>
					<th class="th2">제목</th>
					<th class="th5">감독</th>
					<th class="th3">개봉년도</th>
					<th class="th3">등급</th>
					<th class="th5">장르</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
			</tbody>
		</table>
	</div>
	</section>
	
	
	<!-- Footer -->
	<jsp:include page="../../inc/footer.jsp" />
	<!-- Footer -->
	
</body>
</html>