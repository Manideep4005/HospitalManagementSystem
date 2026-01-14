package com.hms.mailService;

<<<<<<< HEAD
import java.io.UnsupportedEncodingException;
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
<<<<<<< HEAD
import jakarta.mail.MessagingException;
=======
>>>>>>> e06896c5d3b881a587992830e685134132707732
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
<<<<<<< HEAD
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
=======
import jakarta.mail.internet.MimeMessage;
import jakarta.activation.*;
>>>>>>> e06896c5d3b881a587992830e685134132707732

public class EmailSender {
	public boolean userSendEmail(String to, String from, String subject, Integer userId, String userName, String role) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

<<<<<<< HEAD
		final String mailUserName = "hms2systems@gmail.com";
		final String mailPassword = "fctj oipt bfbo oaoo";
=======
		final String mailUserName = "Your mail UserName";
		final String mailPassword = "Your Mail Password";
>>>>>>> e06896c5d3b881a587992830e685134132707732

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress(from, "no-replay@Hospital Management System"));
			message.setSubject(subject);
			message.setContent("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "	<style type=\"text/css\">\r\n"
					+ "		*{\r\n" + "			font-family: 'Poppins', sans-serif;\r\n" + "		}\r\n"
					+ "		.main {\r\n" + "			border: 1px solid darkorange;\r\n"
					+ "			border-radius: 5px;\r\n" + "			padding: 20px;\r\n"
					+ "			margin-left: auto;\r\n" + "			margin-right: auto;\r\n" + "		}\r\n" + "\r\n"
					+ "		.para {\r\n" + "			font-size: 16px;\r\n" + "			font-weight: 500;\r\n"
					+ "		}\r\n" + "\r\n" + "		#userid {\r\n" + "			font-weight: 700;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button {\r\n" + "			padding: 10px;text-align:center;width:100px;\r\n"
					+ "			margin-left: auto;\r\n" + "			margin-right: auto;\r\n"
<<<<<<< HEAD
					+ "			display: block;\r\n" + "			color: white;text-decoration:none;\r\n"
					+ "			background: darkorange;\r\n" + "			border: 2px solid darkorange;\r\n"
					+ "			border-radius: 3px;\r\n" + "			font-size: 16px;\r\n"
					+ "			cursor: pointer;\r\n" + "			transition-duration: .4s;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button:hover {\r\n" + "			\r\n" + "			color: white;\r\n"
					+ "		}\r\n" + "		hr {\r\n" + "			border: none;\r\n" + "			height: 1px;\r\n"
					+ "			background: gray;\r\n" + "		}\r\n" + "	</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "	<div class=\"main\">\r\n" + "\r\n" + "		<h3>Dear " + userName + ",</h3>\r\n"
					+ "		<p class=\"para\">Thank you for Registering with Hospital Management System.</p>\r\n"
					+ "		<p class=\"para\">The " + role + " id generated is:- <span id=\"userid\">" + userId
					+ "</span></p>\r\n" + "		<p class=\"para\"> click below button for login</p>\r\n"
					+ "<a href=\"http://" + iAddress() + ":8081/HospitalManagementSystem/" + role
					+ "login.jsp\" class=\"button\">click here</a>" + "\r\n"
=======
					+ "			display: block;\r\n" + "			color: white;\r\n"
					+ "			background: darkorange;\r\n" + "			border: 2px solid darkorange;\r\n"
					+ "			border-radius: 3px;\r\n" + "			font-size: 16px;\r\n"
					+ "			cursor: pointer;\r\n" + "			transition-duration: .4s;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button:hover {\r\n" + "			background: white;\r\n"
					+ "			color: black;\r\n" + "		}\r\n" + "		hr {\r\n" + "			border: none;\r\n"
					+ "			height: 1px;\r\n" + "			background: gray;\r\n" + "		}\r\n"
					+ "	</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "	<div class=\"main\">\r\n" + "\r\n"
					+ "		<h3>Dear " + userName + ",</h3>\r\n"
					+ "		<p class=\"para\">Thank you for Registering with Hospital Management System.</p>\r\n"
					+ "		<p class=\"para\">The " + role + " id generated is:- <span id=\"userid\">" + userId
					+ "</span></p>\r\n"
					+ "		<p class=\"para\">Please use your user id and password to login to your account, click below button for login.</p>\r\n"
					+ "<a href=\"http://"
					+ iAddress() + ":8081/HospitalManagementSystem/" + role + "login.jsp\" class=\"button\">click here</a>" + "\r\n"
>>>>>>> e06896c5d3b881a587992830e685134132707732
					+ "		<p class=\"para\">Best Regards,<br>Hospital Management System.</p>\r\n" + "		<hr>\r\n"
					+ "		<p class=\"note\">Note: This email is system generated please do not replay.</p>\r\n"
					+ "	</div>\r\n" + "	\r\n" + "</body>\r\n" + "</html>", "text/html");

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	/* Appointment */
<<<<<<< HEAD
	public boolean appointmentSendEmail(
	        String to, String from, String subject,
	        Integer patientId, String patientName,
	        String userName, Integer appointmentId) {

	    final boolean[] flag = {false}; // Mutable for callback/debugging

	    new Thread(() -> {
	        try {
	            Properties properties = new Properties();
	            properties.put("mail.smtp.auth", true);
	            properties.put("mail.smtp.starttls.enable", true);
	            properties.put("mail.smtp.port", "587");
	            properties.put("mail.smtp.host", "smtp.gmail.com");

	            final String mailUserName = "hms2systems@gmail.com";
	            final String mailPassword = "fctj oipt bfbo oaoo";

	            Session session = Session.getInstance(properties, new Authenticator() {
	                @Override
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication(mailUserName, mailPassword);
	                }
	            });

	            Message message = new MimeMessage(session);
	            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
	            message.setFrom(new InternetAddress(from, "no-reply@Hospital Management System"));
	            message.setSubject(subject);

	            // Beautiful HTML email content
	            String htmlContent = "<!DOCTYPE html>"
	                    + "<html>"
	                    + "<head>"
	                    + "<meta charset='UTF-8'>"
	                    + "<style>"
	                    + "body { font-family: 'Arial', sans-serif; background-color: #f4f6f8; padding: 30px; margin: 0; }"
	                    + ".email-container { max-width: 600px; background: #ffffff; margin: auto; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); padding: 30px; }"
	                    + ".header { text-align: center; padding-bottom: 20px; border-bottom: 1px solid #eaeaea; }"
	                    + ".logo { max-width: 200px; margin: 0 auto 15px; }"
	                    + ".title { font-size: 24px; color: #004085; margin: 0; font-weight: bold; }"
	                    + ".greeting { font-size: 16px; color: #333333; margin: 20px 0 10px 0; }"
	                    + ".content { font-size: 15px; color: #555555; line-height: 1.6; }"
	                    + ".info-box { background-color: #e9f0fb; border-left: 4px solid #007bff; padding: 15px 20px; margin: 20px 0; border-radius: 5px; }"
	                    + ".info-label { font-weight: 600; color: #004085; }"
	                    + ".footer { font-size: 13px; color: #999999; text-align: center; margin-top: 30px; border-top: 1px solid #eaeaea; padding-top: 20px; }"
	                    + ".note { color: #cc0000; font-size: 12px; margin-top: 15px; text-align: center; }"
	                    + "</style>"
	                    + "</head>"
	                    + "<body>"
	                    + "<div class='email-container'>"
	                    + "  <div class='header'>"
	                    + "    <img src='cid:logoImage' alt='Hospital Logo' class='logo' />"
	                    + "    <h1 class='title'>Appointment Confirmation</h1>"
	                    + "  </div>"
	                    + "  <p class='greeting'>Dear " + userName + ",</p>"
	                    + "  <p class='content'>Thank you for scheduling your appointment with us. Below are your appointment details for your reference:</p>"
	                    + "  <div class='info-box'>"
	                    + "    <p><span class='info-label'>Patient Name:</span> " + patientName + "</p>"
	                    + "    <p><span class='info-label'>Patient ID:</span> " + patientId + "</p>"
	                    + "    <p><span class='info-label'>Appointment ID:</span> " + appointmentId + "</p>"
	                    + "  </div>"
	                    + "  <p class='content'>Please keep these details safe. If you have any questions, feel free to contact our support team.</p>"
	                    + "  <p class='content'>We look forward to serving you.</p>"
	                    + "  <div class='footer'>"
	                    + "    Regards,<br/>"
	                    + "    Hospital Management System"
	                    + "  </div>"
	                    + "  <div class='note'>*** This is a system-generated email. Please do not reply to this message. ***</div>"
	                    + "</div>"
	                    + "</body>"
	                    + "</html>";

	            // Multipart for HTML and inline image
	            MimeMultipart multipart = new MimeMultipart("related");

	            // HTML body
	            MimeBodyPart htmlPart = new MimeBodyPart();
	            htmlPart.setContent(htmlContent, "text/html");

	            // Inline logo image
	            MimeBodyPart imagePart = new MimeBodyPart();
	            imagePart.attachFile("E:\\Java Ide Practice\\Web Projects\\HospitalManagementSystem\\src\\main\\webapp\\CSS\\MANI_HOSPITAL.png");
	            imagePart.setContentID("<logoImage>");
	            imagePart.setDisposition(MimeBodyPart.INLINE);

	            multipart.addBodyPart(htmlPart);
	            multipart.addBodyPart(imagePart);

	            message.setContent(multipart);

	            long start = System.currentTimeMillis();
	            Transport.send(message);
	            long end = System.currentTimeMillis();

	            System.out.println("Async HTML email sent with image in " + (end - start) + "ms");
	            flag[0] = true;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }).start();

	    // Immediate return – send happens in background!
	    return true;
	}


