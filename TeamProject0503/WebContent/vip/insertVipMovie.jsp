<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : WATCHU</title>
<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<!-- <link href="./css/vip_admin.css" rel="stylesheet" type="text/css">  -->
<link href="./css/vip_form.css" rel="stylesheet" type="text/css">

<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->

<!-- vip 서브메뉴 -->
<jsp:include page="../vip/vipAdmin_sub.jsp"/>
<!-- vip 서브메뉴 -->

<article class="I_content">
		<div id="content">
			<h1 class="adminTitle">Vip 영화 입력</h1>
			<p>이번달 vip이벤트 영화 입력해 주십시오</p>

			<form action="./VipInsert.vi" method="post" name="fr">
				<table border="0" class="db_list_insert">
					<tr>
						<td>상영회 예정 날짜(YY.MM.DD)</td>
						<td><input type="text" name="v_date" placeholder="예)18.05.21"></td>
					</tr>
					<tr>
						<td>상영회 예정 시간(HH:mm ~ HH:mm)</td>
						<td><input type="text" name="v_when" placeholder="예)18:50~20:08"></td>
					</tr>
					<tr>
						<td>한글제목</td>
						<td><input type="text" name="v_kor_title" placeholder="예)화양연화"></td>
					</tr>
					
					<tr>
						<td>영어제목</td>
						<td><input type="text" name="v_eng_title" placeholder="예)InTheMoodForLove"></td>
					</tr>
					<tr>
						<td>년도(숫자만)</td>
						<td><input type="text" name="v_year" placeholder="예)2000"></td>
					</tr>
					<tr>
						<td>국가(국내 /해외)</td>
						<td><input type="text" name="v_country" placeholder="예)해외"></td>
					</tr>
					<tr>
						<td>관람등급(0/12/15/19)</td>
						<td><input type="text" name="v_age" placeholder="예)15"></td>
					</tr>
					<tr>
						<td>장르</td>
						<td><input type="text" name="v_genre" placeholder="예)멜로"></td>
					</tr>
					<tr>
						<td>러닝타임(숫자만)</td>
						<td><input type="text" name="v_time" placeholder="예)97"></td>
					</tr>
					<tr>
						<td>감독(한글로)</td>
						<td><input type="text" name="v_director" placeholder="예)왕가위"></td>
					</tr>
					<tr>
						<td>배우(주연만)</td>
						<td><input type="text" name="v_actor" placeholder="예)양조위,장만옥"></td>
					</tr>
					<tr>
						<td>줄거리</td>
						<td><textarea cols="40" rows="10" name="v_story"></textarea></td>
					</tr>
					<tr>
						<td>리뷰 1 출처</td>
						<td><input type="text"  name="v_critic_1_by" placeholder="예)가디언지"></td>
					</tr>
					<tr>
						<td>리뷰 1</td>
						<td><textarea cols="40" rows="10" name="v_critic_1"></textarea></td>
					</tr>
					<tr>
						<td>리뷰 2 출처</td>
						<td><input type="text"  name="v_critic_2_by" placeholder="예)타임지"></td>
					</tr>
					<tr>
						<td>리뷰 2</td>
						<td><textarea cols="40" rows="10" name="v_critic_2"></textarea></td>
					</tr>
					<tr>
						<td>예고편 소스</td>
						<td><input type="text"  name="v_video"></td>
					</tr>	
					<tr>	
					<div class="u_admin-notice-write">
						<button type="button"  class="wirtebtn" onclick="history.back()">돌아가기</button>
						<input type="submit"  class="wirtebtn" value="입력">
					</div>
					</tr>
				</table>
			</form>
		</div>
</article>

	<!-- 푸터 영역 -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- 푸터 영역 -->
</body>
</html>