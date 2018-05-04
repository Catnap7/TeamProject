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
<a href="./MemberLogin.me">로그인</a>
</div>

<div class="clear"></div>

<div class="div_01">
		<div class="div_02">
			<span>회원가입</span>
		</div>
	<div>
		<form action="./MemberJoinAction.me" id="join" method="post">
	<label>
			<input type="text" name="m_name" placeholder="이름 (김와츄)" class="text">
			</label><br>
			<label>
			<input type="text" name="m_id" placeholder="이메일 (example@gmail.com)" class="text">
			</label><br>
			<label> 
			<input type="text" name="m_pass" placeholder="비밀번호 (6자 이상)"class="text">
			</label><br>
			<label>
			<input type="text" name="m_num1" placeholder="주민등록번호 앞자리" onkeyup="fun2" maxlength="6" class="text">
			</label><br>
			<label>
			<input type="text" name="m_num2" placeholder="주민등록번호 뒷자리" maxlength="1" class="text">
			</label><br>
			<input type="radio" class="check" id="all_agree"> <label for="all_agree">전체 약관에 동의 합니다.</label><br>
			<input type="radio" class="check" id="use_agree"> <label for="use_agree"><a href="#" class="use">이용약관</a>에 동의 합니다.</label><br>
			<input type="radio" class="check" id="p_agree"> <label for="p_agree"><a href="#" class="use">개인정보 취급 방침</a>에 동의 합니다.</label>
		<div>
			<input type="submit" value="회원가입" id="submit" class="text">
		</div>
		</form>
	</div>
</div>
</div>
</body>
</html>