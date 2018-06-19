<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
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
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄 : WATCHU</title>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/vip_admin.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
</head>
<body>
<%
VipDAO vipdao = new VipDAO();
VipBean vipbean=vipdao.getVipMovie(); 

VipResDAO vipresdao = new VipResDAO();
VipResBean vipresbean=new VipResBean();

List<VipResBean> VipSeatTakenList = (List)request.getAttribute("VipSeatTakenList");

List vipMemberList = (List)request.getAttribute("vipMemberList");
List<VipResBean> seatList=(List)request.getAttribute("seatList");


%>
<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<!-- vip 서브메뉴 -->
<jsp:include page="../vip/vipAdmin_sub.jsp"/>
<!-- vip 서브메뉴 -->

<article class="content">
	
<h1 class="adminTitle">이번달 VIP 시사회 영화</h1>
<section id="movie">
		<div class="poster"><img src="./images/vip/<%=vipbean.getV_eng_title().replaceAll(" ","")+"_p.jpg"%>" width="250" height="350"></div>
		<div class="movie_info">
				<P><%=vipbean.getV_kor_title()%></P>
				<p><%=vipbean.getV_director()%><%="  감독"%></p>
				<p><%=vipbean.getV_year()%><%="년도 개봉" %></p>
				<p>
					<%
					String age = "";
					switch(vipbean.getV_age()){
					case 0  : age="전체이용가"; break;
					case 12	: age="12세이용가"; break;
					case 15	: age="15세이용가"; break;
					case 19 : age="청소년관람불가"; break;
					}
					%>
					<%=age%>
				</p>
				<p><%=vipbean.getV_genre()%></p>
				<p><%=vipbean.getV_actor().replaceAll(","," , ")%></p>
				<p><%=vipbean.getV_story()%></p>
		</div>
</section>
		

<h1 class="adminTitle">vip시사회 좌석 예매 현황 </h1>
<section id="seat">			
	<div id="screen">SCREEN</div>
			<table class="seatTable">	
				<tr>
					 <% 
				 	for(int i=0;i<=4;i++){
				 	vipresbean=(VipResBean)VipSeatTakenList.get(i);
				 	
				 	if(vipresbean.getV_seatSelected().equals("0")){%>
						<td class="seatUnselected"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><p><%=vipresbean.getV_seatNum()%></p></label></td>
						
					<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
						<td><p class="seatSelected" name="seat"><span><%="X"%></span></p></td>
					<%}} %>
				</tr>
				<tr>
					 <% 
				 	for(int i=5;i<=9;i++){
				 	vipresbean=(VipResBean)VipSeatTakenList.get(i);
				 	
					 	if(vipresbean.getV_seatSelected().equals("0")){%>
							<td class="seatUnselected"><label><input type="radio" class="radio"  name="seat"  onclick="seat<%=vipresbean.getV_seatNum()%>()" value="<%=vipresbean.getV_seatNum()%>"><p><%=vipresbean.getV_seatNum()%></p></label></td>
						<%}else if(vipresbean.getV_seatSelected().equals("1")){%>
							<td><p class="seatSelected" name="seat"><span><%="X"%></span></p></td>
						<%}
				 	}//for %>
				</tr>
			</table> 
			<!-- <div id="vipListBtn"><a href="./VipMemberList.vi"> 이번달 VIP리스트 보기</a></div> -->
</section>

<h1 class="adminTitle">VIP 멤버 목록</h1>	
<section id="vipMember">
		<table class="vip_db_list vipmain">
			<tr>
				<th>시사회 좌석 번호</th><th>아이디</th><th>이름</th><th>등급</th><th>생년월일</th><th>가입일</th>
			</tr>
			
			<%for(int i=0;i<vipMemberList.size();i++){
				MemberBean memberbean =(MemberBean)vipMemberList.get(i);
				vipresbean=(VipResBean)seatList.get(i);
			%>
			<tr>
				<td><%=vipresbean.getVr_seat_num()%></td>
				<td><%=memberbean.getM_id()%></td><td><%=memberbean.getM_name()%></td>
				<td><%=memberbean.getM_grade()%></td><td><%=memberbean.getM_id_num1()%></td>
				<td><%=memberbean.getM_reg_date()%></td>
			</tr>
			<%} %>
		</table>
</section>


</article>


<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>