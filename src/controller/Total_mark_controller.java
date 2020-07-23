package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Total_mark;
import model.UpdateMarks;

/**
 * Servlet implementation class Total_mark_controller
 */
@WebServlet({"/mark"})
public class Total_mark_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Total_mark_controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i;

		 String grade = request.getParameter("grade");
		    String year = request.getParameter("academicyear");
		    String section = request.getParameter("section");
		     String semister = request.getParameter("semseter");
		     String teacher_id=request.getParameter("teacher_id");
		     String []average = request.getParameterValues("average");
		     String []total=request.getParameterValues("total");
		     String []studid = request.getParameterValues("stud_id");
		for(int j=0;j<studid.length;j++)
		{
			Total_mark update=new Total_mark();
		     try {
				update.mark(studid[j], grade, section, teacher_id, year, semister, total[j],average[j]);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		}
		         }}
		       
		   

		 