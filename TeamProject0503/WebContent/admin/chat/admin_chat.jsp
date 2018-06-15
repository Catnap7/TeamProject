<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="viewport" content="width=device-width, initial-scale=1">
<link href="./css/css/bootstrap2.css" rel="stylesheet" type="text/css">
<link href="./css/css/custom.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="../css/js/bootstrap.js"></script>

<title>영화 토론</title>
</head>
<body>
	<div class="row">
		<div class="col-xs-12">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4><i class="fa fa-circle text-green"></i>영화 토론</h4>
					</div>
					<div class="clearfix"></div>
				</div>
				<div id="chat" class="pannel-collapse collapse in">
					<div class="portlet-body chat-widget">
						<div class="row">
							<div class="col-lg-12">
								<p class="text-center text-muted small"></p>
							</div>
						</div>
						<div class="row" style="height: 500px">
							<textarea id="messageWindow" rows="10" cols="50" readonly="readonly" style="width: 100%; height: 100%;"></textarea>
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4"></div>
								</div>
								<div class="row" style="height: 90px;">
									<div class="form-group col-xs-10">
										<textarea rows="10" cols="50" style="height: 80px; width: 365px;" id="inputMessage" class="form-control" placeholder="내용을 입력하세요" maxlength="100" onkeyup="enter_chk();"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
         var textarea = document.getElementById("messageWindow"); 
         var webSocket = new WebSocket('ws://192.168.2.12:8080/TeamProject0503/AdminChatAction'); 
         var inputMessage = document.getElementById('inputMessage'); 
     webSocket.onerror = function(event) {
       onError(event) 
     }; 
  
     webSocket.onopen = function(event) {
       onOpen(event) 
     }; 
  
     webSocket.onmessage = function(event) {
       onMessage(event)
     }; 
  
     function onMessage(event) {
    	 textarea.value += "\n" + "상대"+ "\n" + event.data + "\n\n";
    	 document.getElementById("messageWindow").scrollTop = document.getElementById("messageWindow").scrollHeight;
     }
  
     function onOpen(event) {
         textarea.value += "채팅방에 입장하였습니다.\n\n";
     } 
  
     function onError(event) {
       alert(event.data); 
     }
     function send() {
    	 textarea.value += "나 " + "\n" + inputMessage.value + "\n\n"; 
         webSocket.send(inputMessage.value);
         inputMessage.value="";
         document.getElementById("messageWindow").scrollTop = document.getElementById("messageWindow").scrollHeight;
     	 return false;
     } 
     function enter_chk() {
    	 if(!event.keyCode==13) {
     }else {
    	 send();
     }
   </script>
</html>