=======
	public boolean appointmentSendEmail(String to, String from, String subject, Integer patientId, String patientName,
			String userName) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

		final String mailUserName = "Your mail UserName";
		final String mailPassword = "Your Mail Password";

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress(from, "no-replay@Hospital Management System"));
			message.setSubject(subject);
			message.setContent("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "	<style type=\"text/css\">\r\n"
					+ "		*{\r\n" + "			font-family: 'Poppins', sans-serif;\r\n" + "		}\r\n"
					+ "		.main {\r\n" + "			border: 1px solid darkorange;\r\n"
					+ "			border-radius: 5px;\r\n" + "			padding: 20px;\r\n"
					+ "			margin-left: auto;\r\n" + "			margin-right: auto;\r\n" + "		}\r\n" + "\r\n"
					+ "		.para {\r\n" + "			font-size: 16px;\r\n" + "			font-weight: 500;\r\n"
					+ "		}\r\n" + "\r\n" + "		#userid {\r\n" + "			font-weight: 700;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button {\r\n" + "			padding: 10px;text-align:center;width:100px;\r\n"
					+ "			margin-left: auto;\r\n" + "			margin-right: auto;\r\n"
					+ "			display: block;\r\n" + "			color: white;\r\n"
					+ "			background: darkorange;\r\n" + "			border: 2px solid darkorange;\r\n"
					+ "			border-radius: 3px;\r\n" + "			font-size: 16px;\r\n"
					+ "			cursor: pointer;\r\n" + "			transition-duration: .4s;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button:hover {\r\n" + "			background: white;\r\n"
					+ "			color: black;\r\n" + "		}\r\n" + "		hr {\r\n" + "			border: none;\r\n"
					+ "			height: 1px;\r\n" + "			background: gray;\r\n" + "		}\r\n"
					+ "	</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "	<div class=\"main\">\r\n" + "\r\n"
					+ "		<h3>Dear " + userName + ",</h3>\r\n"
					+ "		<p class=\"para\">Thank you for consulting us.</p>\r\n"
					+ "		<p class=\"para\">You booked an appointment for " + patientName
					+ " and patient Id generated is:- <span id=\"userid\">" + patientId + "</span></p>\r\n"
					+ "		<p class=\"para\">Please note the patient id for further reference.</p>\r\n"
					+ "		\r\n" + "			" + "\r\n"
					+ "		<p class=\"para\">Best Regards,<br>Hospital Management System.</p>\r\n" + "		<hr>\r\n"
					+ "		<p class=\"note\">Note: This email is system generated please do not replay.</p>\r\n"
					+ "	</div>\r\n" + "	\r\n" + "</body>\r\n" + "</html>", "text/html");

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

