package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import databaseConnection.Dbconnection;

public class schedul {
	int saved;
	public int TeacherSchedul(String section,String TeacherName,String AcademicYear,String courseName,String Date,String Starttime,String endtime) throws ClassNotFoundException, SQLException
	{
		Dbconnection con=new Dbconnection();
	   PreparedStatement ps=con.getConnection().prepareStatement("insert into schedule values(?,?,?,?,?,?,?)");
	   ps.setString(1, TeacherName);
	   ps.setString(2, AcademicYear);
	   ps.setString(4, courseName);
	   ps.setString(5, Date);
	   ps.setString(6, Starttime);
	   ps.setString(7, endtime);
	   ps.setString(3, section);
	    saved=ps.executeUpdate();
		return saved;
		
	}

}
