      package controller;
      
      import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
      import java.sql.SQLException;
      import java.sql.Statement;
      import java.text.SimpleDateFormat;
      import java.util.Date;
      import javax.servlet.ServletException;
      import javax.servlet.annotation.WebServlet;
      import javax.servlet.http.HttpServlet;
      import javax.servlet.http.HttpServletRequest;
      import javax.servlet.http.HttpServletResponse;
      import model.UpdateMarks;
import model.mark_submit;
      
      @WebServlet(description="mark update", urlPatterns={"/UpdateMark"})
      public class MarkUpdate
        extends HttpServlet
      {
        private static final long serialVersionUID = 1L;
        
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException
        {
        doPost(request, response);
        }
        
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException
          
        {
        	PrintWriter out = response.getWriter();
            int  total_saved=0;
    		String [] studid=request.getParameterValues("studid");
    		String grade=request.getParameter("grade");
    		String [] total=request.getParameterValues("total");
    		String  semester=request.getParameter("semester");
    		String  sectionid=request.getParameter("section");
    		String teacherid=request.getParameter("teacherid");
    		String  academicyear=request.getParameter("AcademicYear");
    		String  subjectid=request.getParameter("subid");
    		for(int j=0;j<studid.length;j++)
    		{
   

                     
           
			try {
				total_saved = mark_submit.Mark_submit(studid[j], grade,total[j],semester,sectionid,teacherid, academicyear, subjectid);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           }
           
    		
    		
        }
              
     
          }
        
      


 