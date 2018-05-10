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
<script>
function check(){
	if (document.fr.pass.value=="") {
		alert("비밀번호를 입력해주십시오");
		document.fr.pass.focus();
		return false;
	}
	if (document.fr.pass2.value=="") {
		alert("비밀번호를 입력해주십시오");
		document.fr.pass2.focus();
		return false;
	}
	if(document.fr.pass.value!=document.fr.pass2.value){
		alert("비밀번호를 같게 입력하세요");
		return false;
	}			
}
function check2(){
	alert("아이디는 수정할 수 없습니다");
	document.fr.pass.focus();
}
</script>
<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->
<%
String id = (String)request.getAttribute("id");
String name = (String)request.getAttribute("name");
%>
<article>

<div class="mypage_">
	<div class="mypage_update">
		<h2 class="pw_check">수정 할 정보 입력</h2>
		
		<form action="./UpdateAction.my" method="get" name="fr" onsubmit="return check()">
			<input type="text" value placeholder="<%=id%>" class="update" readonly name="id" onkeypress="check2()"><br>
			<input type="password" value placeholder="변경 할 비밀번호 입력" class="update" name="pass"><br>
			<input type="password" value placeholder="변경 할 비밀번호 재입력" class="update" name="pass2"><br>
			<input type="text" value="<%=name%>" class="update" name="name"><br>
			<input type="submit" value="확인" class="update_text">
			<input type="reset" value="다시쓰기" class="update_text2">
		</form>
	</div>
</div>

<div class="clear"></div>

</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>

<div class="mypage_">
	<div class="mypage_update">
		<h2 class="pw_check">수정 할 정보 입력</h2>
		
		<form action="mypage_update.jsp" method="get" name="fr">
			<input type="text" value placeholder="ID" class="update"><br>
			<input type="password" value placeholder="변경 할 비밀번호 입력" class="update"><br>
			<input type="password" value placeholder="변경 할 비밀번호 재입력" class="update"><br>
			<input type="text" value placeholder="닉네임" class="update"><br>
			<input type="submit" value="확인" class="update_text">
			<input type="reset" value="다시쓰기" class="update_text2">
		</form>
	</div>
</div>

<div class="clear"></div>

</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>

<div class="mypage_">
	<div class="mypage_update">
		<h2 class="pw_check">수정 할 정보 입력</h2>
		
		<form action="mypage_update.jsp" method="get" name="fr">
			<input type="text" value placeholder="ID" class="update"><br>
			<input type="password" value placeholder="변경 할 비밀번호 입력" class="update"><br>
			<input type="password" value placeholder="변경 할 비밀번호 재입력" class="update"><br>
			<input type="text" value placeholder="닉네임" class="update"><br>
			<input type="submit" value="확인" class="update_text">
			<input type="reset" value="다시쓰기" class="update_text2">
		</form>
	</div>
</div>

<div class="clear"></div>

</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>