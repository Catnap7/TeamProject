<%@page import="net.mypage.db.CouponDAO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="net.mypage.db.CouponBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insert Coupon</title>
</head>
<body>
<!-- 쿠폰 삽입하기 코드 -->
<%
Calendar cal= new GregorianCalendar();
cal.add(Calendar.MONTH,1);
cal.clear(Calendar.MILLISECOND);
SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
String c_end_day=date.format(cal.getTime()).toString();

CouponBean cb = new CouponBean();
cb.setC_id("wahchu"); //아이디값 넣기
cb.setC_name(0); // 0 : 50%할인쿠폰, 1 : 100%할인쿠폰, 2: vip할인쿠폰
cb.setC_end_day(c_end_day);

CouponDAO cdao = new CouponDAO();
cdao.insertCoupon(cb);
%>
<!-- 쿠폰 삽입하기 코드 -->
</body>
</html>