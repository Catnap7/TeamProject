<%@page import="net.mypage.db.AlarmBean"%>
<%@page import="net.mypage.db.AlarmDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 알람 삭제하기 코드 -->
<%
Calendar cal= new GregorianCalendar();
cal.clear(Calendar.MILLISECOND);
SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
int today = Integer.parseInt(date.format(cal.getTime()).toString());

AlarmDAO adao = new AlarmDAO();
/* 주석 삭제하세요 */
//HttpSession session=request.getSession();		
//String id = (String)session.getAttribute("id");
/* 주석 삭제하세요*/

List <AlarmBean>alarmlist = adao.getAlarms("wahchu");//세션 아이디 넣으세요.
if(alarmlist != null){
for(AlarmBean alarmbean:alarmlist){
 String array[] = alarmbean.getA_end_day().split("/");  
 String day = array[0]+array[1]+array[2];
 
 int c_end_day = Integer.parseInt(day);
 if(today>=c_end_day){
	adao.deleteAlarm(alarmbean.getA_num());
	}  
 }//end for
}//end if
%>
<!-- 알람 삭제하기 코드 -->
</body>
</html>