$(document).ready(function(){
	//string2.jsp에
	//파라미터값 넘겨서data:{name:"홍길동", age:21}
	//결과 받아서 body 태그 뒷부분에 추가
	
	$("input[name=fa_favorite]").click(function(){
		$this=$(this);
		$this.parent().parent().addClass("params");
		   
		var formData = $('.params').serialize(); 
		
		$.ajax({
            type: "get",
            url: "./FavoriteAction.fa",
            dataType: "html",
            data: formData,
            success: function(data, txtStatus) {
//            	alert("success");
            	$this.parent().parent().removeClass("params");
            },
            error: function(xhr, txtStatus, errorThrown) {
                alert(errorThrown);
            }   
		});
	});
});
