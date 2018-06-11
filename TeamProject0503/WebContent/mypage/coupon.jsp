<%@page import="net.mypage.db.CouponBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 쿠폰함</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
</head>
<body>
<%
List<CouponBean> couponlist = (List)request.getAttribute("couponlist");
String pageNum_s= (String)request.getAttribute("pageNum");
int pageNum = Integer.parseInt(pageNum_s);
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
int count = ((Integer)request.getAttribute("count")).intValue();
%>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<div class="mypage_">
	<div class="mypage_coupon">
<h2>나의 쿠폰함</h2>
<table class="coupon_info">
<tr><th class="rad">번호</th><th>쿠폰명</th><th>만료일자</th></tr>
<%
if(count == 0){
%>
<!-- 원래 들어가야하는 문장 -->
<tr><td colspan="3">쿠폰이 없습니다.</td></tr>
<!-- 원래 들어가야하는 문장 -->
<% 
}else{
	String name=null;
	int num = 0;
	for(CouponBean couponbean:couponlist){	
		num++;
		int c_name = couponbean.getC_name();		
		switch(c_name){
		case 0 :  name = "10% 쿠폰";
		break;
		case 1 :  name = "50% 쿠폰";
		break;
		case 2 :  name = "100% 쿠폰";
		break;
		case 3 :  name = "VIP 쿠폰";
		break;
		}
%>
<tr><td><%=num%></td><td><%=name%></td><td><%=couponbean.getC_end_day()%></td></tr>	
<%	
	}
}
%>
</table>
	
	
<%
if(count != 0){
%>	
	 <div class="prev_next">
		<%
		if(startPage>pageBlock){			
			%><a href="./Coupon.my?pageNum=<%=startPage-pageBlock%>">prev</a><%
		}
		for(int i=startPage;i<=endPage;i++) {
			%><a href="./Coupon.my?pageNum=<%=i%>"><span <%if(i==pageNum){%>style=color:red;<%} %>><%=i%></span></a><%
		}
		if(pageCount>endPage){
			%><a href="./Coupon.my?pageNum=<%=startPage+pageBlock%>">next</a><%
		}
		%>
	
<%
}
%>
	</div>	 
</div>
</div>

	
<div class="clear"></div>
<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>