	$(document).ready(function() {
		//아이디 중복 체크 실행 여부(0:중복체크X 1:중복체크O)
		
		$('#name_ck').click(function() {
			  if (document.fr.m_name.value == "") {
					alert("이름을 입력하지 않았습니다.");
					document.fr.m_name.focus()
					return;
				}  
		var m_name =$('#name').val();
		alert(m_name);
		$.ajax({
			type:"post",
			url:"./MemeberNameCk.me",
			data:{
				"m_name":m_name
				
			},
			success:function(data){
				if(data==1){
					alert("사용가능한 이름입니다")

				}else {
					alert("사용불가능한 이름입니다.")
				}
			}
		}); 
	});
	});