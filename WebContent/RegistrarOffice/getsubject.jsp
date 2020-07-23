
<%@page import="java.sql.Connection"%>
<%@ page import="databaseConnection.*"%>
<%@page import="java.sql.*"%>
<%
String subject=request.getParameter("subject");  
 String buffer="<select name='state' ><option value='-1'>Select</option>";  
 try{
 Dbconnection con= new Dbconnection();
 Connection connection= con.getConnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select Teacher_Id from TBL_teacher where Qualified='"+subject+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(3)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>