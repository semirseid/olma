/*    */ package model;
/*    */ 
/*    */ import databaseConnection.Dbconnection;

/*    */ import java.sql.Connection;
/*    */ import java.sql.PreparedStatement;
import java.sql.SQLException;
/*    */ 
/*    */ public class Studregistration
/*    */ {

/*    */   public static int registerStudent(String stud_id, String firstName, String middlename,
		String lastName, String birhdate, String gender, String contactPerson, String academicYear,
		String wereda, String phone, String address, String status, int grade, String section_id)
/*    */   {
/* 12 */     int rowsaffected = 0;
/*    */     try
/*    */     {
/* 15 */       Dbconnection dbcon = new Dbconnection();
/*    */       
/* 17 */       PreparedStatement ps = dbcon.getConnection().prepareStatement("insert into TBL_student values(STUD_ID,"
        + "FIRSTNAME"
        + ",MIDDLENAME,LASTNAME,BIRTHDATE,GENDER"
        + ",CONTACTPERSON,ACADEMICYEAR,"
        + "WOREDA,PHONE,ADDRESS,STATUS"
        + ",GRADE,SECTION_ID)");
/* 18 */       ps.setString(1, stud_id);
/* 19 */       ps.setString(2, firstName);
               ps.setString(3, middlename);
/* 20 */       ps.setString(4, lastName);
               ps.setString(5, birhdate);
/* 23 */       ps.setString(6, gender);
/* 24 */       ps.setString(7, contactPerson);
/*    */       
/* 26 */       ps.setString(8, academicYear);
/* 27 *
/* 28 */       ps.setString(9, wereda);
/*    */       
/* 30 */       ps.setString(10, phone);
/* 31 */       ps.setString(11, address);
/* 32 */       ps.setString(12, status);
/*    */       
/* 34 */       ps.setInt(13, grade);
/* 35 */       ps.setString(14, section_id);

/* 41 */       rowsaffected = ps.executeUpdate();
/*    */     }
/*    */     catch (Exception e)
/*    */     {
/* 47 */       System.out.println(e.getMessage());
/*    */     }
     return rowsaffected;
           }
int checker;
public int EditStudProfile(String FirstName,String middlename,String lastname,String bdate,
		   String gender,String ContactPerson,String AcademicYear,String wereda,
		   String phone,String address, String Status, String section,String id) throws ClassNotFoundException
{
	   Dbconnection dbconnection=new Dbconnection();
	   Connection connection=dbconnection.getConnection();
	   String updatesql="update tbl_student set FirstName=?,MiddleName=?,LastName=?,Birthdate=?,Gender=?,"
	   		+ "ContactPerson=?,AcademicYear=?,woreda=?,phone=?,address=?,Status=?,Section_id=? where Stud_id=?";
	   try {
		PreparedStatement ps_update=connection.prepareStatement(updatesql);
		
		ps_update.setString(1, FirstName);
		ps_update.setString(2, middlename);
		ps_update.setString(3, lastname);
		ps_update.setString(4, bdate);
		ps_update.setString(5, gender);
		
		ps_update.setString(6, ContactPerson);
		ps_update.setString(7, AcademicYear);
		
		ps_update.setString(8, wereda);
		ps_update.setString(9, phone);
		ps_update.setString(10, address);
		
		ps_update.setString(11, Status);
		ps_update.setString(12, section);
		ps_update.setString(13, id);
		checker=ps_update.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return checker;

	   
}
}


