package net.member.action;

import java.util.Random;

public class HelloCoupon {

	public static String couponnum(){
		String hellocoupon = null;
		  //실행시 ???개 쿠폰 생성
		  int couponSize = 1;

		  final char[] possibleCharacters =
		    {'1','2','3','4','5','6','7','8','9'
		    		,'0'
		    		/*,'A','B','C','D','E','F',
		     'G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V',
		     'W','X','Y','Z'*/};
		  
		  final int possibleCharacterCount = possibleCharacters.length;
		  String[] arr = new String[couponSize];
		  Random rnd = new Random();
		  int currentIndex = 0;
		  int i = 0;
		  while (currentIndex < couponSize) {
		   StringBuffer buf = new StringBuffer(16);
		   //i는 8자리의 랜덤값을 의미
		   for (i= 8; i > 0; i--) {
		    buf.append(possibleCharacters[rnd.nextInt(possibleCharacterCount)]);
		   }
		   String couponnum = buf.toString();
		   arr[currentIndex] = couponnum;
		   currentIndex++;
		   hellocoupon = couponnum;
		  }
		
		return hellocoupon;
	}
	
	
	
}
