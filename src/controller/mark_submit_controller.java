package controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.el.core.OutTag;

import databaseConnection.Dbconnection;
import model.mark_submit;

/**
 * Servlet implementation class mark_submit_controller
 */
@WebServlet({"/savemark"})
public class mark_submit_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String[] studid=request.getParameterValues("studid");
		String []grade=request.getParameterValues("grade");
		String [] total=request.getParameterValues("total");
		String [] semester=request.getParameterValues("semester");
		String [] sectionid=request.getParameterValues("section");
		String [] teacherid=request.getParameterValues("teacherid");
		String [] academicyear=request.getParameterValues("AcademicYear");
		String [] subjectid=request.getParameterValues("subid");
		for(int j=0;j<studid.length;j++)
		{
			for(int i=0;i>j;i++) {
				try {
					mark_submit.Mark_submit(studid[i], teacherid[i], sectionid[i], grade[i], total[i], subjectid[i], semester[i], academicyear[i]);
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}			} 
			request.getSession().setAttribute("", "");
			response.sendRedirect("index.jsp");
			
		
				// TODO Auto-generated catch block
				
		
				// TODO Auto-generated catch block
			}
	}


