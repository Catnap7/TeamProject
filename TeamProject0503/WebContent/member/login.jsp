<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/member.css" rel="stylesheet" type="text/css">
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">


$(document).ready(function(){
		// 쿠키값을 가져온다.
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='m_id']").val(userInputId); 
     
    if($("input[name='m_id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='m_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
    $("#AutoLoginCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#AutoLoginCheck").is(":checked")){ // 자동로그인 체크했을 때,
            var m_id = $("input[name='m_id']").val();
            var m_pass = $("input[name='m_pass']").val();
            setCookie("m_id", m_id, 1); // 1일 동안 쿠키 보관
            setCookie("m_pass", m_pass, 1); // 1일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("m_id");
            deleteCookie("m_pass");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='m_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='m_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
     var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue; 
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>
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
		
			<a href="./FindPass.me" class="find_pass">비밀번호 찾기</a>
		</div>
		
		<form action="./MemberLoginAction.me" id="join" method="post" >
			<label>
			<input type="text"  name="m_id" placeholder="이메일 (example@gmail.com)" class="text" id="m_id">
			</label><br>
			<label>
			<input type="password" name="m_pass" placeholder="비밀번호 (6자 이상)" class="text" id="m_pass">
			</label>
			<input type="checkbox" id="idSaveCheck"> 아이디 저장 <br>
			<input type="checkbox" id="AutoLoginCheck"> 로그인 상태 유지 <br>
			<input type="submit" value="로그인" id="submit" >
		</form>
	
</div>
</div>
</body>
</html>