<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : WATCHU</title>
<link href="./css/member.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="./images/watchu_logo22.ico" type="image/x-icon" >
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
		
    var userInputId = getCookie("userInputId");
    $("input[name='m_id']").val(userInputId); 
     
    if($("input[name='m_id']").val() != ""){ 
        $("#idSaveCheck").attr("checked", true); 
    }
     
    $("#idSaveCheck").change(function(){ 
        if($("#idSaveCheck").is(":checked")){ 
            var userInputId = $("input[name='m_id']").val();
            setCookie("userInputId", userInputId, 7); 
        }else{ 
            deleteCookie("userInputId");
        }
    });
    $("#AutoLoginCheck").change(function(){ 
        if($("#AutoLoginCheck").is(":checked")){ 
        	var m_id = $("input[name='m_id']").val();
            var m_pass = $("input[name='m_pass']").val();           
			var m_idSplit= m_id.split('@');
            setCookie("m_id1", m_idSplit[0], 1); 
            setCookie("m_id2", m_idSplit[1], 1); 
            setCookie("m_pass", m_pass, 1);           
        }else{ 
            deleteCookie("m_id");
            deleteCookie("m_pass");
        }
    });
     
    $("input[name='m_id']").keyup(function(){ 
        if($("#idSaveCheck").is(":checked")){ 
            var userInputId = $("input[name='m_id']").val();
            setCookie("userInputId", userInputId, 7); 
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
<a href="./MemberLogin.me"><img src="./images/watchu_logo2_2.png" alt="logo"></a>
</div>

<div class="nav_r">
<a href="./MemberJoin.me">회원가입</a>
</div>

<div class="clear"></div>

<div class="div_01">
		<div class="div_02">
			<span>로그인</span>
			<a href="./FindPass.me" class="find_pass">비밀번호 찾기</a>
		</div>
		
		<form action="./MemberLoginAction.me" id="join" method="post" >
			<label>
			<input type="text"  name="m_id" placeholder="이메일 (example@gmail.com)" class="text" id="m_id">
			</label><br>
			<label>
			<input type="password" name="m_pass" placeholder="비밀번호 (6자 이상)" class="text" required>
			</label><br>
			<input type="checkbox" id="idSaveCheck" class="id_save"><span><label for="idSaveCheck">아이디 저장 </label></span><br>
			<input type="checkbox" id="AutoLoginCheck" class="id_save"><span><label for="AutoLoginCheck">로그인 상태 유지</label></span><br>
			<input type="submit" value="로그인" id="submit" >
		</form>
	
</div>
</div>
</body>
</html>