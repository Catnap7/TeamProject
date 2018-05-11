	function check1() {
		var id = document.fr.id.value;
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;//이름에 한글만 입력하는 부분
		var e_check= /[a-z]/;
		var E_check=/[A-Z]/;
		var t_check=/[0-9]/;
		var space_check=/[\s]/g;
		var a_check=/[~!@#$%^&*()_+|<>?:{}]/;
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;



 		if (document.fr.m_id.value == "") {
			alert("아이디를 입력하세요");
			document.fr.m_id.focus();
			return;
		}
		if (document.fr.m_id.value.length < 8) {
			alert("아이디는 최소 8자 이상 입니다 ");
			document.fr.m_id.focus();
			return;
		}

		if (space_check.test(document.fr.m_id.value)) {
			alert("아이디에 공백을 사용할 수 없습니다.");
			document.fr.m_id.focus()
			return;
		}

		//비밀번호 입력여부 체크
		if (document.fr.m_pwd.value == "") {
			alert("비밀번호를 입력하지 않았습니다.");
			document.fr.m_pwd.focus()
			return;
		}
		if (document.fr.m_pwd.value.length< 8 || document.fr.m_pwd.value.length>15) {//비밀번호 확인하는부분
			alert("비밀번호를 8~15 자리로 입력하세요")
			document.fr1.m_pwd.focus();
			return;
		}
		if(!e_check.test(document.fr.m_pwd.value) && !E_check.test(document.fr.m_pwd.value)&& !a_check.test(document.fr.m_pwd.value) && t_check.test(document.fr.m_pwd.value)){
			alert("숫자 특수문자 대문자 조합으로 입력하세요")
			document.fr1.m_pwd.focus();
			return;
		}
		if(space_check.test(document.fr.m_pwd.value)){
			alert("비밀번호엔 공백은 들어 갈 수 없습니다.")
			document.fr1.pwd.focus();
			return;
		}
		
		if (fr.m_pwd.value == fr.m_id.value) {
			alert("아이디와 같은 비밀번호는 사용 하실 수 없습니다.");
			document.fr.m_pwd.focus()
			return;
		}
		//이름
		if (document.fr.m_name.value == "") {
			alert("이름을 입력하지 않았습니다.");
			document.fr.m_name.focus()
			return;
		}
		if (document.fr.m_name.value.length < 2) {
			alert("이름을 2자 이상 입력해주십시오.");
			document.fr.m_name.focus()
			return;
		}
		if(space_check.test(document.fr.m_name.value)){
			alert("이름엔 공백은 들어 갈 수 없습니다.")
			document.fr1.m_name.focus();
			return;
		}
		if(a_check.test(document.fr.m_name.value)){
			alert("이름엔 특수문자는 들어 갈 수 없습니다.")
			document.fr1.m_name.focus();
			return;
		} 
		
		//주민번호1
	 /* 	if(!e_check.test(document.fr.num1.value) || !E_check.test(document.fr.num1.value) || !a_check.test(document.fr.num1.value) || !check.test(document.fr.num1.value) || !space_check(document.fr.num1.value)){
			alert("숫자로만 입력바랍니다.");
			document.fr.m_num1.focus()
			return ;
		} *
		if (document.fr.m_num1.value == "") {
			alert("주민번호를 입력하지 않았습니다.");
			document.fr.m_num1.focus()
			return;
		}
		if (document.fr.m_num1.value == 6) {
			alert("6자리 입력 하시기 바랍니다.");
			document.fr.num1.focus()
			return;
		}
		//주민번호2
		if (document.fr.m_num2.value == "") {
			alert("주민번호를 입력하지 않았습니다.");
			document.fr.m_num2.focus()
			return;
		}
		/* if(document.fr.m_num2.value<=1 || document.fr.m_num2.value>=4){
			alert("1~4 숫자로먼 입력바랍니다.");
			document.fr.m_num2.focus()
			return ;
		} */
	 /* 	if(e_check.test(document.fr.num2.value) || E_check.test(document.fr.m_num2.value) || a_check.test(document.fr.m_num2.value) || check.test(document.fr.m_num2.value) || space_check(document.fr.m_num2.value)){
			alert("숫자로만 입력바랍니다.");
			document.fr.num2.focus()
			return;
		}   */

		 // 숫자가 아닌 것을 입력한 경우
	 	if (!t_check.test(document.fr.m_num1.value)) {
			alert("주민번호는 숫자로 입력하세요.");
			document.fr.m_num1.focus()
			return;
		}
		// 숫자가 아닌 것을 입력한 경우
		if (!t_check.test(document.fr.m_num1.value)) {
			alert("주민번호는 숫자로 입력하세요.");
			document.fr.m_num2.focus()
			return;
		}  
		 document.fr.submit(); 
		
	}