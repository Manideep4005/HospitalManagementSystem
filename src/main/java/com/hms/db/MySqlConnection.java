package com.hms.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConnection {
	public static Connection getConnection() {
		Connection con = null;
		
		try {
<<<<<<< HEAD
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms", "root", "root");
=======
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Database Name", "userName", "Password");
>>>>>>> e06896c5d3b881a587992830e685134132707732
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
