package com.hms.patientAppointment;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.hms.db.CurrentDate;
import com.hms.db.MySqlConnection;

public class AppointmentBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer appointmentId;
	private Integer patientId;
	private String patientFirstName;
	private String patientLastName;
	private String checkup;
	private Date appointmentDate;
	private Integer userId;
	private String email;
	private Long contact;
	private String symptoms;
	public String gender;
	public Integer age;
	private String address;

	public AppointmentBean() {

	}

	public Integer getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(Integer appointmentId) {
		this.appointmentId = appointmentId;
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

	public String getCheckup() {
		return checkup;
	}

	public void setCheckup(String checkup) {
		this.checkup = checkup;
	}

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getContact() {
		return contact;
	}

	public void setContact(Long contact) {
		this.contact = contact;
	}

	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
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

	/* Get appointments by user id */

	public ArrayList<AppointmentBean> getAppointmentsByUserId(Integer userId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<AppointmentBean> aList = null;

		try {
			AppointmentBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from appointment where user_id = ? order by  appointment_date desc");
			pstmt.setInt(1, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				aBean = new AppointmentBean();

				aBean.setAppointmentId(rs.getInt("appointment_id"));
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAppointmentDate(rs.getDate("appointment_date"));
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
			System.out.println("FROM APPOINTMENT BEAN GET APPOINTMENT BY USER ID >>>> \n" + e);
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

	/* Get appointments by department */

	public ArrayList<AppointmentBean> getAppointmentsDepartment(String department) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<AppointmentBean> aList = null;

		try {
			AppointmentBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from appointment where checkup_type = ?");

			pstmt.setString(1, department);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				aBean = new AppointmentBean();

				aBean.setAppointmentId(rs.getInt("appointment_id"));
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAppointmentDate(rs.getDate("appointment_date"));
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
			System.out.println("FROM APPOINTMENT BEAN GET APPOINTMENT BY USER ID >>>> \n" + e);
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

	/* Get all appointments */
	public ArrayList<AppointmentBean> getAllAppointments() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		ArrayList<AppointmentBean> aList = null;

		try {
			AppointmentBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			stmt = con.createStatement();

			rs = stmt.executeQuery("select * from appointment");

			while (rs.next()) {
				aBean = new AppointmentBean();

				aBean.setAppointmentId(rs.getInt("appointment_id"));
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAppointmentDate(rs.getDate("appointment_date"));
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
			System.out.println("FROM APPOINTMENT BEAN GET ALL APPOINTMENTS");
		}

		finally {
			try {
				if (stmt != null) {
					stmt.close();
				}

				if (con != null) {
					stmt.close();
				}
			} catch (Exception e2) {
			}
		}
		return aList;

	}

	/* Get appointment by id */
	public ArrayList<AppointmentBean> getAppointmentsByAppointmentId(Integer appId) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<AppointmentBean> aList = null;

		try {
			AppointmentBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from appointment where appointment_id = ?");
			pstmt.setInt(1, appId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				aBean = new AppointmentBean();

				aBean.setAppointmentId(rs.getInt("appointment_id"));
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAppointmentDate(rs.getDate("appointment_date"));
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
			System.out.println("FROM APPOINTMENT BEAN GET APPOINTMENT BY USER ID >>>> \n" + e);
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

	/* Get appointments by date */
	public ArrayList<AppointmentBean> getAppointmentsByDate(Date date) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<AppointmentBean> aList = null;

		try {
			AppointmentBean aBean = null;
			aList = new ArrayList<>();
			con = MySqlConnection.getConnection();
			pstmt = con.prepareStatement("select * from appointment where appointment_date = ?");
			pstmt.setDate(1, date);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				aBean = new AppointmentBean();

				aBean.setAppointmentId(rs.getInt("appointment_id"));
				aBean.setPatientId(rs.getInt("patient_id"));
				aBean.setPatientFirstName(rs.getString("patient_firstname"));
				aBean.setPatientLastName(rs.getString("patient_lastname"));
				aBean.setCheckup(rs.getString("checkup_type"));
				aBean.setAppointmentDate(rs.getDate("appointment_date"));
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
			System.out.println("FROM APPOINTMENT BEAN GET APPOINTMENT BY Date >>>> \n" + e);
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

	// helper method to count items in cart
	public static int countActiveAppointments(Integer customerId) {

		Date currentDate = CurrentDate.getCurrnetDate();

		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;

		int count = 0;

		try {

			con = MySqlConnection.getConnection();
			pstmt = con
					.prepareStatement("select count(*) from appointment where user_id = ? and appointment_date >= ?");
			pstmt.setInt(1, customerId);
			pstmt.setDate(2, currentDate);

			rs = pstmt.executeQuery();

			rs.next();

			count = rs.getInt(1);

		} catch (Exception e) {
			// TODO: handle exception
		}

		return count;
	}

	public static boolean isEqualOrLater(Date appointmentDate, Date currentDate) {
		return !appointmentDate.before(currentDate);
	}

}
