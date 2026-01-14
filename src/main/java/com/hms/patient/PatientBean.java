package com.hms.patient;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.hms.db.MySqlConnection;
import com.hms.patientAppointment.AppointmentBean;

public class PatientBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer patientId;
	private String patientFirstName;
	private String patientLastName;
	private String gender;
	private Integer age;
	private String checkup;
	private String symptoms;
	private String email;
	private String address;
	private Long contact;
	private Timestamp admittedDate;
	private Integer userId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getPatientId() {
		return patientId;
	}

	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}

	public String getPatientFirstName() {
		return patientFirstName;
	}

	public void setPatientFirstName(String patientFirstName) {
		this.patientFirstName = patientFirstName;
	}

	public String getPatientLastName() {
		return patientLastName;
	}

	public void setPatientLastName(String patientLastName) {
		this.patientLastName = patientLastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getCheckup() {
		return checkup;
	}

	public void setCheckup(String checkup) {
		this.checkup = checkup;
	}

	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Timestamp getAdmittedDate() {
		return admittedDate;
	}

	public void setAdmittedDate(Timestamp admittedDate) {
		this.admittedDate = admittedDate;
	}
	
	
	/* Get patient details by id */
	
	public ArrayList<PatientBean> getPatientById(Integer pId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<PatientBean> aList = null;
		
		
		try {
			PatientBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from patient where patient_id = ?");
			pstmt.setInt(1, pId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				aBean = new PatientBean();
				
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAdmittedDate(rs.getTimestamp("admitted_date"));
				aBean.setSymptoms(rs.getString("symptoms"));
				aBean.setEmail(rs.getString("email"));
				aBean.setContact(rs.getLong("contact"));
				aBean.setGender(rs.getString("gender"));
				aBean.setAge(rs.getInt("age"));
				aBean.setAddress(rs.getString("address"));
				aBean.setUserId(rs.getInt("user_id"));
				
				
				aList.add(aBean);
			}

		} catch (Exception e) {
			System.out.println("FROM PATIENT BEAN GET PATIENT BY PATIENT ID >>>> \n" + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				
				if (con != null) {
					con.close();
				
				}
				
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		
		return aList;
	}
	
	
	/* Get patient details by department */
	
	public ArrayList<PatientBean> getPatientByDepartment(String department) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<PatientBean> aList = null;
		
		
		try {
			PatientBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from patient where checkup_type = ?");
			pstmt.setString(1, department);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				aBean = new PatientBean();
				
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAdmittedDate(rs.getTimestamp("admitted_date"));
				aBean.setSymptoms(rs.getString("symptoms"));
				aBean.setEmail(rs.getString("email"));
				aBean.setContact(rs.getLong("contact"));
				aBean.setGender(rs.getString("gender"));
				aBean.setAge(rs.getInt("age"));
				aBean.setAddress(rs.getString("address"));
				aBean.setUserId(rs.getInt("user_id"));
				
				
				aList.add(aBean);
			}

		} catch (Exception e) {
			System.out.println("FROM PATIENT BEAN GET PATIENT BY PATIENT ID >>>> \n" + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				
				if (con != null) {
					con.close();
				
				}
				
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		
		System.out.println("The count of patients by department wise :- " + aList.size());
		
		return aList;
	}
	
	
	/* Get patient details by contact or patient id */
	
	public ArrayList<PatientBean> getPatientByContactOrId(Long contact) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<PatientBean> aList = null;
		
		
		try {
			PatientBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from patient where contact = ? or patient_id = ?");
			pstmt.setLong(1, contact);
			pstmt.setLong(2, contact);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				aBean = new PatientBean();
				
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAdmittedDate(rs.getTimestamp("admitted_date"));
				aBean.setSymptoms(rs.getString("symptoms"));
				aBean.setEmail(rs.getString("email"));
				aBean.setContact(rs.getLong("contact"));
				aBean.setGender(rs.getString("gender"));
				aBean.setAge(rs.getInt("age"));
				aBean.setAddress(rs.getString("address"));
				aBean.setUserId(rs.getInt("user_id"));
				
				
				aList.add(aBean);
			}

		} catch (Exception e) {
			System.out.println("FROM PATIENT BEAN GET PATIENT BY PATIENT ID >>>> \n" + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				
				if (con != null) {
					con.close();
				
				}
				
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		
		System.out.println("The count of patients by department wise :- " + aList.size());
		
		return aList;
	}
	
	
	public int getPatientCountByDepartment(String department) {
		
		ArrayList<PatientBean> pBean = getPatientByDepartment(department);
		
		int listSize = pBean.size();
		
		return listSize;
		
	}
	
	

	public ArrayList<PatientBean> getPatients() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		ArrayList<PatientBean> aList = null;
		
		
		try {
			PatientBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			stmt = con.createStatement();
			
			rs = stmt.executeQuery("select * from patient");
			
			
			while (rs.next()) {
				aBean = new PatientBean();
				
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAdmittedDate(rs.getTimestamp("admitted_date"));
				aBean.setSymptoms(rs.getString("symptoms"));
				aBean.setEmail(rs.getString("email"));
				aBean.setContact(rs.getLong("contact"));
				aBean.setGender(rs.getString("gender"));
				aBean.setAge(rs.getInt("age"));
				aBean.setAddress(rs.getString("address"));
				aBean.setUserId(rs.getInt("user_id"));
				
				aList.add(aBean);
			}

		} catch (Exception e) {
			System.out.println("FROM PATIENT BEAN GET PATIENT BY PATIENT ID >>>> \n" + e);
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				
				if (con != null) {
					con.close();
				
				}
				
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		
		return aList;
	}

}
