package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import databaseConnection.Dbconnection;
 
public class Total_mark {
	 int i=0;
	public int mark(String stud_id,String semester,String teacher_id,String grade,String total,String average,String academicyear,String section_id) throws ClassNotFoundException, SQLException {
	Dbconnection con=new Dbconnection();
	PreparedStatement ps=con.getConnection().prepareStatement("insert into tbl_mark values(?,?,?,?,?,?,?,?");
	ps.setString(1, stud_id);
	ps.setString(2, semester);
	ps.setString(3, teacher_id);
	ps.setString(4, grade);
	ps.setString(5, total);
	ps.setString(6, average);
	ps.setString(7, academicyear);
	ps.setString(8, section_id);
	i=ps.executeUpdate();
		return i;
		
	}

}
