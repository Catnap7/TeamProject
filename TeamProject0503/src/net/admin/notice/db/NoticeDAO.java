package net.admin.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();		
		return con;
	}
	


	
}
