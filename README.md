Hosptial Management System a Java based Web Application developed using JSP, Servlets  and JavaScript and the project also inclueded mailing service where i used SMTP and its libraries.

Mysql database is used to store the data

Project has total of three modules 
1) Admin
2) User
3) Doctor

-> Admin Have the features of login, register, and whole application access.

-> User have the features of login, regiser and book an appointment and also view history of appointments and many.

-> Doctor have the features of login, and the appointments assigned to them, and the doctor account will be given by admin.

The tables are as following:

1) Admin

Admin_id (primary key, auto increment) -> Admin_Name -> Gender -> Email -> Contact -> Address

2) User

User_id (primary key, auto increment) -> User_Name -> Gender -> Email -> Contact -> Address -> Joined date

3) Doctor

Doctor_id (primary key, auto increment) -> Doctor_Name -> Gender -> Email -> Education -> Specialization -> Experience -> Contact -> Address

4) Patient

Patient_id (primary key, auto increment) -> Patient_Name -> Gender -> Age -> Email -> Contact -> Address -> Checkup type -> Symptoms -> Admitted_date -> user_id (foreign Key to user table user_id)

5) Appointment

Appointment_id (primary key, auto increment) -> patient_id (foreign key to patient table patient_id) -> checkup type -> Appointment_date -> user_id (foreign key to user table user_Id)