>>>>>>> e06896c5d3b881a587992830e685134132707732
	/* Admin */

	public boolean adminSendEmail(String to, String from, String subject, Integer adminId, String adminName,
			String role) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

<<<<<<< HEAD
		final String mailUserName = "hms2systems@gmail.com";
		final String mailPassword = "fctj oipt bfbo oaoo";
=======
		final String mailUserName = "Your mail UserName";
		final String mailPassword = "Your Mail Password";
>>>>>>> e06896c5d3b881a587992830e685134132707732

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress(from, "no-replay@Hospital Management System"));
			message.setSubject(subject);
			message.setContent("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "	<style type=\"text/css\">\r\n"
					+ "		*{\r\n" + "			font-family: 'Poppins', sans-serif;\r\n" + "		}\r\n"
					+ "		.main {\r\n" + "			border: 1px solid darkorange;\r\n"
					+ "			border-radius: 5px;\r\n" + "			padding: 20px;\r\n"
					+ "			margin-left: auto;\r\n" + "			margin-right: auto;\r\n" + "		}\r\n" + "\r\n"
					+ "		.para {\r\n" + "			font-size: 16px;\r\n" + "			font-weight: 500;\r\n"
					+ "		}\r\n" + "\r\n" + "		#userid {\r\n" + "			font-weight: 700;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button {\r\n" + "			padding: 10px;text-align:center;width:100px;\r\n"
					+ "			margin-left: auto;\r\n" + "			margin-right: auto;\r\n"
					+ "			display: block;\r\n" + "			color: white;\r\n"
					+ "			background: darkorange;\r\n" + "			border: 2px solid darkorange;\r\n"
					+ "			border-radius: 3px;\r\n" + "			font-size: 16px;\r\n"
					+ "			cursor: pointer;\r\n" + "			transition-duration: .4s;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button:hover {\r\n" + "			background: white;\r\n"
					+ "			color: black;\r\n" + "		}\r\n" + "		hr {\r\n" + "			border: none;\r\n"
					+ "			height: 1px;\r\n" + "			background: gray;\r\n" + "		}\r\n"
					+ "	</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "	<div class=\"main\">\r\n" + "\r\n"
					+ "		<h3>Dear " + adminName + ",</h3>\r\n"
					+ "		<p class=\"para\">Thank you for Registering with Hospital Management System.</p>\r\n"
					+ "		<p class=\"para\">The " + role + " id generated is:- <span id=\"userid\">" + adminId
<<<<<<< HEAD
					+ "</span></p>\r\n" + "		<p class=\"para\">click below button for login</p>\r\n"
					+ "<a href=\"http://" + iAddress() + ":8081/HospitalManagementSystem/" + role
					+ "login.jsp\" class=\"button\">click here</a>" + "\r\n"
=======
					+ "</span></p>\r\n"
					+ "		<p class=\"para\">Please use your ADMIN ID and PASSWORD to login to your account, click below button for login.</p>\r\n"
					+ "<a href=\"http://"
					+ iAddress() + ":8081/HospitalManagementSystem/" + role + "login.jsp\" class=\"button\">click here</a>" + "\r\n"
>>>>>>> e06896c5d3b881a587992830e685134132707732
					+ "		<p class=\"para\">Best Regards,<br>Hospital Management System.</p>\r\n" + "		<hr>\r\n"
					+ "		<p class=\"note\">Note: This email is system generated please do not replay.</p>\r\n"
					+ "	</div>\r\n" + "	\r\n" + "</body>\r\n" + "</html>", "text/html");

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	/* Doctor Register */

	public boolean doctorRegisterEmail(String to, String from, String subject, String adminName, Integer doctorId,
			String doctorName, String doctorMail, String role) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

