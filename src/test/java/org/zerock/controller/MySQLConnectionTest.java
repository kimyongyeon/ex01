package org.zerock.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/spring_db";
	private static final String USER = "spring";
	private static final String PW = "1234";
	
	@Test
	public void testConnection() throws Exception {
		try (Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println(con);
		} catch (Exception e ){
			e.printStackTrace();
		}
	}

}
