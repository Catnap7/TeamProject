<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 탈퇴페이지</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
<script>
function finalcheck(){
	var check = confirm("탈퇴하시겠습니까?");
	if(check==false){
		return false;
	}
}
</script>
<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>

<div class="mypage_">
	<div class="mypage_profile2">
		<h2 class="pw_check">비밀번호를 입력해 주세요</h2>
		
		<form action="./DeleteAction.my" method="get" name="fr" onsubmit="return finalcheck()">
			<input type="password" value placeholder="비밀번호 입력" class="mypage_check" name="pass"><br>
			<input type="submit" value="확인" class="check_text">
		</form>
	</div>
</div>

</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->



</body>
</html>