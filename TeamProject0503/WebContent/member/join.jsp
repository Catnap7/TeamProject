<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : 당신의 모든 영화, 세상의 모든 취향 </title>
<link href="./css/member.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="./js/jquery-3.3.1.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>

<script type="text/javascript">
//체크박스 제어란 
$(function(){ //전체선택 체크박스 클릭 
	$("#all_agree").click(function(){ 
		if($("#all_agree").prop("checked")) { 
			$(".check").prop("checked",true); 
			} else { 
				$(".check").prop("checked",false); 
			} 
		})
		})
		
//회원가입 유효성 검사 부분
 function validate() { 
	var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;//이름에 한글만 입력하는 부분
	var e_check= /[a-z]/;
	var E_check=/[A-Z]/;
	var t_check=/[0-9]/;
	var space_check=/[\s]/g;
	var a_check=/[~!@#$%^&*()_+|<>?:{}]/;
	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;//이메일 혹인
	var jumin1 = document.fr.m_num1.value.substr(0,6);
	var yy     = jumin1.substr(0,2);        // 년도
    var mm     = jumin1.substr(2,2);        // 월
    var dd     = jumin1.substr(4,2);        // 일
	//이름
 	 if (document.fr.m_name.value == "") {
		alert("이름을 입력하지 않았습니다.");
		document.fr.m_name.focus()
		return false;
	}
	if (document.fr.m_name.value.length <= 2 
			|| document.fr.m_name.value.length >= 9) {
		alert("이름을 3자 이상 8자이하 입력해주십시오.");
		document.fr.m_name.focus()
		return false;
	}
	
	if(space_check.test(document.fr.m_name.value)){
		alert("이름엔 공백은 들어 갈 수 없습니다.")
		document.fr.m_name.focus();
		return false;
	}
	if(a_check.test(document.fr.m_name.value)){
		alert("이름엔 특수문자는 들어 갈 수 없습니다.")
		document.fr.m_name.focus();
		return false;
	} 
	if (document.fr.dup_name_check.value==-1) {
		alert("이름 중복체크하세요.")
		return false;	
	}
	if (document.fr.dup_name_check.value==1) {
		alert("중복된 이름은 사용하실 수 없습니다.")
		return false;	
	}
	
	 //아이디
	 if(regex.test(document.fr.m_id.value) ==false){
		alert("아이디는 이메일 형식으로 입력 바랍니다.");
		document.fr.m_id.focus();
		return false;
	}
	if (document.fr.m_id.value == "") {
		alert("아이디를 입력하세요.");
		document.fr.m_id.focus();
		return false;
	}
	if (document.fr.m_id.value.length <= 8 
			|| document.fr.m_id.value.length >= 30) {
		alert("아이디는 8자 이상 25자 이하 입력 바랍니다.");
		document.fr.m_id.focus();
		return false;
	}

	if (space_check.test(document.fr.m_id.value)) {
		alert("아이디에 공백을 사용할 수 없습니다.");
		document.fr.m_id.focus()
		return false;
	}
	if (document.fr.dup_id_check.value==-1) {
		alert("아이디 중복체크하세요.")
		return false;	
	}
	if (document.fr.dup_id_check.value==1) {
		alert("중복된 아이디는 사용하실 수 없습니다.")
		return false;	
	}

	//비밀번호 입력여부 체크
	if (document.fr.m_pass.value == "") {
		alert("비밀번호를 입력하지 않았습니다.");
		document.fr.m_pass.focus()
		return false;
	}
	if (document.fr.m_pass.value.length< 8 
			||document.fr.m_pass.value.length>15) {//비밀번호 확인하는부분
		alert("숫자 특수문자 대문자 조합 비밀번호를 8~15 자리로 입력하세요")
		document.fr.m_pass.focus();
		return false;
	}
	if(!e_check.test(document.fr.m_pass.value) 
			&& !E_check.test(document.fr.m_pass.value)
			&& !a_check.test(document.fr.m_pass.value) 
			&& t_check.test(document.fr.m_pass.value)){
		alert("숫자 특수문자 대문자 조합으로 입력하세요")
		document.fr.m_pass.focus();
		return false;
	}
	if(space_check.test(document.fr.m_pass.value)){
		alert("비밀번호엔 공백은 들어 갈 수 없습니다.")
		document.fr.m_pass.focus();
		return false;
	}
	
	if (fr.m_pass.value == fr.m_id.value) {
		alert("아이디와 같은 비밀번호는 사용 하실 수 없습니다.");
		document.fr.m_pass.focus()
		return false;
	}
	
	
	 //주민번호1
	   if (yy < "00" 
              || yy > "99" 
              || mm < "01" 
              || mm > "12" 
              || dd < "01" 
              || dd > "31") {
            alert("주민등록번호다시 입력하세요.");
            document.fr.m_num1.value = ""
            document.fr.m_num1.focus()
            return false;

          }
  	 if(e_check.test(document.fr.m_num1.value) 
  			 || E_check.test(document.fr.m_num1.value) 
  			 || a_check.test(document.fr.m_num1.value) 
  			 || check.test(document.fr.m_num1.value) 
  			 || space_check.test(document.fr.m_num1.value)){
		alert("주민번호는 숫자로만 입력바랍니다.");
		document.fr.m_num1.focus()
		return false;
	} 
	if (document.fr.m_num1.value == "") {
		alert("주민번호를 입력하지 않았습니다.");
		document.fr.m_num1.focus()
		return false;
	}
	if (document.fr.m_num1.value.length < 6) {
		alert("주민번호는 6자리까지  입력 하시기 바랍니다.");
		document.fr.m_num1.focus()
		return false;
	}
 	if (!t_check.test(document.fr.m_num1.value)) {
		alert("주민번호는 숫자로 입력하세요.");
		document.fr.m_num1.focus()
		return false;
	}
	//주민번호2
	if (document.fr.m_num2.value == "") {
		alert("주민번호를 입력하지 않았습니다.");
		document.fr.m_num2.focus()
		return false;
	}
	 if(document.fr.m_num2.value<1 
			 || document.fr.m_num2.value>4){
		alert("주민번호 뒷자리는 1~4 숫자로만 입력바랍니다.");
		document.fr.m_num2.focus()
		return false;
	} 
 	if(e_check.test(document.fr.m_num2.value) 
 			|| E_check.test(document.fr.m_num2.value)
 			|| a_check.test(document.fr.m_num2.value) 
 			|| check.test(document.fr.m_num2.value)
 			|| space_check.test(document.fr.m_num2.value)){
		alert("주민번호는 숫자로만 입력바랍니다.");
		document.fr.m_num2.focus()
		return false;
	}    
	if (!t_check.test(document.fr.m_num2.value)) {
		alert("주민번호는 숫자로 입력하세요.");
		document.fr.m_num2.focus()
		return false;
	}     
	if(document.fr.checkagree[1].checked==false){
		alert("이용약관 체크하세요");
		document.fr.checkagree[1].focus()
		return false;
	}
	if(document.fr.checkagree[2].checked==false){
		alert("개인정보 동의를 체크하세요");
		document.fr.checkagree[2].focus()
		return false;
	} 
	
	document.fr.submit();

}

	//이용약관
	function terms() {
		window.open("./AccessTerms.ce", "", "width=750,height=900,left=620,top=50,scrollbars=yes");
	}
	//개인정보방침 약관
	function Privacy() {
		window.open("./PrivacyPolicy.ce", "", "width=750,height=900,left=620,top=50,scrollbars=yes");
	}
	// 이름 중복체크
 	 $(document).ready(function() {
 		var a_check=/[~!@#$%^&*()_+|<>?:{}]/;
 		var space_check=/[\s]/g;
		$('#name_dup').click(function() {
		  if (document.fr.m_name.value == "") {
				alert("이름을 입력하지 않았습니다.");
				document.fr.m_name.focus()
				return false;
		}
		  if (document.fr.m_name.value.length <= 2 
					|| document.fr.m_name.value.length >= 9) {
				alert("이름을 3자 이상 8자이하 입력해주십시오.");
				document.fr.m_name.focus()
				return false;
			}
			
			if(space_check.test(document.fr.m_name.value)){
				alert("이름엔 공백은 들어 갈 수 없습니다.")
				document.fr.m_name.focus();
				return false;
			}
			if(a_check.test(document.fr.m_name.value)){
				alert("이름엔 특수문자는 들어 갈 수 없습니다.")
				document.fr.m_name.focus();
				return false;
			}  
		var m_name =$('#name').val();
		$.ajax({
			type:'post',
			url:'./MemeberNameDup.me',
			data:{
				'm_name':m_name
			},
			success:function(data){
				if(data==1){
					$('#dup_name_check').val('1');
					alert("중복된 이름입니다.")
				}else if(data==0){
					$('#dup_name_check').val('0');
					alert("사용가능한 이름입니다.")
				}
			}
		}); 
	});
	}); 
	//아이디중복체크	
 	$(document).ready(function() {
 		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
 		var space_check=/[\s]/g;
		$('#id_dup').click(function() {
		  if (document.fr.m_id.value == "") {
				alert("아이디를 입력하지 않았습니다.");
				document.fr.m_id.focus()
				return false;
		}
		  if(regex.test(document.fr.m_id.value) ==false){
				alert("아이디는 이메일 형식으로 입력 바랍니다.");
				document.fr.m_id.focus();
				return false;
			}
			if (document.fr.m_id.value == "") {
				alert("아이디를 입력하세요.");
				document.fr.m_id.focus();
				return false;
			}
			if (document.fr.m_id.value.length <= 8 
					|| document.fr.m_id.value.length >= 26) {
				alert("아이디는 8자 이상 25자 이하 입력 바랍니다.");
				document.fr.m_id.focus();
				return false;
			}

			if (space_check.test(document.fr.m_id.value)) {
				alert("아이디에 공백을 사용할 수 없습니다.");
				document.fr.m_id.focus()
				return false;
			}
		var m_id =$('#id').val();
		$.ajax({
			type:"post",
			url:"./MemeberIdDup.me",
			data:{
				"m_id":m_id
			},
			success:function(data){
				if(data==1){
					$('#dup_id_check').val('1');
					alert("중복된 아이디입니다")
				}else {
					$('#dup_id_check').val('0');
					alert("사용가능한 아이디입니다.")
				}
			}
		}); 
	});
	}); 
	
  
	
	
</script>
</head>
<body>
   <div class="m_cover">
      <div class="logo">
         <a href="./MemberLogin.me"><img src="./images/watchu_logo.png"
            alt="logo"></a>
      </div>

      <div class="nav_r">
         <a href="./MemberLogin.me">로그인</a>
      </div>

      <div class="clear"></div>

      <div class="div_01_join">
         <div class="div_02">
            <span>회원가입</span>
         </div>
         <div>
            <form action="./MemberJoinAction.me" id="join" method="post" name="fr" onsubmit="return validate();">
            <label> <input type="text" name="m_name" id="name" placeholder="닉네임 (김와츄)" class="text"> </label> 
            <label> <input type="button" value="닉네임 중복체크" id ="name_dup" class="btn" ></label><br>
            		<input type="hidden" value="-1" id="dup_name_check"> 
            <label> <input type="text" name="m_id" id="id" placeholder="이메일 (example@gmail.com)" class="text">
            		<input type="button" id="id_dup" value="아이디 중복체크" class="btn">
            		<input type="hidden" value="-1" id="dup_id_check">   
            </label><br> 
            <label> <input type="password" name="m_pass" id="pwd" placeholder="비밀번호 (6자 이상)" class="text" ></label><br>
            <label> <input type="text" name="m_num1" placeholder="주민등록번호 앞자리" class="text"  maxlength="6"></label><br> 
            <label> <input type="text" name="m_num2" placeholder="주민등록번호 뒷자리" class="text" maxlength="1"></label><br>
            <input type="checkbox" class="check" id="all_agree" name="checkagree"> <span><label for="all_agree">전체 약관에 동의 합니다.</label></span><br>  
			<input type="checkbox" class="check" id="use_agree" name="checkagree"> <span><label for="use_agree"><a onclick="terms()" class="use">이용약관</a>에 동의 합니다.</label></span><br>  
			<input type="checkbox" class="check" id="p_agree" name="checkagree"> <span><label for="p_agree"><a onclick="Privacy()" class="use">개인정보 취급 방침</a>에 동의 합니다.</label></span> 
            
               <div>
                 <input type="submit" value="회원가입" id="submit"> 
               </div>
            </form>
         </div>
      </div>
   </div>
</body>

</html>