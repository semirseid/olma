package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RegisterTeacher;

@WebServlet(name = "ProfileEditor", urlPatterns = { "/ProfileEditor" })
public class Edit_t_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String id=request.getParameter("field0"),
            fname=request.getParameter("field1"),
             mname=request.getParameter("field2"),
            lname=request.getParameter("field3"),
            bdate=request.getParameter("field4"),
            address=request.getParameter("field5"),
            gender=request.getParameter("field6"),
            hdate=request.getParameter("field7"),
            phone=request.getParameter("field8"),
            qualification=request.getParameter("field9"),
            experience=request.getParameter("field10"),
            c_person=request.getParameter("field11");
   
            
     RegisterTeacher edit=new RegisterTeacher();
          try {
			int rowsaffected=edit.editTeacherProfile(fname,mname, lname, bdate, address, gender, hdate, phone, qualification, experience, c_person,id);
			if(rowsaffected>=1)
			{
				request.getSession().setAttribute("updated", "Profile Updated Successfully");
				response.sendRedirect("RegistrarOffice/editTeacherProfile.jsp?");
			}
			else
			{
				request.getSession().setAttribute("updated", "Profile Update not Successfull");
				response.sendRedirect("RegistrarOffice/editTeacherProfile.jsp?");
			}
			
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		} 
     
     
	}

}