<<<<<<< HEAD
		final String mailUserName = "hms2systems@gmail.com";
		final String mailPassword = "fctj oipt bfbo oaoo";
=======
		final String mailUserName = "Your mail UserName";
		final String mailPassword = "Your Mail Password";
		
>>>>>>> e06896c5d3b881a587992830e685134132707732
		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress(from, "no-replay@Hospital Management System"));
			message.setSubject(subject);
			message.setContent("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "	<style type=\"text/css\">\r\n"
					+ "		*{\r\n" + "			font-family: 'Poppins', sans-serif;\r\n" + "		}\r\n"
					+ "		.main {\r\n" + "			border: 1px solid darkorange;\r\n"
					+ "			border-radius: 5px;\r\n" + "			padding: 20px;\r\n"
					+ "			margin-left: auto;\r\n" + "			margin-right: auto;\r\n" + "		}\r\n" + "\r\n"
					+ "		.para {\r\n" + "			font-size: 16px;\r\n" + "			font-weight: 500;\r\n"
					+ "		}\r\n" + "\r\n" + "		#userid {\r\n" + "			font-weight: 700;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button {\r\n" + "			padding: 10px;text-align:center;width:100px;\r\n"
					+ "			margin-left: auto;\r\n" + "			margin-right: auto;\r\n"
					+ "			display: block;\r\n" + "			color: white;\r\n"
					+ "			background: darkorange;\r\n" + "			border: 2px solid darkorange;\r\n"
					+ "			border-radius: 3px;\r\n" + "			font-size: 16px;\r\n"
					+ "			cursor: pointer;\r\n" + "			transition-duration: .4s;\r\n" + "		}\r\n"
					+ "\r\n" + "		.button:hover {\r\n" + "			background: white;\r\n"
					+ "			color: black;\r\n" + "		}\r\n" + "		hr {\r\n" + "			border: none;\r\n"
					+ "			height: 1px;\r\n" + "			background: gray;\r\n" + "		}\r\n"
					+ "	</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "	<div class=\"main\">\r\n" + "\r\n"
					+ "		<h3>Dear " + adminName + ",</h3>\r\n"
					+ "		<p class=\"para\">You have registered a new Dcotor at Hospital Management System.</p>\r\n"
					+ "		<p class=\"para\">The " + role + " id generated is:- <span id=\"userid\">" + doctorId
					+ "</span></p>" + "<p class=\\\"para\\\">The Doctor Email is:- <span id=\"userid\">" + doctorMail
					+ "</span></p>\r\n"
					+ "		<p class=\"para\">Please Share the Doctor ID to new registered Doctor.</p>\r\n"
					+ "		<p class=\"para\">Best Regards,<br>Hospital Management System.</p>\r\n" + "		<hr>\r\n"
					+ "		<p class=\"note\">Note: This email is system generated please do not replay.</p>\r\n"
					+ "	</div>\r\n" + "	\r\n" + "</body>\r\n" + "</html>", "text/html");

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean userForgotPasswordEmail(String from, String to, String subject, Integer otp) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

