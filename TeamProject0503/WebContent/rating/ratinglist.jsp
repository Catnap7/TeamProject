<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
   float: left;  
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}
.rating > label { 
  color: #ddd; 
  float: right;/* float 지우면 별점 css가 반대로 먹혀요. */
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 


/* 이미지파일 크기 설정 */
img{width: 300px;}

.frame{
background-color: #55d}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//string2.jsp에
	//파라미터값 넘겨서data:{name:"홍길동", age:21}
	//결과 받아서 body 태그 뒷부분에 추가
	
	$("input[name=ra_rating]").click(function(){
		/* var $this=$(this) */
		/*
		제대로 값을 받아 들고감. 
		var a = $(this).val();
		alert(a);
		 */

//		부모 선택자를 챙겨간다.
// 		var b=$(this).parent().get( 0 ).tagName;
// 		alert(b);

		 /*  안된다
 		var c=$(this).parent().get( 1 ).addClass("frame");
		$(this).parent().get( 1 ).addClass("frame");
		 alert(c);		 
		  */
		  
		  
/* 			이거 된다!!!  */		  
// 		  var $this=$(this);
// 		  $this.parent().parent().addClass("frame");
		 //alert(a);
/* 		var $this=$(this);
		
		var f = $this.parent().parent().get( 0 ).tagName;
		alert(f); */
/* 		 
		var formData = $this.parent().parent().get( 0 ).serialize();
		alert(formData);
		  */
/* 안됨
		  var $this=$(this);
			var formData = $this.parent().parent().get( 0 ).val();
			alert(formData);		  
 */		  
		 var $this=$(this);
//		 $this.parent().parent()
// var $formData = $this.parent().parent().serialize();

		$.ajax({
            type: "POST",
            url: "./RatingAction.ra",
            dataType: "html",
            data: {ra_p_num:"24",ra_rating:"3"},
            success: function(data, txtStatus) {
            	alert("success");
            },
            error: function(xhr, txtStatus, errorThrown) {
                alert(errorThrown);
            }   
		});
	
		
		
	});
});
</script>

</head>
<body>

<%
//request.setAttribute("goodsList", goodsList);
List movielist=(List)request.getAttribute("movielist");
%>

<%
if(movielist!=null){
for(int i=0;i<movielist.size();i++){
	MovieBean moviebean=(MovieBean)movielist.get(i);
	int mv_num=moviebean.getMv_num();
	
	/* 스릴러, 호러 나눠진 영화 장르 thriller로 합쳐서 저장*/
	String img_genre= "";
	if(moviebean.getMv_genre().equals("animation")){
		img_genre="animation";
	}else if(moviebean.getMv_genre().equals("comedy")){
		img_genre="comedy";
	}else if(moviebean.getMv_genre().equals("indie")){
		img_genre="indie";
	}else if(moviebean.getMv_genre().equals("sf")){
		img_genre="sf";
	}else if(moviebean.getMv_genre().equals("action")){
		img_genre="action";
	}else if(moviebean.getMv_genre().equals("horror") || moviebean.getMv_genre().equals("thriller")){
		img_genre="thriller";
	}else if(moviebean.getMv_genre().equals("romance") || moviebean.getMv_genre().equals("drama")){
		img_genre="romance";
	}
	
	String age = "";
	if(moviebean.getMv_age()==0){
		age = "전체이용가";
	}else if(moviebean.getMv_age()==12){
		age = "12세이용가";
	}else if(moviebean.getMv_age()==15){
		age="15세이용가";
	}else if(moviebean.getMv_age()==19){
		age="청소년이용불가";
	}
	
	%>
	<!-- 이미지 업로드폴더명 체크할것.  -->
	
	
	
	
<!-- 스릴러,공포 폴더가 따로 나눠져있지 않음 -->
<div><img src="./images/<%=img_genre%>/<%=moviebean.getMv_eng_title().replace(" ","") %>_p.jpg"></div>

<form action="" id="starform<%=mv_num %>">
<input type="hidden" name="ra_p_num" value="mv_num">
<!-- 별점 시작 -->
<fieldset class="rating" id="starfield<%=mv_num %> value="<%=mv_num %>">
    <input type="radio" id="star5<%=mv_num %>" name="ra_rating" value="5" /><label class = "full" for="star5<%=mv_num %>" title="5 stars"></label>
    <input type="radio" id="star4<%=mv_num %>" name="ra_rating" value="4" /><label class = "full" for="star4<%=mv_num %>" title="4 stars"></label>
    <input type="radio" id="star3<%=mv_num %>" name="ra_rating" value="3" /><label class = "full" for="star3<%=mv_num %>" title="3 stars"></label>
    <input type="radio" id="star2<%=mv_num %>" name="ra_rating" value="2" /><label class = "full" for="star2<%=mv_num %>" title="2 stars"></label>
    <input type="radio" id="star1<%=mv_num %>" name="ra_rating" value="1" /><label class = "full" for="star1<%=mv_num %>" title="1 star"></label>
</fieldset>
<!-- 별점 끝 -->
</form>

<div><%=moviebean.getMv_kor_title() %>	</div>
<div><%=moviebean.getMv_year() %>	</div>
<%-- <div><%=age %>	</div> --%>
	
<%
}
}
%>



</body>
</html>