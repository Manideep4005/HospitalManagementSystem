package com.hms.mailService;

public class SendEmailApp {
	public static void main(String[] args) {
		EmailSender emailSender = new EmailSender();
		
		String to = "nmd.mani@gmail.com";
		String from = "systems2hms@gmail.com";
		String subject = "This is a testing mail using HMS";
		boolean b = emailSender.userSendEmail(to, from, subject, 12345, "Manideep Nakka", "user");
		
		if (b) {
			System.out.println("Email Sent Successfully");
		} else {
			System.out.println("There is a problem sending email!");
		}
				
	}
}
