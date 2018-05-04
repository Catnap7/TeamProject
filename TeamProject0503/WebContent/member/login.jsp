<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/member.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="m_cover">
<div class="logo">
<a href="./intro.st"><img src="./images/watchu_logo.png" alt="logo"></a>
</div>

<div class="nav_r">
<a href="./MemberJoin.me">회원가입</a>
</div>

<div class="clear"></div>

<div class="div_01">
		<div class="div_02">
			<span>로그인</span>
			<a href="./FindPassword.me" class="find_pass">비밀번호 찾기</a>
		</div>
	<div>
		<form action="./MemberLoginAction.me" id="join" method="post">
			<label>
			<input type="text" name="m_id" placeholder="이메일 (example@gmail.com)" class="text">
			</label><br>
			<label>
			<input type="text" name="m_pass" placeholder="비밀번호 (6자 이상)" class="text">
			</label>
		<div>
			<input type="submit" value="로그인" id="submit" class="text">
		</div>
		</form>
	</div>
</div>
</div>
</body>
</html>