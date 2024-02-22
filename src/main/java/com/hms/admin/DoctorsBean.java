package com.hms.admin;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.hms.db.MySqlConnection;

public class DoctorsBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int doctorId;
	private String doctorFirstName;
	private String doctorLastName;
	private String gender;
	private String email;
	private String education;
	private String specialization;
	private int experience;
	private String address;
	private long contact;
	
	
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	
	
	public String getDoctorFirstName() {
		return doctorFirstName;
	}
	public void setDoctorFirstName(String doctorFirstName) {
		this.doctorFirstName = doctorFirstName;
	}
	public String getDoctorLastName() {
		return doctorLastName;
	}
	public void setDoctorLastName(String doctorLastName) {
		this.doctorLastName = doctorLastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
	
	
	public ArrayList<DoctorsBean> getDoctors() throws Exception{
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<DoctorsBean> dlist = null;
		
		try {
			Connection con = MySqlConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from doctor");
			DoctorsBean dBean = null;
			dlist = new ArrayList<DoctorsBean>();
			
			while (rs.next()) {
				dBean = new DoctorsBean();
				
				dBean.setDoctorId(rs.getInt("doctor_id"));
				dBean.setDoctorFirstName(rs.getString("doctor_firstname"));
				dBean.setDoctorLastName(rs.getString("doctor_lastname"));
				dBean.setGender(rs.getString("gender"));
				dBean.setEmail(rs.getString("email"));
				dBean.setEducation(rs.getString("education"));
				dBean.setSpecialization(rs.getString("specialization"));
				dBean.setExperience(rs.getInt("experience"));
				dBean.setAddress(rs.getString("address"));
				dBean.setContact(rs.getLong("contact"));
				
				dlist.add(dBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
		finally {
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
		
		return dlist;
	}
	
	
	/* to list doctor details by doctor Id */
	
	public ArrayList<DoctorsBean> getDoctorById(Integer id) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<DoctorsBean> dlist = null;
		
		try {
			Connection con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from doctor where doctor_id = ?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			DoctorsBean dBean = null;
			dlist = new ArrayList<DoctorsBean>();
			
			while (rs.next()) {
				dBean = new DoctorsBean();
				
				dBean.setDoctorId(rs.getInt("doctor_id"));
				dBean.setDoctorFirstName(rs.getString("doctor_firstname"));
				dBean.setDoctorLastName(rs.getString("doctor_lastname"));
				dBean.setGender(rs.getString("gender"));
				dBean.setEmail(rs.getString("email"));
				dBean.setEducation(rs.getString("education"));
				dBean.setSpecialization(rs.getString("specialization"));
				dBean.setExperience(rs.getInt("experience"));
				dBean.setAddress(rs.getString("address"));
				dBean.setContact(rs.getLong("contact"));
				
				dlist.add(dBean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
		finally {
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
		
		return dlist;
	}
}
