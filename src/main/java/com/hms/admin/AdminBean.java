package com.hms.admin;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.hms.db.MySqlConnection;

public class AdminBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AdminBean() {

	}

	private Integer admin_id;
	private String firstName;
	private String lastName;
	private String email;
	private String gender;
	private String address;
	private Long contact;
	private String password;

	public Integer getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ArrayList<AdminBean> getAdminById(Integer id) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminBean> aList = null;

		try {
			Connection con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from admin where admin_id = ?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			AdminBean aBean = null;
			aList = new ArrayList<>();
			
			while (rs.next()) {
				aBean = new AdminBean();
				
				aBean.setAdmin_id(rs.getInt("admin_id"));
				aBean.setFirstName(rs.getString("admin_firstname"));
				aBean.setLastName(rs.getString("admin_lastname"));
				aBean.setEmail(rs.getString("email"));
				aBean.setGender(rs.getString("gender"));
				aBean.setAddress(rs.getString("address"));
				aBean.setContact(rs.getLong("contact"));
				aBean.setPassword(rs.getString("password"));
				
				aList.add(aBean);
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
		return aList;
	}






	public ArrayList<AdminBean> getAdminNameById(Integer id) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminBean> aList = null;

		try {
			Connection con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from admin where admin_id = ?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			AdminBean aBean = null;
			aList = new ArrayList<>();
			
			while (rs.next()) {
				aBean = new AdminBean();
				
				aBean.setAdmin_id(rs.getInt("admin_id"));
				aBean.setFirstName(rs.getString("admin_firstname"));
				aBean.setLastName(rs.getString("admin_lastname"));
				aBean.setEmail(rs.getString("email"));
				aBean.setGender(rs.getString("gender"));
				aBean.setAddress(rs.getString("address"));
				aBean.setContact(rs.getLong("contact"));
				aBean.setPassword(rs.getString("password"));
				
				aList.add(aBean);
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
		return aList;
	}

















}
