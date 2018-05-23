<%@page import="net.mypage.db.CouponBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			
		}
	});
}); 
</script>


</head>
<body>
<%
//쿠폰리스트를 받아오는데, 쿠폰이 null 이면, 
//쿠폰없음.
//쿠폰이 존재하면, list뜰것.

List couponlist=(List)request.getAttribute("couponlist");

%>
	<form name="form" action="./PayAction.pa">
	
		이용권 종류 선택 
		<select name="pay" >
			 <option value="한달" id="monthpay">한달만결제</option> 
			 <option value="정기" id="autopay">매달 자동결제</option>
		</select><br>

<br><br>
<%
//	 0 10%
//   1 50%
//   2 100%
//   3 vip%
  
%>	
		쿠폰
		<select name="couponBox" >
			<%if(couponlist.size()!=0){ %>
			 <option value="-1">가지고 계신 쿠폰을 선택하세요</option>
			 <%
				 for(int i=0;i<couponlist.size();i++){
					 CouponBean couponbean=(CouponBean)couponlist.get(i);
					 couponbean.getC_name();
					 switch(couponbean.getC_name()){
					  case 0: 
						 %><option value="0">10%할인</option><%
						  break;
					  case 1: 
						 %><option value="1">50%할인</option><%
						  break;
					  case 2:
						  %><option value="2">한달 무료</option><%
						  break;
					  default://vip쿠폰일때,
						  break;
					 }
				 }
			 }else{
				 %><option value="-1">가지고 계신 쿠폰이 없습니다</option><%
			 }
				 %>
		</select><br>
<input type="hidden" id="amounth" name="charge">
총 결제 금액:<p id="amount">

</p>
<input type="submit" value="결제하기">
	</form><br>



</body>
</html>