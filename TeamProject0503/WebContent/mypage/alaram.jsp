<%@page import="net.member.db.MemberBean"%>
<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.mypage.db.AlarmBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<title>왓츄 : WATCHU</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(window).on("beforeunload",function (){
	$.ajax({
		type: 'POST',
		url: './CheckAlarm.my'																	 					 		
	});//end ajax 		
});
</script>
</head>
<body>
<%
List<AlarmBean> alarmlist = (List)request.getAttribute("alarmlist");
String pageNum_s= (String)request.getAttribute("pageNum");
int pageNum = Integer.parseInt(pageNum_s);
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
int count = ((Integer)request.getAttribute("count")).intValue();
List<MovieBean> movielist = (List)request.getAttribute("movielist");
List<MemberBean> memberList = (List)request.getAttribute("memberList");
List<MemberBean> userList = (List)request.getAttribute("userList");
%>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<div class="mypage_">
	<div class="mypage_alram">
<h2>알림창</h2>
<table class="alram_info">
<tr><th>내용</th></tr>
<%
if(count == 0){
%>
<tr><td colspan="3">알람내용이 없습니다.</td></tr>
<% 
}else{
	String name=null;	
	for(int i=0;i<alarmlist.size();i++){		
		AlarmBean alarmbean = (AlarmBean)alarmlist.get(i);		
		MovieBean moviebean= (MovieBean)movielist.get(i);
		MemberBean memberbean= (MemberBean)memberList.get(i);
		MemberBean userbean = (MemberBean)userList.get(i);
		int a_name = alarmbean.getA_alarm_name();		
		switch(a_name){
		case 0 :  name = "영화 "+alarmbean.getA_movie_name()+"의 후기가 추천받았습니다! - "+alarmbean.getA_start_day();
		break;
		case 1 :  name = "이용자님께서는 후기쓰기 이용을 7일간 하실 수 없습니다.(누적신고 3회) - "+alarmbean.getA_start_day();
		break;
		case 2 :  name = "후기쓰기를 다시 이용하실 수 있습니다! - "+alarmbean.getA_start_day();
		break;
		case 3 :  name = "이용자님께서는 로그인 정지가 임박합니다.(누적신고 9회) - "+alarmbean.getA_start_day();
		break;		
		case 4 :  name = memberbean.getM_name()+" 님이 회원님을 팔로우 하기 시작하였습니다";
		break;		  
		}
%>
<tr><td colspan="3"><%if(alarmbean.getA_check()==0){%><span style=color:red;>new! </span><%} if(a_name==0){%>
영화 <a href="./CategoryMovie.ca?mv_num=<%=moviebean.getMv_num()%>#review" class="mo"><%=alarmbean.getA_movie_name()%></a>의 후기가 추천받았습니다! - <%=alarmbean.getA_start_day()%><%}
else if(a_name==4){%><a href="./FollowMyHome.fo?m_id=<%=memberbean.getM_id()%>" class="mo"><%=memberbean.getM_name()%></a> 님이 회원님을 팔로우 하기 시작하였습니다 - <%=alarmbean.getA_start_day()%><%}
else if(a_name==5){%><a href="./FollowMyHome.fo?m_id=<%=userbean.getM_id()%>" class="mo"><%=userbean.getM_name()%></a> 님이 리뷰쓰기 정지를 당했습니다. - <%=alarmbean.getA_start_day()%><%}
else if(a_name==6){%><a href="./FollowMyHome.fo?m_id=<%=userbean.getM_id()%>" class="mo"><%=userbean.getM_name()%></a> 님이 로그인 정지를 당했습니다. - <%=alarmbean.getA_start_day()%><%}else{%><%=name%><%}%></td></tr>	
<%	
	}//for
}
%>
</table>		
	<!-- 페이징 처리  -->	
		<%
if(count != 0){
%>	
	 <div class="prev_next">
		<%
		if(startPage>pageBlock){			
			%><a href="./Alarm.my?pageNum=<%=startPage-pageBlock%>">prev</a><%
		}
		for(int i=startPage;i<=endPage;i++) {
			%><a href="./Alarm.my?pageNum=<%=i%>"><span <%if(i==pageNum){%>style=color:red;<%} %>><%=i%></span></a><%
		}
		if(pageCount>endPage){
			%><a href="./Alarm.my?pageNum=<%=startPage+pageBlock%>">next</a><%
		}
		%>
	</div>
<%
}
%>
<!-- 페이징 처리  --> 
 	</div>
</div>
<div class="clear"></div>
<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>