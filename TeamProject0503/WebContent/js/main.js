// 메인에 실시간으로 동작하기 ajax
window.onload = function(){ 
	setInterval("realtime()", 1000*10);

};

function realtime(){
	$.ajax({
		type: 'POST',
		url: './RealtimeAlarm.ma'																	 					 		
	});//end ajax 	
}