package com.hms.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class LoginValidate {
	static Connection con = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	public static boolean loginAdmin(Integer adminId, String password) {
		boolean status = false;
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement("select * from admin where admin_id = ? and password = ?");
			
			pstmt.setInt(1, adminId);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			status = rs.next();
			
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				if (con != null) {
					con.close();
					
				}
				
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return status;
	}
	
	public static boolean loginCustomer(String customerId, String password) {
		boolean status = false;
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement("select * from user where userid = ? and password = ?");
			
			pstmt.setString(1, customerId);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			status = rs.next();
			
		}
		catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				if (con != null) {
					con.close();
					
				}
				
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return status;
	}
	
	public static boolean loginDoctor(Integer doctorId, String email) {
		boolean status = false;
		try {
			pstmt = MySqlConnection.getConnection().prepareStatement("select * from doctor where doctor_id= ? and email = ?");
			pstmt.setInt(1, doctorId);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			status = rs.next();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				if (con != null) {
					con.close();
					
				}
				
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return status;
	}
}
