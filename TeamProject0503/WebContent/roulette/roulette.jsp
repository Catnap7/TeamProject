<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title> prototype about roulette </title>
<meta charset="utf-8">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jQueryRotateCompressed.js"></script>
<script src="./js/roulette.js"></script>
<style>
#image{
  margin:50px 50px;z-index:10;
}
#n_id{position:absolute;left:286px;top:75px;z-index:20;}
</style>
</head>
<body>
<%
String id = (String)session.getAttribute("m_id");
%>
<input type="hidden" name="id" value="<%=id%>">
<img src="images/roulette3.png" id="image">
<img src="images/niddle.png" id="n_id">
<br />
<input type='button' value='시작' id='start_btn'></input>
<!-- <div id="result_id"></div>
<div id="result_id2"></div>
<div id="result_id3"></div>
<div id="result_id4"></div>
<div id="result_id5"></div>
<div id="result_id6"></div>
<div id="result_id7"></div>
<div id="result_id8"></div> -->
</body>
</html>
