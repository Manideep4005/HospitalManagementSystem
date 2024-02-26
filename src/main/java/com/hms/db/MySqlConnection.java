package com.hms.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConnection {
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Database Name", "userName", "Password");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
