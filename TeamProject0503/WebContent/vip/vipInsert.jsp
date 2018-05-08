<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vip 영화 입력폼</title>
</head>
<body>
	<h2>Vip 영화 입력폼</h2>
	<p>이번달 vip이벤트 영화 입력해 주십시오</p>
	<form action="./VipInsert.vi" method="post" name="fr">
		한글제목 : <input type="text" name="v_kor_title" placeholder="예)화양연화"><br>
		영어제목(띄워쓰기 없이) : <input type="text" name="v_eng_title" placeholder="예)InTheMoodForLove"><br>
		년도(숫자만) : <input type="text" name="v_year" placeholder="예)2000"><br>
		국가(국내 /해외) : <input type="text" name="v_country" placeholder="예)해외"><br>
		관람등급(0/12/15/19) : <input type="text" name="v_age" placeholder="예)15"><br>
		장르 : <select name="v_genre">  
				<option value="">장르를 선택하세요</option> 
				<option value="action">액션</option>
				<option value="animation">애니메이션</option>
				<option value="comedy">코메디</option>	
				<option value="drama">드라마</option>	
				<option value="horror">공포</option>	
				<option value="indie">독립영화</option>	
				<option value="romance">멜로</option>	
				<option value="sf">SF</option>
				<option value="thriller">스릴러</option>		
			</select><br> 
		러닝타임(숫자만) : <input type="text" name="v_time" placeholder="예)97"><br>
		감독(한글) : <input type="text" name="v_director" placeholder="예)왕가위"><br>
		배우(주연만/띄워쓰기없이) : <input type="text" name="v_actor" placeholder="예)양조위,장만옥"><br>
		줄거리: <input type="text" name="v_story"><br>
		예고편 소스 : <input type="text" name="v_video"><br>
		<input type="submit" value="입력" id="submit" class="text">
	</form>

</body>
</html>