package timer;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import net.vip.db.VipDAO;


public class VipTimeController extends HttpServlet {
	
	public void init() throws ServletException{
		Calendar date = Calendar.getInstance();
		 
		  date.set(Calendar.YEAR, 2018);
		  date.set(Calendar.MONTH, 6);
		  date.set(Calendar.DATE, 21);
		  date.set(Calendar.AM_PM, Calendar.AM);
		  date.set(Calendar.HOUR, 0);
		  date.set(Calendar.MINUTE, 0);
		  date.set(Calendar.SECOND, 0);
		  date.set(Calendar.MILLISECOND, 0);
		  
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
           public void run() {
               try {
               	//런할때 실행시킬메소드. 
            	
            	//한달에 한번 vip선정   
   				//먼저 vip인 회원의 그레이드를 낮추고,(메소드 실행)
   				VipDAO vdao= new VipDAO();
   				vdao.AutodeleteVip();
   				
   				//grade값이 변경되도록하는 메소드.
   				vdao.AutoselectVip();
   				
               } catch (Exception e) {
                   e.printStackTrace();
               }
           }
       }, date.getTime(), 1000L * 60 * 60 * 24 * 7 * 4); // 4주에 한번
		
    }//end init
}
