 package model;
 
 import databaseConnection.Dbconnection;
 import java.sql.*;
 public class SaveMark
 {
   static int saved=0;
  
   public static int SaveTest(String Studid, String type,  String tID, String sub_id, String Section, String grade, String mark,String semester)
     throws ClassNotFoundException, SQLException
   {

     Dbconnection dbcon = new Dbconnection();

     PreparedStatement ps = dbcon.getConnection().prepareStatement("insert into TBL_Test values(?,?,?,?,?,?,?,?)");
     
     ps.setString(1, Studid);
     ps.setString(2, type);
     ps.setString(3, tID);
     ps.setString(4, sub_id);
     ps.setString(5, Section);
     ps.setString(6, grade);
     ps.setString(7, mark);
     ps.setString(8, semester);
     saved= ps.executeUpdate();
	return saved;
   }
 }


