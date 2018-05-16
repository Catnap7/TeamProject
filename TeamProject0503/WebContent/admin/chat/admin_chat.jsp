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
<title>Admin Chating Room</title>
</head>
<body>
<%

Date now = new Date();

%>
   <div class="container">
      <div class="container bootstrap snippet">
         <div class="row">
            <div class="col-xs-12">
               <div class="portlet portlet-default">
                  <div class="portlet-heading">
                     <div class="portlet-title">
                        <h4>   <i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
                     </div>
                     <div class="clearfix"></div>
                  </div>
                  <div id="chat" class="pannel-collapse collapse in">
                     <div class="portlet-body chat-widget"
                        style="overflow-y: auto; width: auto; height: 300px;">
                        <div class="row">
                           <div class="col-lg-12">
                              <p class="text-center text-muted small"><%=now %></p>
                           </div>
                        </div>
                        <div class="row">
                        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
                           <!-- 한명의 대화 공간 -->
                           <div class="col-lg-12">
                              <div class="media">
                                 <div class="media-body">
                                    <h4 class="media-heading">홍길동 <span class="small pull-right">오후 13:26</span></h4>
                                 </div>
                                 <br>
                                 <p id="messageWindow"></p>
                              </div>
                           </div>
                        </div>
                        <!-- 한명의 대화 공간 -->
                        <hr>
                        <div class="row">
                           <!-- 한명의 대화 공간 -->
                           <div class="col-lg-12">
                              <div class="media">
                                 <div class="media-body">
                                    <h4 class="media-heading">이순신 <span class="small pull-right">오후 13:28</span></h4>
                                 </div>
                                 <br>
                                 <p>네 오랜만입니다.^^ 이순신입니다.~</p>
                              </div>
                           </div>
                        </div>
                     </div>
                        <!-- 한명의 대화 공간 -->
                        <div class="portlet-footer">
                           <!-- 이름 입력창 -->
                           <div class="row">
                              <div class="form-group col-xs-4">
                              </div>
                           </div>
                           <div class="row" style="height: 90px;">
                              <div class="form-group col-xs-10">
                                 <textarea rows="" cols="" style="height: 80px;" id="inputMessage" class="form-control" placeholder="내용을 입력하세요"  maxlength="100"></textarea>
                              </div>
                              <div class="form-group col-xs-2">
         							<input type="submit" value="send" onclick="send()" /> 
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        <!-- 이름 입력창 -->
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
</body>
     <script type="text/javascript">
         var textarea = document.getElementById("messageWindow"); 
         //서버 컴퓨터의 경로를 설정해주어야함
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
    	 textarea.value += "상대 : " + event.data + "\n";
     } 
  
     function onOpen(event) { 
         textarea.value += "채팅방에 입장하였습니다.\n"; 
     } 
  
     function onError(event) { 
       alert(event.data); 
     } 
  
     function send() { 
    	 textarea.value += "나 : " + inputMessage.value + "\n"; 
         webSocket.send(inputMessage.value); 
         inputMessage.value = ""; 
     } 
   </script>
</html>