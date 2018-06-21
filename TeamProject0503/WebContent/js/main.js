// 메인에 실시간으로 동작하기 ajax
function realtimeMain(){ 
	setInterval("realtime()", 1000*10); //10초 간격
}

function realtime(){
	$.ajax({
		type: 'POST',
		url: './RealtimeAlarm.ma'																	 					 		
	});//end ajax 	
}