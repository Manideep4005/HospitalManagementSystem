# HostpitalManagementSystem


Hospital Management System Java based mini project developed using jsp and servlets and Tomcat as server run time.
Project has three modules Admin, User and Doctor
-> All the three modules has similar landing pages and login, regiser pages.

Mysql database is used to store the data

The tables are as following:
1) Admin 
  -> Admin_id (primary key, auto increment)
  -> Admin_Name 
  -> Gender
  -> Email
  -> Contact
  -> Address
  
2) User
  -> User_id (primary key, auto increment)
  -> User_Name 
  -> Gender
  -> Email
  -> Contact
  -> Address
  -> Joined date
  
3) Doctor
  -> Doctor_id (primary key, auto increment)
  -> Doctor_Name 
  -> Gender
  -> Email
  -> Education
  -> Specialization
  -> Experience
  -> Contact
  -> Address
  
4) Patient
  -> Patient_id (primary key, auto increment)
  -> Patient_Name 
  -> Gender
  -> Age
  -> Email
  -> Contact
  -> Address
  -> Checkup type
  -> Symptoms
  -> Admitted_date
  -> user_id (foreign Key to user table user_id)
  
5) Appointment
  -> Appointment_id (primary key, auto increment)
  -> patient_id (foreign key to patient table patient_id)
  -> checkup type
  -> Appointment_date
  -> user_id (foreign key to user table user_Id)
  
--------------------------------------------------------------------------------------------------------


Used basics of java script for form validations.
