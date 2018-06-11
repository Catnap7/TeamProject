/* serpiko.tistory.com */
/*룰렛 돌리기 코드*/
window.onload = function(){  	
	
    var pArr = ["0:꽝","1:10%","2:꽝","3:50%","4:꽝","5:10%","6:꽝","7:100%","8:50%","9:10%"];   
    var ten=0;  /* 10프로 쿠폰 칸의 가중치 0.03*/    
    var fif = 0; /* 50프로 쿠폰 칸의 가중치 0.025*/    
    var hun = 0; /* 100프로 쿠폰 칸의 가중치 0.01*/   
    var fail= (1-(ten*3+fif*2+hun*1))/4; /* 꽝 칸의 가중치 0.21*/
    var rotatenum =0; /* 회전각도 */
    var checknum=0;
    
    $('#start_btn').click(function(){ 
    	var id_frm = $("input[name=id]");						   
			$.ajax({
				type: 'POST',
				url: './RouletteAction.ro',
				dataType : "json",
				data: {
					"id" : $(id_frm).val()
				},

				error:function(){ 				 
				    alert("error"); 				            
				    }, 

				success: function(data){
					
					$.each(data,function(index,item){
						//alert(item.ten+":"+item.fif+":"+item.hun+":"+item.checknum);
						 ten=item.ten/3; /* 10프로 쿠폰 칸의 가중치 */
						 fif=item.fif/2; /* 50프로 쿠폰 칸의 가중치 */ 
						 hun=item.hun/1; /* 100프로 쿠폰 칸의 가중치 */
						 fail= (1-(ten*3+fif*2+hun*1))/4; /* 꽝 칸의 가중치 */
						 checknum=item.checknum; /*이전 당첨여부*/
					   });
					if(checknum==0){
			    		alert("오늘 룰렛횟수를 모두 사용하셨습니다.");
			    	}else if(checknum==1){			    		
			    		rotation();
			    	}    																				 					 
				}
			});//end ajax 
		    	       
    }); //end click
 
    function rotation(){    	
        $("#image").rotate({
          angle:0,
          animateTo:360 * 5 + randomRotate(),                            
          center: ["50%", "50%"],
          easing: $.easing.easeInOutElastic,
          callback: function(){
                        var n = $(this).getRotateAngle();
                        endAnimate(n);
                    },
          duration:5000
       });
    }
 
    function endAnimate($n){
        var n = $n;        
        var real_angle = n%360+18;
        //$('#result_id').html("<p>실제 움직인각도:" +real_angle+ "</p>");
        var part = Math.floor(real_angle/36);
     
        //$('#result_id2').html("<p>상품범위:" + part + "</p>");
 
        if(part < 1){
            //$('#result_id3').html("<p>당첨내역:" + pArr[0] + "</p>");
            alert("아쉽게도 꽝입니다. 다음 기회를 노리세요!");
            return;
        }
 
        if(part >= 10){
            //$('#result_id3').html("<p>당첨내역:" + pArr[0] + "</p>");
            alert("아쉽게도 꽝입니다. 다음 기회를 노리세요!");
            return;
        }
        
        if(part==2|part==4|part==6){
        	alert("아쉽게도 꽝입니다. 다음 기회를 노리세요!");
        }
        if(part==1|part==5|part==9){
        	alert("10% 쿠폰 당첨되셨습니다!. 쿠폰함을 확인해주세요.");
        }
        if(part==3|part==8){
        	alert("50% 쿠폰 당첨되셨습니다!. 쿠폰함을 확인해주세요.");
        }
        if(part==7){
        	alert("100% 쿠폰 당첨되셨습니다!. 쿠폰함을 확인해주세요.");
        }
        
        /*$('#result_id3').html("<p>당첨내역:" + pArr[part] + "</p>");
        
        $('#result_id4').html("<p>10프로 확률:" + ten*3 + "</p>");
        $('#result_id5').html("<p>50프로 확률:" + fif*2 + "</p>");
        $('#result_id6').html("<p>100프로 확률:" + hun*1 + "</p>");
        $('#result_id7').html("<p>꽝 확률:" + fail*4 + "</p>");*/
    } 
 
    function randomize($min, $max){
        return Math.round(Math.random() * ($max - $min )) + $min;
    }
    
    function randomRotate(){
    	var rannum = Math.random(); /* 랜덤한 숫자 */
        /* alert(rannum); */
        /* 함수를 확률로 실행 */
        if(rannum<=fail/2){
         rotatenum = randomize(0, 17);  /* 꽝 */      
        }
        if(rannum>fail/2 & rannum<=fail/2+ten){
            rotatenum = randomize(19, 54);  /* 10% 쿠폰 */
            downRoulette("10% 쿠폰");           
           }
        if(rannum>fail/2+ten & rannum<=fail/2+ten+fail ){
            rotatenum = randomize(55, 88);     /* 꽝 */      
           }
        if(rannum>fail/2+ten+fail & rannum<=fail/2+ten+fail+fif ){
            rotatenum = randomize(91, 126);   /* 50% 쿠폰 */
            downRoulette("50% 쿠폰");          
           }
        if(rannum>fail/2+ten+fail+fif & rannum<=fail/2+ten+fail*2+fif){
            rotatenum = randomize(127, 162);     /* 꽝 */      
           }
        if(rannum>fail/2+ten+fail*2+fif & rannum<=fail/2+ten*2+fail*2+fif ){
            rotatenum =  randomize(163, 198);      /* 10% 쿠폰 */
            downRoulette("10% 쿠폰");            
           }
        if(rannum>fail/2+ten*2+fail*2+fif & rannum<=fail/2+ten*2+fail*3+fif ){
            rotatenum =  randomize(199, 233);    /* 꽝 */       
           }
        if(rannum>fail/2+ten*2+fail*3+fif & rannum<=fail/2+ten*2+fail*3+fif+hun*1 ){
            rotatenum =  randomize(235, 270);        /* 100% 쿠폰  */  
            downRoulette("100% 쿠폰");           
           }
        if(rannum>fail/2+ten*2+fail*3+fif+hun*1 & rannum<=fail/2+ten*2+fail*3+fif*2+hun*1){
            rotatenum =  randomize(271, 306);           /* 50% 쿠폰 */ 
            downRoulette("50% 쿠폰");           
           }
        if(rannum>fail/2+ten*2+fail*3+fif*2+hun*1 & rannum<=fail/2+ten*3+fail*3+fif*2+hun*1 ){
            rotatenum =  randomize(307, 342);       /* 10% 쿠폰 */
            downRoulette("10% 쿠폰");           
           }
        if(rannum>fail/2+ten*3+fail*3+fif*2+hun*1){
            rotatenum =  randomize(343, 360);    /* 꽝 */       
           }
        /* 함수를 확률로 실행 */
        //alert("ten확률"+ten*3+"fif확률"+fif*2+"hun확률"+hun*1+"꽝확률"+fail*4);
        return rotatenum;
    }
    
    function downRoulette($coupon){
    	var id_frm = $("input[name=id]");						   
		$.ajax({
			type: 'POST',
			url: './RouletteWinner.ro',
			dataType : "json",
			data: {
				"id" : $(id_frm).val(),
				"c_name" :$coupon 
			},

			error:function(){}, 
			success: function(data){}
		});//end ajax 
		
    }//end down
};