<<<<<<< HEAD
		final String mailUserName = "hms2systems@gmail.com";
		final String mailPassword = "fctj oipt bfbo oaoo";
=======
		final String mailUserName = "Your mail UserName";
		final String mailPassword = "Your Mail Password";
>>>>>>> e06896c5d3b881a587992830e685134132707732

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});
<<<<<<< HEAD

=======
		
		
		
>>>>>>> e06896c5d3b881a587992830e685134132707732
		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress(from, "no-replay@Hospital Management System"));
			message.setSubject(subject);
<<<<<<< HEAD
			message.setContent("<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "  <head>\r\n" + "    <style>\r\n"
					+ "      * {\r\n" + "        font-family: 'Poppins', sans-serif;\r\n"
					+ "        font-size: 17px;\r\n" + "      }\r\n" + "\r\n" + "      .passcode {\r\n"
					+ "        font-size: 19px;\r\n" + "      }\r\n" + "\r\n" + "      .para_3 a,\r\n"
					+ "      .para_4 a {\r\n" + "        display: block;\r\n" + "        text-decoration: none;\r\n"
					+ "        color: white;\r\n" + "        background-color: darkorange;\r\n"
					+ "        padding: 12px;\r\n" + "        margin: 12px;\r\n" + "        width: 100px;\r\n"
					+ "        font-size: 16px;\r\n" + "        text-align: center;\r\n" + "      }\r\n"
					+ "    </style>\r\n" + "  </head>\r\n" + "  <body>\r\n" + "    <div class=\"container\">\r\n"
					+ "      <p class=\"para_1\">\r\n"
					+ "        You have received this email as you have requested a password\r\n"
					+ "        reset at Hospital Management System User Account.\r\n"
					+ "      </p><p class=\"passcode\">Your passcode is:<br>" + otp + "</p>" + "\r\n" + "\r\n"
					+ "      <br /><br />\r\n" + "      <p class=\"para_5\">\r\n" + "        Best Regards, <br />\r\n"
					+ "        Hospital Management System\r\n" + "      </p><p>Do not replay to this email.</p>\r\n"
					+ "    </div>\r\n" + "  </body>\r\n" + "</html>\r\n" + "", "text/html");
=======
			message.setContent("<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "  <head>\r\n"
					+ "    <style>\r\n"
					+ "      * {\r\n"
					+ "        font-family: 'Poppins', sans-serif;\r\n"
					+ "        font-size: 17px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .passcode {\r\n"
					+ "        font-size: 19px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .para_3 a,\r\n"
					+ "      .para_4 a {\r\n"
					+ "        display: block;\r\n"
					+ "        text-decoration: none;\r\n"
					+ "        color: white;\r\n"
					+ "        background-color: darkorange;\r\n"
					+ "        padding: 12px;\r\n"
					+ "        margin: 12px;\r\n"
					+ "        width: 100px;\r\n"
					+ "        font-size: 16px;\r\n"
					+ "        text-align: center;\r\n"
					+ "      }\r\n"
					+ "    </style>\r\n"
					+ "  </head>\r\n"
					+ "  <body>\r\n"
					+ "    <div class=\"container\">\r\n"
					+ "      <p class=\"para_1\">\r\n"
					+ "        You have received this email as you have requested a password\r\n"
					+ "        reset at Hospital Management System User Account.\r\n"
					+ "      </p><p class=\"passcode\">Your passcode is:<br>"+ otp+"</p>"
					+ "\r\n"
					+ "\r\n"
					+ "      <br /><br />\r\n"
					+ "      <p class=\"para_5\">\r\n"
					+ "        Best Regards, <br />\r\n"
					+ "        Hospital Management System\r\n"
					+ "      </p><p>Do not replay to this email.</p>\r\n"
					+ "    </div>\r\n"
					+ "  </body>\r\n"
					+ "</html>\r\n"
					+ "", "text/html");
