package net.member.action;

import java.security.MessageDigest;
import java.security.SecureRandom;

import sun.misc.BASE64Encoder;

public class Sha256 {
	public static String encrypt(String planText, String salt) {
		String encriptPassword = "";
		int ITERATION_NUMBER=1000;
		
		try{
        	
        	MessageDigest md = MessageDigest.getInstance("SHA-256");
//            md.reset();//들어가고 안들어가고 무슨차이지?
        	md.reset();

        	//salt를 먼저 넣고
        	md.update(salt.getBytes());
        	//패스워드 넣고
        	byte[] input = md.digest(planText.getBytes("UTF-8"));
            for (int i = 0; i < ITERATION_NUMBER; i++) {
            	md.reset();
                input = md.digest(input);
            }

            BASE64Encoder endecoder = new BASE64Encoder();
            encriptPassword = endecoder.encode(input);
        } catch(Exception e) {
            e.printStackTrace();
        }

		return encriptPassword;
    }

	
/*	솔트생성
 * 
*/
	public static String getSalt() {
        String value = "";
        try {
            SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
            // Salt generation 128 bits long
            byte[] salt = new byte[16];
            secureRandom.nextBytes(salt);
            value = salt.toString();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return value;
    }


}
