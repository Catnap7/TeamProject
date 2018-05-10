<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.3.1.js"></script>

<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/customer.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

$(document).ready(function(){

// 	for(int i=1; i<=10; i++) {
<%-- 	 	$('#sub_'+<%=i %>+'').click(function(){ --%>
<%-- 	 		$('#con_'+<%=i %>+'').toggle('slow'); --%>
// 	 	});
// 	}
	
// 	for문 사용해서 #sub_i(1~게시판 글 갯수까지), #con_i(1~게시판 글 갯수까지) 돌려주세요
	$('#sub_1').click(function(){
		$('#con_1').toggle();
	});
	$('#sub_2').click(function(){
		$('#con_2').toggle();
	});
	$('#sub_3').click(function(){
		$('#con_3').toggle();
	});
	$('#sub_4').click(function(){
		$('#con_4').toggle();
	});
	$('#sub_5').click(function(){
		$('#con_5').toggle();
	});
	$('#sub_6').click(function(){
		$('#con_6').toggle();
	});
	$('#sub_7').click(function(){
		$('#con_7').toggle();
	});
	$('#sub_8').click(function(){
		$('#con_8').toggle();
	});
	$('#sub_9').click(function(){
		$('#con_9').toggle();
	});
	$('#sub_10').click(function(){
		$('#con_10').toggle();
	});
	$('#sub_11').click(function(){
		$('#con_11').toggle();
	});
// 	for문 사용해서 #sub_i(1~게시판 글 갯수까지), #con_i(1~게시판 글 갯수까지) 돌려주세요
});
</script>
</head>
<body>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>
<!------------- 전체---------------->
  <div class="wrap">
    <div class="container">
      <div class="subject">
        <h1>공지사항</h1>
      </div>
      <div class="notice">
       <!------------- for문---------------->
        <h2 id="sub_1" class="jemok"><%="[EVENT] 왓플이 PlayStation®4 Pro 쏘니?" %></h2>
        <div id="con_1" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
       <!------------- for문---------------->
        
        <!------------- 디자인 예시임(구현 후 삭제)---------------->
        <h2 id="sub_2" class="jemok"><%="5월 1주 새로 올라온 작품" %></h2>
        <div id="con_2" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_3" class="jemok"><%="4월 4주 새로 올라온 작품" %></h2>
        <div id="con_3" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_4" class="jemok"><%="4월까지 감상 가능한 콘텐츠" %></h2>
        <div id="con_4" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_5" class="jemok"><%="법인명 변경에 따른 이용약관 등 변경 안내" %></h2>
        <div id="con_5" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_6" class="jemok"><%="3월까지 감상 가능한 콘텐츠" %></h2>
        <div id="con_6" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_7" class="jemok"><%="HBO 시리즈 서비스 목록" %></h2>
        <div id="con_7" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_8" class="jemok"><%="[당첨자발표] 새해 첫 시청자에게 큰 선물이!" %></h2>
        <div id="con_8" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_9" class="jemok"><%="2017년 성적통지표 도착!" %></h2>
        <div id="con_9" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_10" class="jemok"><%="삼성/LG 스마트TV 지원!" %></h2>
        <div id="con_10" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        
        <h2 id="sub_11" class="jemok"><%="너무 감사해서 하는 이벤트, 당첨자 발표!" %></h2>
        <div id="con_11" style="display: none;" class="naeyong"><%="[상품]1등: PlayStation®4 Pro (10명)2등: 소니 빔프로젝터 (1명)3등: 소니 노이즈캔슬링 헤드폰 (2명)4등: 소니 블루투스 스피커 (2명)5등: 영화 예매권 (150명)6등: 아메리카노 기프티콘 (200명)[기간]2018년 4월 30일 ~ 5월 22일" %></div>
        <hr>
        <!------------- 디자인 예시임(구현 후 삭제)---------------->
      </div>
    </div>
    
    <!------------- 채팅---------------->
    <div class="chat">
        <input type="button" value="1:1 문의" onclick="location.href='./UserChatClient.ac'">
    </div>
    <!------------- 채팅---------------->
    
  </div>
  <!------------- 전체---------------->
</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>