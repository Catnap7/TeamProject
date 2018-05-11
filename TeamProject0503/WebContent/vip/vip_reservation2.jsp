
<%@page import="net.vip.db.VipBean"%>
<%@page import="net.vip.db.VipDAO"%>
<%@page import="net.member.db.MemberBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : VIP </title>

<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="../js/jquery-3.3.1.js"></script>


<script type="text/javascript">


$(document).ready(function(){
	

	

	var checked_radio = $('input:radio[name=seat]:checked').val();
	 
	if(checked_radio === undefined) // 선택을 하지 않았을 경우
	{
	    alert('옵션을 선택해주세요.');
	    return false;
	} else {
	    alert(checked_radio + "를 선택하셨습니다."); 
	    document.getElementById("demo").innerHTML = checked_radio; 
	    return false;
	}
	
	
	
});




</script>


</head>
<body>



<!-- 아티클 영역 -->
<article>

<%

String id=(String)session.getAttribute("m_id");

if(id==null){
	response.sendRedirect("./MemberLogin.me");
}


MemberBean memberbean=(MemberBean)request.getAttribute("memberbean");
String name=memberbean.getM_name();

VipDAO vipdao = new VipDAO();
VipBean vipbean=vipdao.getVipMovie(); 

int v_num=vipbean.getV_num();

%>

 	<div class="pic_frame">
		<div class="pic">
 			<img id="pic_src" src="./images/vip4_1.png">
 			<div class="vip_name"><%=name%><%="님"%></div>
 		</div>
	</div> 
	
	
	
	
	<div id="content">
		<table border="1">
			<tr><td>이번달의 영화</td></tr>
			<tr><td><%=vipbean.getV_kor_title()%></td></tr>
			<tr><td><%=vipbean.getV_eng_title()%></td></tr>				
		</table>
		<img src="./images/vip/<%=vipbean.getV_eng_title().replaceAll(" ","")+"_p.jpg"%>" width="300" height="400">
		<%-- <img src="./images/<%=genre%>/<%=moviebean.getMv_eng_title().replaceAll(" ","")+"_s2.jpg"%>"> --%>
		<table border="1">	
			<tr><td><%=vipbean.getV_director()%></td></tr>
			<tr><td><%=vipbean.getV_actor().replaceAll(","," , ")%></td></tr>
			<tr>
				<td><%=vipbean.getV_story()%></td>
			</tr>
		</table>
		
		<table>
			<tr><td>시사회 날짜</td></tr>
			<tr><td><%=vipbean.getV_date()%></td></tr>
			<tr><td><%=vipbean.getV_when()%></td></tr>
		</table>
	</div>

<span id="seet">원하시는 좌석을 선택 해 주세요</span>

<div class="seatTable">
		<span>SCREEN</span>
	
	<form action="VipResult.vi" method="post" name="fr">

		<label><input type="radio" class="radio"  name="seat"  onclick="seat1()" value="1"><span>1</span></label>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat2()" value="2"><span>2</span></label>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat3()" value="3"><span>3</span></label>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat4()" value="4"><span>4</span></label>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat5()" value="5"><span>5</span></label>
		<br>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat6()" value="6"><span>6</span></label>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat7()" value="7"><span>7</span></label>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat8()" value="8"><span>8</span></label>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat9()" value="9"><span>9</span></label>
		<label><input type="radio" class="radio"  name="seat"  onclick="seat10()" value="10"><span>10</span></label>
		
		<script>
			function seat1() {document.getElementById("selectedSeat").innerHTML = "1";}
			function seat2() {document.getElementById("selectedSeat").innerHTML = "2";}
			function seat3() {document.getElementById("selectedSeat").innerHTML = "3";}
			function seat4() {document.getElementById("selectedSeat").innerHTML = "4";}
			function seat5() {document.getElementById("selectedSeat").innerHTML = "5";}
			function seat6() {document.getElementById("selectedSeat").innerHTML = "6";}
			function seat7() {document.getElementById("selectedSeat").innerHTML = "7";}
			function seat8() {document.getElementById("selectedSeat").innerHTML = "8";}
			function seat9() {document.getElementById("selectedSeat").innerHTML = "9";}
			function seat10() {document.getElementById("selectedSeat").innerHTML = "10";}
		</script>

		
		<div class="selected">
		<p>선택하신 좌석</p>
		<p id="selectedSeat"></p>
		
		<input type="submit" value="좌석선택">
		</div>
	</form>
</div>


<div class="clear"></div>
</div>
</article>
<!-- 아티클 영역 -->

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>

</html>