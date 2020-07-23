     package controller;
     
     import databaseConnection.Dbconnection;
import model.UpdateMarks;

import java.io.IOException;
     import java.io.PrintWriter;
  
     import java.sql.*;
   
     import java.util.ArrayList;
     import javax.servlet.ServletException;
     import javax.servlet.annotation.WebServlet;
     import javax.servlet.http.HttpServlet;
     import javax.servlet.http.HttpServletRequest;
     import javax.servlet.http.HttpServletResponse;

     
     @WebServlet({"/RankRefresh"})
     public class Ranking
       extends HttpServlet
     {
       private static final long serialVersionUID = 1L;
       
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException
        
       {
    	   int i=0;
    int grade = Integer.valueOf(request.getParameter("grade"));
    String year = request.getParameter("academicyear");
    String section = request.getParameter("section");
     String semister = request.getParameter("semseter");
     String teacher_id=request.getParameter("teacher_id");
     String []average = request.getParameterValues("average");
     Float total=Float.valueOf(request.getParameter("total"));
     String []studid = request.getParameterValues("stud_id");
for(int j=0;j<studid.length;j++)
{
     UpdateMarks update=new UpdateMarks();
     try {
		i=update.RegisterMark(studid[j], grade, total, average[j], semister,section, teacher_id, year);
		
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    
}
         }}
       
   

 