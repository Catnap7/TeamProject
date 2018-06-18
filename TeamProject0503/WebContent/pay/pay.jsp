<%@page import="net.mypage.db.CouponBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- css -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/pay2.css" rel="stylesheet" type="text/css">

<!-- jquery -->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>

<title>왓츄:결제</title>

<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
var amount1=6900;	
$(document).ready(function(){
	$("#amount").text(amount1);
	$("#amounth").val(amount1);
	$("select[name=pay]").click(function(){
		$this=$(this);
		if($this.val()=='정기'){
			amount1=4900;
			$("#amount").html(amount1);
			$("#amounth").val(amount1);
			$("select[name=couponBox] option:eq(0)").prop("selected", true);
		}else{
			amount1=6900;
			$("#amount").html(amount1);
			$("#amounth").val(amount1);
			$("select[name=couponBox] option:eq(0)").prop("selected", true);
		}
	});
		
	
	$("select[name=couponBox]").click(function(){
		$this=$(this);
		if($this.val()==2){
			//100%
			$("#amount").html(amount1*0);
			$("#amounth").val(amount1*0);
		}else if($this.val()==1){
			amount1*0.5//50%
			$("#amount").html(amount1*0.5);
			$("#amounth").val(amount1*0.5);
		}else if($this.val()==0){
			//amount1=6900//그대로
			$("#amount").html(amount1*0.9);
			$("#amounth").val(amount1*0.9);
		}else if($this.val()==-1){
			$("#amount").html(amount1);
			$("#amounth").val(amount1);
		}
	});
}); 
</script>


</head>
<body>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>

<%
//쿠폰리스트를 받아오는데, 쿠폰이 null 이면, 
//쿠폰없음.
//쿠폰이 존재하면, list뜰것.

List couponlist=(List)request.getAttribute("couponlist");

%>
	<form name="form" action="./PayAction.pa">
	<section class="select">
	<table class="coupon">
		<tr><th class="radius">이용권 종류 선택 </th>
		<td class="radius_2"><select name="pay" >
			 <option value="한달" id="monthpay">한달만 결제</option> 
			 <option value="정기" id="autopay">매달 자동결제</option>
		</select><br></td></tr>
	</table>
	</section>
<br><br>
<%
//	 0 10%
//   1 50%
//   2 100%
//   3 vip%
  
%>	
		<section class="total">
		<table class="payment">
		<tr><th class="radius_3">쿠폰</th>
		<td class="radius_4">
		<select name="couponBox" id="box">
			<%if(couponlist.size()!=0){ %>
			 <option value="-1">가지고 계신 쿠폰을 선택하세요</option>
			 <%
				 for(int i=0;i<couponlist.size();i++){
					 CouponBean couponbean=(CouponBean)couponlist.get(i);
					 couponbean.getC_name();
					 switch(couponbean.getC_name()){
					  case 0: 
						 %><option value="0">10%할인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~<%=couponbean.getC_end_day() %></option><%
						  break;
					  case 1: 
						 %><option value="1">50%할인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~<%=couponbean.getC_end_day() %></option><%
						  break;
					  case 2:
						  %><option value="2">한달 무료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~<%=couponbean.getC_end_day() %></option><%
						  break;
					  default://vip쿠폰일때,
						  break;
					 }
				 }
			 }else{
				 %><option value="-1">가지고 계신 쿠폰이 없습니다</option><%
			 }
				 %>
		</select>	 
		<br></td></tr>				
		<tr><th class="to_money">
		<input type="hidden" id="amounth" name="charge">
		총 결제 금액</th><td><p id="amount"></p></td></tr>


	<tr><td colspan="2" class="radius_5"><label for="pay">결제하기</label><input type="submit" value="결제하기" id="pay"></td></tr> 

	</table>
	</section>
	</form><br>

</article>
<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>