package timer;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import net.main.action.DailyReset;
import net.pay.db.PayDAO;



public class PayTimeController extends HttpServlet {

	public void init() throws ServletException{	

		 Calendar date = Calendar.getInstance();
		 
		  date.set(Calendar.YEAR, 2018);
		  date.set(Calendar.MONTH, 6);
		  date.set(Calendar.DATE, 20);
		  date.set(Calendar.AM_PM, Calendar.AM);
		  date.set(Calendar.HOUR, 0);
		  date.set(Calendar.MINUTE, 0);
		  date.set(Calendar.SECOND, 0);
		  date.set(Calendar.MILLISECOND, 0);
		
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
            public void run() {
                try {
                 // 런할때 실행시킬메소드. 
    				
    				//정기결제하는 사람들이 만료다음날짜 00시00분에 결제되는 메소드
    				System.out.println("자동결제 실행"+new Date()+" team0524");
    				PayDAO pdao= new PayDAO();
    				pdao.autoInsertPay();

    				// 00시에 기한만료 회원 m_pay등급조정
    				System.out.println("m_pay등급조절"+new Date()+" team0524");
    				pdao.autoUpdateMpaytoZero();
    				
    				//룰렛횟수 리셋
    				DailyReset dailyReset= new DailyReset();
    				dailyReset.run();
    				
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }, date.getTime(), 1000 * 60 * 60 * 24);  //하루
		
	}//end init
}