>>>>>>> e06896c5d3b881a587992830e685134132707732

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

<<<<<<< HEAD
		return flag;
	}

=======
		
		
		

		return flag;
	}

	
>>>>>>> e06896c5d3b881a587992830e685134132707732
	public boolean userForgotPasswordEmailSucess(String from, String to, String subject, Timestamp stamp) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");
<<<<<<< HEAD
		final String mailUserName = "hms2systems@gmail.com";
		final String mailPassword = "fctj oipt bfbo oaoo";
=======

		final String mailUserName = "Your mail UserName";
		final String mailPassword = "Your Mail Password";
>>>>>>> e06896c5d3b881a587992830e685134132707732

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});
<<<<<<< HEAD

		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		String date = format.format(stamp);

=======
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		String date = format.format(stamp);
		
>>>>>>> e06896c5d3b881a587992830e685134132707732
		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress(from, "no-replay@Hospital Management System"));
			message.setSubject(subject);
<<<<<<< HEAD
			message.setContent("<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "  <head>\r\n" + "    <style>\r\n"
					+ "      * {\r\n" + "        font-family: 'Poppins', sans-serif;\r\n"
					+ "        font-size: 17px;\r\n" + "      }\r\n" + "\r\n" + "      .container {\r\n"
					+ "        \r\n" + "      }\r\n" + "\r\n" + "      .para_3 a,\r\n" + "      .para_4 a {\r\n"
					+ "        display: block;\r\n" + "        text-decoration: none;\r\n" + "        color: white;\r\n"
					+ "        background-color: darkorange;\r\n" + "        padding: 12px;\r\n"
					+ "        margin: 12px;\r\n" + "        width: 100px;\r\n" + "        font-size: 16px;\r\n"
					+ "        text-align: center;\r\n" + "      }\r\n.note {font-size: 15px;}" + "    </style>\r\n"
					+ "  </head>\r\n" + "  <body>\r\n" + "    <div class=\"container\">\r\n"
					+ "      <p class=\"para_1\">\r\n"
					+ "        You have successfully changed the password.<br<br><p>The time stamp of your password reset: "
					+ date + "(Indian time zone)</p>\r\n" + "      </p>\r\n" + "\r\n" + "" + "\r\n" + "\r\n"
					+ "      <br /><br />\r\n" + "      <p class=\"para_5\">\r\n" + "        Best Regards, <br />\r\n"
					+ "        Hospital Management System\r\n"
					+ "      </p>\r\n<br><br><p class=\"note\">Note: This is an system generated mail please don't replay.</P"
					+ "    </div>\r\n" + "  </body>\r\n" + "</html>\r\n" + "", "text/html");
=======
			message.setContent("<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "  <head>\r\n"
					+ "    <style>\r\n"
					+ "      * {\r\n"
					+ "        font-family: 'Poppins', sans-serif;\r\n"
					+ "        font-size: 17px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .container {\r\n"
					+ "        \r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .para_3 a,\r\n"
					+ "      .para_4 a {\r\n"
					+ "        display: block;\r\n"
					+ "        text-decoration: none;\r\n"
					+ "        color: white;\r\n"
					+ "        background-color: darkorange;\r\n"
					+ "        padding: 12px;\r\n"
					+ "        margin: 12px;\r\n"
					+ "        width: 100px;\r\n"
					+ "        font-size: 16px;\r\n"
					+ "        text-align: center;\r\n"
					+ "      }\r\n.note {font-size: 15px;}"
					+ "    </style>\r\n"
					+ "  </head>\r\n"
					+ "  <body>\r\n"
					+ "    <div class=\"container\">\r\n"
					+ "      <p class=\"para_1\">\r\n"
					+ "        You have successfully changed the password.<br<br><p>The time stamp of your password reset: "+ date+"(Indian time zone)</p>\r\n"
					+ "      </p>\r\n"
					+ "\r\n"
					+ ""
					+ "\r\n"
					+ "\r\n"
					+ "      <br /><br />\r\n"
					+ "      <p class=\"para_5\">\r\n"
					+ "        Best Regards, <br />\r\n"
					+ "        Hospital Management System\r\n"
					+ "      </p>\r\n<br><br><p class=\"note\">Note: This is an system generated mail please don't replay.</P"
					+ "    </div>\r\n"
					+ "  </body>\r\n"
					+ "</html>\r\n"
					+ "", "text/html");
>>>>>>> e06896c5d3b881a587992830e685134132707732

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

