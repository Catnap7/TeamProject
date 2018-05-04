<%@page import="net.mypage.db.CouponBean"%>
<%@page import="java.util.List"%>
<%@page import="net.mypage.db.CouponDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 쿠폰 삭제하기 코드 -->
<%
Calendar cal= new GregorianCalendar();
cal.clear(Calendar.MILLISECOND);
SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
int today = Integer.parseInt(date.format(cal.getTime()).toString());

CouponDAO cdao = new CouponDAO();
/* 주석 삭제하세요 */
//HttpSession session=request.getSession();		
//String id = (String)session.getAttribute("id");
/* 주석 삭제하세요*/

List <CouponBean>couponlist = cdao.getCoupons("wahchu");//세션 아이디 넣으세요.
if(couponlist != null){
for(CouponBean couponbean:couponlist){
 String array[] = couponbean.getC_end_day().split("/");  
 String day = array[0]+array[1]+array[2];
 
 int c_end_day = Integer.parseInt(day);
 if(today>=c_end_day){
	cdao.deleteCoupon(couponbean.getC_num());
	}  
 }//end for
}//end if
%>
<!-- 쿠폰 삭제하기 코드 -->
</body>
</html>