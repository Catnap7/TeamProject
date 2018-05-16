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