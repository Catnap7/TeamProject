<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>왓츄 : WATCHU</title>
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<meta charset="utf-8">

<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/roulette.css" rel="stylesheet" type="text/css">

<!-- jquery -->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jQueryRotateCompressed.js"></script>
<script src="./js/roulette.js"></script>


<style>
#image{
  margin:0px auto;z-index:10;
}
#n_id{position:absolute;left:941px;top:330px;z-index:20;}
</style>
</head>
<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->
<body>
<%
String id = (String)session.getAttribute("m_id");
%>

<section>
<article>
<h1>룰렛을 돌려서 쿠폰을 획득해보아요~</h1>
<div class="roulette">
<input type="hidden" name="id" value="<%=id%>">
<img src="images/roulette3.png" id="image">
<img src="images/niddle.png" id="n_id">
<br />
<input type='button' value='시작' id='start_btn'></input>
</div>
</article>
</section>

<div class="clear"></div>
</body>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->
</html>
