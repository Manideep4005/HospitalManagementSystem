package com.hms.mailService;

<<<<<<< HEAD
import java.io.UnsupportedEncodingException;

import jakarta.mail.MessagingException;

public class SendEmailApp {
	public static void main(String[] args) throws MessagingException, UnsupportedEncodingException {
		EmailSender emailSender = new EmailSender();
		
		String from = "hms2systems@gmail.com";
		String to = "ajaygoud97010@gmail.com";
		String subject = "Appointment Confirmation for Ajay";
		boolean b = emailSender.appointmentSendEmail(to, from, subject, 12345, "Vijay", "Manideep Nakka", 554321);
=======
public class SendEmailApp {
	public static void main(String[] args) {
		EmailSender emailSender = new EmailSender();
		
		String to = "recipient mail";
		String from = "sender mail";
		String subject = "This is a testing mail using HMS";
		boolean b = emailSender.userSendEmail(to, from, subject, 12345, "something", "something");
>>>>>>> e06896c5d3b881a587992830e685134132707732
		
		if (b) {
			System.out.println("Email Sent Successfully");
		} else {
			System.out.println("There is a problem sending email!");
		}
				
	}
}
