<%@page import="net.vip.db.VipResBean"%>
<%@page import="net.vip.db.VipResDAO"%>
<%@page import="net.vip.db.VipBean"%>
<%@page import="net.vip.db.VipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip_done.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="../js/jquery-3.3.1.js"></script>


</head>
<body>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->


<article>


<%
VipDAO vipdao = new VipDAO();
VipBean vipbean=vipdao.getVipMovie(); 

VipResDAO vipresdao = new VipResDAO();
VipResBean vipresbean=new VipResBean();

int v_num=vipbean.getV_num();
String selectedSeat=request.getParameter("seat");

%>

<div class="vip_done">
<p>시사회 예매가 완료 되었습니다</p>

	<div class="ticket">
		<div class="pic">
 			<img id="pic_ticket" src="./images/ticket.png" width="650px" height="350px">
 			<div class="vipMvTitle"><%=vipbean.getV_kor_title()%></div>
 			<div class="vipMvDate"><%=vipbean.getV_date()%></div>
 			<div class="vipMvWhen"><%=vipbean.getV_when()%></div>
 			<div class="vipSeat">좌석번호 : <%=selectedSeat%></div>
 		</div>
	</div> 

	
	<div class="way">
		<p>오시는 길</p>
		영화의전당
051-780-6000
부산 해운대구 수영강변대로 120
		<img src="./images/map.png">
	</div>
	
</div>





</article>


<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>