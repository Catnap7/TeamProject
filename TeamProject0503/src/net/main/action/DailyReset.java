package net.main.action;

import java.util.Date;
import java.util.TimerTask;

import net.member.db.MemberDAO;
import net.roulette.db.rouletteDAO;

public class DailyReset extends TimerTask{

	@Override
	public void run() {
		System.out.println("DailyReset 구동"+new Date());
		rouletteDAO rdao = new rouletteDAO();
		rdao.rouletteReset();
		MemberDAO mdao = new MemberDAO();
		mdao.m_rouletteReset();
	}
	
}
