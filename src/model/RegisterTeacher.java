 package model;
 
 import databaseConnection.Dbconnection;
 import java.io.InputStream;
 import java.sql.*;
 public class RegisterTeacher
 {
   public static int register(String teacherId, String fname,String mname, String lname, String gender, String bdate, String cperson, String hiredate, String address, String currentstatus, String phone, String experience, InputStream inputStream, String status)
   {
     int actionstatus = 0;
     try
     {
       Dbconnection dbcon = new Dbconnection();
       PreparedStatement ps = dbcon.getConnection().prepareStatement("insert into TBL_teacher values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
       ps.setString(1, teacherId);
       ps.setString(2, fname);
       ps.setString(3, mname);
       ps.setString(4, lname);
       ps.setString(5, bdate);
       ps.setString(6, address);
       ps.setString(7, gender);
       ps.setString(8, hiredate);
       ps.setString(9, phone);
       ps.setString(10, currentstatus);
       ps.setString(11, experience);
       ps.setString(12, cperson);
       ps.setBlob(13, inputStream);
       
       ps.setString(14, status);
       
       actionstatus = ps.executeUpdate();
     }
     catch (Exception e)
     {
       System.out.println(e.getMessage());
     }
     return actionstatus;
   }
   int checker;
   public int editTeacherProfile(String FirstName,String Midlenme,String lastname,String bdate,
		   String address,String gender,String hdate,String phone,String qualification,
		   String experience,String cperson,String id) throws ClassNotFoundException
   {
	   Dbconnection dbconnection=new Dbconnection();
	   Connection connection=dbconnection.getConnection();
	   String updatesql="update TBL_teacher set FirstName=?,middelname=?,LastName=?,Birthdate=?,Address=?,"
	   		+ "Gender=?,HireDate=?,Tel=?,Qualified=?,Experience=?,contactPerson=? where Teacher_Id=?";
	   try {
		PreparedStatement ps_update=connection.prepareStatement(updatesql);
		ps_update.setString(1, FirstName);
		ps_update.setString(2, Midlenme);
         ps_update.setString(3, lastname);
		ps_update.setString(4, bdate);
		ps_update.setString(5, address);
		ps_update.setString(6, gender);
		ps_update.setString(7, hdate);
		ps_update.setString(8, phone);
		ps_update.setString(9, qualification);
		ps_update.setString(10, experience);
		ps_update.setString(11, cperson);
		ps_update.setString(12, id);
		checker=ps_update.executeUpdate();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return checker;

	   
   }
   
 }


