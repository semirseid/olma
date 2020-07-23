package model;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import databaseConnection.Dbconnection;
public class mark_submit {
public static int Mark_submit(String studid,String teacherid,String section,String grade,String total,String subjectid,String semester,String academicyear) throws ClassNotFoundException, SQLException {
		Dbconnection dbcon=new Dbconnection();
		PreparedStatement ps=dbcon.getConnection().prepareStatement("insert into total_mark values(?,?,?,?,?,?,?,?)");
		ps.setString(1, studid);
		ps.setString(2, teacherid);
		ps.setString(3, section);
		ps.setString(4, grade);
		ps.setString(5, total);
		ps.setString(6, subjectid);
		ps.setString(7, semester);
		ps.setString(8, academicyear);
		ps.executeUpdate();
		
		return 0;
		
	}

}
