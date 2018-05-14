
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.vip.db.VipResBean"%>
<%@page import="java.util.List"%>
<%@page import="net.vip.db.VipResDAO"%>
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

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Song+Myung" rel="stylesheet">

<script type="text/javascript">
/* 

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


 */

</script>


</head>
<body>
<%

String id=(String)session.getAttribute("m_id");

if(id==null){
	response.sendRedirect("./MemberLogin.me");
}


MemberBean memberbean=(MemberBean)request.getAttribute("memberbean");
String name=memberbean.getM_name();
/* int grade=memberbean.getM_grade();
 */

VipDAO vipdao = new VipDAO();
VipBean vipbean=vipdao.getVipMovie(); 

VipResDAO vipresdao = new VipResDAO();
VipResBean vipresbean=new VipResBean();

int v_num=vipbean.getV_num();

%>


<!-- 아티클 영역 -->
<article class="vip_res">

 	<section class="pic_frame">
		<div class="pic">
 			<img id="pic_src" src="./images/vip4_1.png">
 			<div class="vip_name"><%=name%><span><%="님"%></span></div>
 		</div>
	</section> 
	
	
<section class="content">	
	<div class="movie_title"><p>이 달의 영화</p></div>
		
	<div class="poster"><img src="./images/vip/<%=vipbean.getV_eng_title().replaceAll(" ","")+"_p.jpg"%>" width="370" height="500"></div>
	
	<div class="movie_info">
		<P><%=vipbean.getV_kor_title()%></P>
		<p><%=vipbean.getV_director()%><%="  감독"%></p>
		<p><%=vipbean.getV_year()%><%="년도 개봉" %></p>
		<p><%=vipbean.getV_genre()%></p>
		<p><%=vipbean.getV_actor().replaceAll(","," , ")%></p>
		<p><%=vipbean.getV_story()%></p>
	</div>
	
	<div class="ment">
	</div>
	
	<div class="frame">
		<iframe width="1040px" height="760px" src="<%=vipbean.getV_video()%>" allowfullscreen frameborder="0" scrolling="no"></iframe>
	</div>
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

<% 
	List<VipResBean> VipSeatTakenList = (List)request.getAttribute("VipSeatTakenList"); 
%>


	<table border="1" class="seatTable">
		<tr>
			<th>좌석 번호</th><th>예약여부</th>
		</tr>
		
		 <% 
		 	vipresbean=(VipResBean)VipSeatTakenList.get(0);
		 
		 	%>
		<tr>
			
			
			<%if(vipresbean.getV_seatSelected().equals("0")){%>
				<td class="seatNum"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><span><%=vipresbean.getV_seatNum()%></span></label></td>
				
				<td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td>
				<script>
					function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
				</script>
			
			<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
				<td><p class="seatNumDisabled" name="seat"><span><%=vipresbean.getV_seatNum()%></span></p></td>
				<td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td>
				
			<%} %>
		</tr>
	</table> 


	
	<table border="1" class="seatTable">
		<tr>
			<th>좌석 번호</th><th>예약여부</th>
		</tr>
		
		 <% 
		 	for(int i=2;i<=9;i++){
		 	vipresbean=(VipResBean)VipSeatTakenList.get(i);
		 	
		 	%>
		<tr>
			<%if(vipresbean.getV_seatSelected().equals("0")){%>
				<td class="seatNum"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><span><%=vipresbean.getV_seatNum()%></span></label></td>
				
				<td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td>
				<script>
					function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
				</script>
			
			<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
				<td><p class="seatNumDisabled" name="seat"><span><%=vipresbean.getV_seatNum()%></span></p></td>
				<td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td>
				
			<%}} %>
		</tr>
	</table> 
	
	
	
	
	
	
	
	<table border="1">
		<tr>
			<th>좌석 번호</th><th>예약여부</th>
		</tr>
		
		 <% 
		 	vipresbean=(VipResBean)VipSeatTakenList.get(1);

		 	%>
		<tr>
			<td class="seatNum"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><span><%=vipresbean.getV_seatNum()%></span></label></td>
			
			<%if(vipresbean.getV_seatSelected().equals("0")){%>
				<td><p class="seatUnselected"><%=vipresbean.getV_seatSelected()%></p></td>
			
			<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
				<td><p class="seatSelected"><%=vipresbean.getV_seatSelected()%></p></td>
			<%} %>
		</tr>
	</table>
	
	
		<script>
				function seat<%=vipresbean.getV_seatNum()%>() {document.getElementById("selectedSeat").innerHTML = "<%=vipresbean.getV_seatNum()%>";}
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

</section>

</article>
<!-- 아티클 영역 -->






<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->




</body>

</html>