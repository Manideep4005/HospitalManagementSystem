package com.hms.user;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.hms.db.MySqlConnection;

public class UserBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer userId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String gender;
	private String address;
	private Long contact;
	private Date join_date;
	private Timestamp passwordChangeDate;

	public UserBean() {
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getContact() {
		return contact;
	}

	public void setContact(Long contact) {
		this.contact = contact;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Timestamp getPasswordChangeDate() {
		return passwordChangeDate;
	}

	public void setPasswordChangeDate(Timestamp passwordChangeDate) {
		this.passwordChangeDate = passwordChangeDate;
	}

	
	
	
	
	public ArrayList<UserBean> getUsers() throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<UserBean> uList = null;

		try {
			Connection con = MySqlConnection.getConnection();
			
			stmt = con.createStatement();
			
			rs = stmt.executeQuery("select * from user");
			
			UserBean uBean = null;
			uList = new ArrayList<>();
			
			while (rs.next()) {
				uBean = new UserBean();
				
				uBean.setUserId(rs.getInt("userid"));
				uBean.setFirstName(rs.getString("first_name"));
				uBean.setLastName(rs.getString("last_name"));
				uBean.setPassword(rs.getString("password"));
				uBean.setEmail(rs.getString("email"));
				uBean.setGender(rs.getString("gender"));
				uBean.setAddress(rs.getString("address"));
				uBean.setContact(rs.getLong("contact"));
				uBean.setJoin_date(rs.getDate("join_date"));
				uBean.setPasswordChangeDate(rs.getTimestamp("passwordchangedate"));
				
				
				uList.add(uBean);
			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return uList;
	}
	
	public ArrayList<UserBean> getUserById(Integer id) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserBean> uList = null;

		try {
			Connection con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from user where userid = ?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			UserBean uBean = null;
			uList = new ArrayList<>();
			
			while (rs.next()) {
				uBean = new UserBean();
				
				uBean.setUserId(rs.getInt("userid"));
				uBean.setFirstName(rs.getString("first_name"));
				uBean.setLastName(rs.getString("last_name"));
				uBean.setPassword(rs.getString("password"));
				uBean.setEmail(rs.getString("email"));
				uBean.setGender(rs.getString("gender"));
				uBean.setAddress(rs.getString("address"));
				uBean.setContact(rs.getLong("contact"));
				uBean.setJoin_date(rs.getDate("join_date"));
				uBean.setPasswordChangeDate(rs.getTimestamp("passwordchangedate"));
				
				
				uList.add(uBean);
			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return uList;
	}

	
	public static Integer getUserByIdEmail(String email) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Integer userId = 0;
		
		try {
			Connection con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select userid from user where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				userId = rs.getInt("userid");
			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return userId;
	}
	
	public static String getUserNameByemail(String email) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String fname = "";
		String lname = "";
		
		try {
			Connection con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from user where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				fname = rs.getString("first_name");
				lname = rs.getString("last_name");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return fname + " " + lname;
	}
	
	
	public static int checkEmailExists(String email) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			Connection con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select count(*) from user where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				count = rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return count;
	}


}
