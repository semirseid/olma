package controller;

import databaseConnection.Dbconnection;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SaveMark;

@WebServlet({"/SaveTestResult"})
public class SaveStudTestResult
  extends HttpServlet
{
  private static final long serialVersionUID = 1L;
   int ISsaved = 0;
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
     response.sendRedirect("Teacher/Testpanel.jsp");
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    
  {  String semister=request.getParameter("semester");
     String testtype = request.getParameter("test");
    String teacherid = request.getParameter("teacherid");
     String []studentid = request.getParameterValues("studid");
     String subjectid = request.getParameter("subid");
     String section = request.getParameter("section");
     String grade = request.getParameter("grade");
     String [] mark=request.getParameterValues("obtainedMark");
     PrintWriter out=response.getWriter();
     
     
     
    String []res_Grade = null;
    
   
    for(int j=0;j<studentid.length;j++)
    {
    	//out.println(studentid[j]+" "+mark[j]);
    	Dbconnection dbcon=new Dbconnection();
    	Statement st_check = null;
		try {
			st_check = dbcon.getConnection().createStatement();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	
    	try {
			ISsaved = SaveMark.SaveTest(studentid[j], testtype, teacherid, subjectid, section, grade, mark[j], semister);
			if(ISsaved>0)
			{
	           request.getSession().setAttribute("saved", "students' mark is successfully saved");
	           response.sendRedirect("../Teacher/Testpanel.jsp");	}
			
			else
			{
		           request.getSession().setAttribute("saved", "students' mark is successfully saved");
		           response.sendRedirect("../Teacher/Testpanel.jsp");	
					
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
    	
////     float[] mass=new float[10];
////     if ((testtype.equals("t1")) || (testtype.equals("t2")) || (testtype.equals("pro"))) {
////    
////     } else if ((testtype.equals("w1")) || (testtype.equals("w2"))) {
////      
////     } else if (testtype.equals("mid")) {
////      
////     } else if (testtype.equals("final")) {
////      
////    } else if (testtype.equals("activity")) {
////       
////    }
////    try
////    {
////       Dbconnection dbcon = new Dbconnection();
////       Connection con = dbcon.getConnection();
////       Statement sts = con.createStatement();
////      // ResultSet rs = sts.executeQuery("select obtainedMark from TBL_Test where Stud_id='" + studentid[j] + "' and type='" + testtype[j] + "'");
////      // if (rs.next())
////      //{
////         request.getSession().setAttribute("exists", "this students mark is already inserted");
////         response.sendRedirect("Teacher/Testpanel.jsp?grade=" + res_Grade + section + "&test=" + testtype);
////      }
////      else
////      {
//       try {
//		this.ISsaved = SaveMark.SaveTest(studentid[j], testtype[j], teacherid[j], subjectid[j], section[j], grade[j], mark[j], branch[j]);
//	} catch (ClassNotFoundException | SQLException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//         if ((this.ISsaved == 1))
//        {
//         
//           request.getSession().setAttribute("saved", "students' mark is successfully saved");
//           response.sendRedirect("../Teacher/Testpanel.jsp");
//        }
//        else
//        {
//           request.getSession().setAttribute("notsaved", "students' mark is not saved");
//           response.sendRedirect("Teacher/Testpanel.jsp?grade=" + res_Grade + section + "&test=" + testtype);
//          
//           return;
//        }
      }
    }
//    catch (ClassNotFoundException|SQLException e)
//    {
//       e.printStackTrace();
//    }
//  }
}
//}


