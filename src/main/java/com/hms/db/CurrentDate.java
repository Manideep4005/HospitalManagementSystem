package com.hms.db;

public class CurrentDate {
	public static java.sql.Date getCurrnetDate() {
		java.sql.Date  currentDate = null;
		
		try {
			java.util.Date date = java.util.Calendar.getInstance().getTime();
			currentDate = new java.sql.Date(date.getTime());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return currentDate;
	}
	
	public static void main(String[] args) {
		System.out.println(getCurrnetDate());
	}
}
