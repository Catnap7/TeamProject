<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>와츄 : WATCHU</title>
<script type="text/javascript">

 /*하루동안 보지않기  exdays*24*60*60*1000) */
function couponClose(){
    if($("input[name='chkbox']").is(":checked") ==true){
        setCookie("close","Y",1);
    }
    window.close();

}
</script>
</head>
<body>

<!-- 팝업 -->
<div>
<div id="popp27">
 <div class="cont">
  <img src="./images/popup3_white.png" usemap="#imgmap2018530115127" alt="할인쿠폰광고 " border="0" width="400px" height="400px"></div>
 <map id="imgmap2018530115127" name="imgmap2018530115127"><area shape="rect" alt="" title="" coords="80,130,320,350" href="./Roulette.ro" target="" /><!-- Created by Online Image Map Editor (http://www.maschek.hu/imagemap/index) --></map>
 <div class="close">
  <form method="post" action="" name="pop_form">
   <span id="check"><input type="checkbox" value="checkbox" name="chkbox" id="chkday"/><label for="chkday">오늘 하루동안 보지 않기</label></span>
   <span id="close">닫기</span>
  </form>
 </div>
</div>
</div>
<!--  end of popup -->



</body>
</html>