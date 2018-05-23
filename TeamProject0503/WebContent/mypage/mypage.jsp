<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
MemberBean memberbean = (MemberBean)request.getAttribute("mb");
String grade=null;
switch(memberbean.getM_grade()){
case 1 : grade = "정회원"; break;
case 2 : grade = "VIP회원"; break;
}
%>
<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>

<div class="mypage_follow">
	<div class="mypage_profile">
		<h2>profile</h2>
		
		<div class="follow">
		  <div class="photo">
		    <a href="#"><img alt="프로필사진" src="./images/m_cover.jpg" width="130px" height="130px" title="사진 변경"></a>
		  </div>
		  <ul class="follow_ul">
		    <li class="follower"><a href="#">팔로워<span>999</span></a></li>
		    <li class="follows"><a href="#">팔로우<span>999</span></a></li>
		  </ul>
		</div>
		
		<div class="clear"></div>
		
		<table class="mypage_info">
			<tr>
				<td>아이디</td>
				<td class="content"><%=memberbean.getM_id()%></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td class="content"><%=memberbean.getM_name()%></td>
			</tr>
			<tr>
				<td>등급</td>
				<td class="content"><%=grade%></td>
			</tr>
		</table>
		
		<input type="button" value="정보 수정" class="update_btn" onclick="location.href='./UpdateCheck.my'">
		<input type="button" value="서비스 탈퇴" class="delete_btn" onclick="location.href='./DeleteCheck.my'">
	</div>
	
	
	
	<div class="clear"></div>
</div>

</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>