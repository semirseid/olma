package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.schedul;

/**
 * Servlet implementation class ScheduleControler
 */
@WebServlet("/ScheduleControler")
public class ScheduleControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleControler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	    doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String techername=request.getParameter("teacher"),academicyear=request.getParameter("Academicyear"),
				section=request.getParameter("section"),coursename=request.getParameter("title"),
				date=request.getParameter("day"),starttime=request.getParameter("starttime"),endtime=request.getParameter("endtime");
		schedul time=new schedul();
		try {
		int schedule=time.TeacherSchedul(section, techername, academicyear, coursename, date, starttime, endtime);
		if(schedule>1)
		{
	        request.getSession().setAttribute("schedul", "Teacher schedul");
			        response.sendRedirect("RegistrarOffice/Schedule.jsp");
		      }
			       else
			       {
			         request.getSession().setAttribute("oop", "can not teacher schedul");
		        response.sendRedirect("RegistrarOffice/Schedule.jsp");
			      }
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
