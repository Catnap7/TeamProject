<%@page import="net.vip.db.VipBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vip 영화 수정</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip_admin.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body>
<%VipBean vipbean =(VipBean)request.getAttribute("vipbean"); 

	String age = "";
	switch(vipbean.getV_age()){
	case 0  : age="전체이용가"; break;
	case 12	: age="12세이용가"; break;
	case 15	: age="15세이용가"; break;
	case 19 : age="청소년관람불가"; break;
	}
%>
			
<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<!-- vip 서브메뉴 -->
<jsp:include page="../vip/vipAdmin_sub.jsp"/>
<!-- vip 서브메뉴 -->

<div id="movieContent">
	
	<form action="./VipMovieModifyAction.vi" method="post">
	<%-- <input type="hidden" name="v_num" value="<%=vipbean.getV_num()%>"> --%>
		<table class="movieContent">
			<tr>
				<th colspan="5">VIP영화 정보 수정하기</th>
			</tr>
			<tr>
				<td><%=vipbean.getV_num()%></td>
				<td colspan="2"><input type="text" name="v_kor_title" value="<%=vipbean.getV_kor_title()%>"></td>
				<td colspan="2"><input type="text" name="v_eng_title" value="<%=vipbean.getV_eng_title()%>"></td>	
			</tr>
			<tr>
				<td><input type="text" name="v_year" value="<%=vipbean.getV_year()%>년도"></td>
				<td><input type="text" name="v_country" value="<%=vipbean.getV_country()%>"></td>
				<td><input type="text" name="v_age" value="<%=age%>"></td>
				<td><input type="text" name="v_genre" value="<%=vipbean.getV_genre()%>"></td>
				<td><input type="text" name="v_time" value="<%=vipbean.getV_time()%>분"></td>
			</tr>
			<tr>	
				<td colspan="2"><input type="text" name="v_director" value="<%=vipbean.getV_director()%> 감독"></td>
				<td colspan="3"><input type="text" name="v_actor" value="<%=vipbean.getV_actor()%>"></td>
			</tr>	
			<tr>
				<td colspan="3"><input type="text" name="v_date" value="<%=vipbean.getV_date()%>"></td>
				<td colspan="2"><input type="text" name="v_when" value="<%=vipbean.getV_when()%>"></td>
			</tr>
			<tr>
				<th colspan="5">줄거리</th>
			</tr>
			<tr>
				<td colspan="5" id="needsPadding"><input type="text" name="v_story" value="<%=vipbean.getV_story() %>"></td>
			</tr>
			<tr>
				<th colspan="2">review 1</th>
				<td colspan="3"><input type="text" name="v_critic_1_by" value="<%=vipbean.getV_critic_1_by()%>"></td>
			</tr>
			<tr>
				<td colspan="5" id="needsPadding"><input type="text" name="v_critic_1" value="<%=vipbean.getV_critic_1()%>"></td>
			</tr>
			<tr>
				<th colspan="2">review 2</th>
				<td colspan="3"><input type="text" name="v_critic_2_by" value="<%=vipbean.getV_critic_2_by()%>"></td>
			</tr>
			<tr>
				<td colspan="5" id="needsPadding"><input type="text" name="v_critic_2" value="<%=vipbean.getV_critic_2()%>"></td>
			</tr>
			<tr>
				<th colspan="5">VOD</th>
			</tr>
			<tr>
				<td colspan="5" id="needsPadding"><input type="text" name="v_critic_2" value="<%=vipbean.getV_video()%>"></td>
			</tr>	
		</table>
		
			<input type="submit" value="상품수정">
			<input type="reset" value="다시등록">
</form>

</div><!-- content -->

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>