<<<<<<< HEAD
		return flag;
	}

	/* Admin mail for password change */
	public boolean adminForgotPasswordEmail(String to, Integer otp) {
=======
		
		
		

		return flag;
	}
	
	/* Admin mail for password change */
	public boolean adminForgotPasswordEmail( String to, Integer otp) {
>>>>>>> e06896c5d3b881a587992830e685134132707732
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

<<<<<<< HEAD
		final String mailUserName = "hms2systems@gmail.com";
		final String mailPassword = "fctj oipt bfbo oaoo";

=======
		final String mailUserName = "Your mail UserName";
		final String mailPassword = "Your Mail Password";
		
>>>>>>> e06896c5d3b881a587992830e685134132707732
		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});
<<<<<<< HEAD

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress("systems2hms@gmail.com", "no-replay@Hospital Management System"));
			message.setSubject("Reset password for your Admin Account");
			message.setContent("<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "  <head>\r\n" + "    <style>\r\n"
					+ "      * {\r\n" + "        font-family: 'Poppins', sans-serif;\r\n"
					+ "        font-size: 17px;\r\n" + "      }\r\n" + "\r\n" + "      .passcode {\r\n"
					+ "        font-size: 19px;\r\n" + "      }\r\n" + "\r\n" + "      .para_3 a,\r\n"
					+ "      .para_4 a {\r\n" + "        display: block;\r\n" + "        text-decoration: none;\r\n"
					+ "        color: white;\r\n" + "        background-color: darkorange;\r\n"
					+ "        padding: 12px;\r\n" + "        margin: 12px;\r\n" + "        width: 100px;\r\n"
					+ "        font-size: 16px;\r\n" + "        text-align: center;\r\n" + "      }\r\n"
					+ "    </style>\r\n" + "  </head>\r\n" + "  <body>\r\n" + "    <div class=\"container\">\r\n"
					+ "      <p class=\"para_1\">\r\n"
					+ "        You have received this email as you have requested a password\r\n"
					+ "        reset at Hospital Management System Admin Account.\r\n"
					+ "      </p><p class=\"passcode\">Your passcode is:<br>" + otp + "</p>" + "\r\n" + "\r\n"
					+ "      <br /><br />\r\n" + "      <p class=\"para_5\">\r\n" + "        Best Regards, <br />\r\n"
					+ "        Hospital Management System\r\n" + "      </p><p>Do not replay to this email.</p>\r\n"
					+ "    </div>\r\n" + "  </body>\r\n" + "</html>\r\n" + "", "text/html");
=======
		
		
		
		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress("Sender Email", "no-replay@Hospital Management System"));
			message.setSubject("Reset password for your Admin Account");
			message.setContent("<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "  <head>\r\n"
					+ "    <style>\r\n"
					+ "      * {\r\n"
					+ "        font-family: 'Poppins', sans-serif;\r\n"
					+ "        font-size: 17px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .passcode {\r\n"
					+ "        font-size: 19px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .para_3 a,\r\n"
					+ "      .para_4 a {\r\n"
					+ "        display: block;\r\n"
					+ "        text-decoration: none;\r\n"
					+ "        color: white;\r\n"
					+ "        background-color: darkorange;\r\n"
					+ "        padding: 12px;\r\n"
					+ "        margin: 12px;\r\n"
					+ "        width: 100px;\r\n"
					+ "        font-size: 16px;\r\n"
					+ "        text-align: center;\r\n"
					+ "      }\r\n"
					+ "    </style>\r\n"
					+ "  </head>\r\n"
					+ "  <body>\r\n"
					+ "    <div class=\"container\">\r\n"
					+ "      <p class=\"para_1\">\r\n"
					+ "        You have received this email as you have requested a password\r\n"
					+ "        reset at Hospital Management System Admin Account.\r\n"
					+ "      </p><p class=\"passcode\">Your passcode is:<br>"+ otp+"</p>"
					+ "\r\n"
					+ "\r\n"
					+ "      <br /><br />\r\n"
					+ "      <p class=\"para_5\">\r\n"
					+ "        Best Regards, <br />\r\n"
					+ "        Hospital Management System\r\n"
					+ "      </p><p>Do not replay to this email.</p>\r\n"
					+ "    </div>\r\n"
					+ "  </body>\r\n"
					+ "</html>\r\n"
					+ "", "text/html");
>>>>>>> e06896c5d3b881a587992830e685134132707732

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

<<<<<<< HEAD
		return flag;
	}

=======
		
		
		

		return flag;
	}


>>>>>>> e06896c5d3b881a587992830e685134132707732
	/* admin mail for passoword change success */
	public boolean adminForgotPasswordEmailSucess(String to, Timestamp stamp) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

<<<<<<< HEAD
		final String mailUserName = "hms2systems@gmail.com";
		final String mailPassword = "fctj oipt bfbo oaoo";
=======
		final String mailUserName = "Your mail UserName";
		final String mailPassword = "Your Mail Password";
>>>>>>> e06896c5d3b881a587992830e685134132707732

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});
<<<<<<< HEAD

		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		String date = format.format(stamp);

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress("systems2hms@gmail.com", "no-replay@Hospital Management System"));
			message.setSubject("password reset was successfull");
			message.setContent("<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "  <head>\r\n" + "    <style>\r\n"
					+ "      * {\r\n" + "        font-family: 'Poppins', sans-serif;\r\n"
					+ "        font-size: 17px;\r\n" + "      }\r\n" + "\r\n" + "      .container {\r\n"
					+ "        \r\n" + "      }\r\n" + "\r\n" + "      .para_3 a,\r\n" + "      .para_4 a {\r\n"
					+ "        display: block;\r\n" + "        text-decoration: none;\r\n" + "        color: white;\r\n"
					+ "        background-color: darkorange;\r\n" + "        padding: 12px;\r\n"
					+ "        margin: 12px;\r\n" + "        width: 100px;\r\n" + "        font-size: 16px;\r\n"
					+ "        text-align: center;\r\n" + "      }\r\n.note {font-size: 15px;}" + "    </style>\r\n"
					+ "  </head>\r\n" + "  <body>\r\n" + "    <div class=\"container\">\r\n"
					+ "      <p class=\"para_1\">\r\n"
					+ "        You have successfully changed the password.<br<br><p>The time stamp of your password reset: "
					+ date + "(Indian time zone)</p>\r\n" + "      </p>\r\n" + "\r\n" + "" + "\r\n" + "\r\n"
					+ "      <br /><br />\r\n" + "      <p class=\"para_5\">\r\n" + "        Best Regards, <br />\r\n"
					+ "        Hospital Management System\r\n"
					+ "      </p>\r\n<br><br><p class=\"note\">Note: This is an system generated mail please don't replay.</P"
					+ "    </div>\r\n" + "  </body>\r\n" + "</html>\r\n" + "", "text/html");
=======
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		String date = format.format(stamp);
		
		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress("Sender Email", "no-replay@Hospital Management System"));
			message.setSubject("password reset was successfull");
			message.setContent("<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "  <head>\r\n"
					+ "    <style>\r\n"
					+ "      * {\r\n"
					+ "        font-family: 'Poppins', sans-serif;\r\n"
					+ "        font-size: 17px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .container {\r\n"
					+ "        \r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .para_3 a,\r\n"
					+ "      .para_4 a {\r\n"
					+ "        display: block;\r\n"
					+ "        text-decoration: none;\r\n"
					+ "        color: white;\r\n"
					+ "        background-color: darkorange;\r\n"
					+ "        padding: 12px;\r\n"
					+ "        margin: 12px;\r\n"
					+ "        width: 100px;\r\n"
					+ "        font-size: 16px;\r\n"
					+ "        text-align: center;\r\n"
					+ "      }\r\n.note {font-size: 15px;}"
					+ "    </style>\r\n"
					+ "  </head>\r\n"
					+ "  <body>\r\n"
					+ "    <div class=\"container\">\r\n"
					+ "      <p class=\"para_1\">\r\n"
					+ "        You have successfully changed the password.<br<br><p>The time stamp of your password reset: "+ date+"(Indian time zone)</p>\r\n"
					+ "      </p>\r\n"
					+ "\r\n"
					+ ""
					+ "\r\n"
					+ "\r\n"
					+ "      <br /><br />\r\n"
					+ "      <p class=\"para_5\">\r\n"
					+ "        Best Regards, <br />\r\n"
					+ "        Hospital Management System\r\n"
					+ "      </p>\r\n<br><br><p class=\"note\">Note: This is an system generated mail please don't replay.</P"
					+ "    </div>\r\n"
					+ "  </body>\r\n"
					+ "</html>\r\n"
					+ "", "text/html");
>>>>>>> e06896c5d3b881a587992830e685134132707732

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

<<<<<<< HEAD
		return flag;
	}

=======
		
		
		

		return flag;
	}
	

	// to get yout system ipv4 address 
>>>>>>> e06896c5d3b881a587992830e685134132707732
	public static String iAddress() throws UnknownHostException {
		InetAddress ip;

		ip = InetAddress.getLocalHost();

		String s = ip.getHostAddress();
		return s;
	}

}
