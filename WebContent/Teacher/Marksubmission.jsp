<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">

<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<style type="text/css" title="currentStyle">
@import "../resources/css/demo_table.css";
</style>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mark list report</title>
</head>
<table class="table table-boarder">
<thead>
<th> Student id</th><th> Subject id</th><th> Teacher id</th><th> Grade</th>
<th> Semester</th>
<th> Section</th>
<th> Total</th>
<th> Academic Year</th>
</thead>

<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("../index.jsp");
	} else {
		Dbconnection dbconn = new Dbconnection();
		String sms=null;
		Statement st_semseter=dbconn.getConnection().createStatement();
		ResultSet rs_semseter=st_semseter.executeQuery("select semester_name from tbl_semister_management where semester_status='active'");
		if(rs_semseter.next()){
		sms=rs_semseter.getString("semester_name");
		//out.println(sms);
		}
		
                int  Grade = 0; String checkid=null;
		String  Stud_id = null,teacherid=null,AcademicYear=null;float total=0;
		String SubID = null, section = null, semester = null, LastName = null, teacherID = null;
		String Loggeduser = session.getAttribute("user").toString();
		Statement statment_active = dbconn.getConnection().createStatement();
		ResultSet rs_active = statment_active
				.executeQuery("select Teacher_Id from TBL_Users where userName='" + Loggeduser + "'");
		if (rs_active.next()) {
			teacherID = rs_active.getString(1);
			}
		
		
		 Statement st_check_id=dbconn.getConnection().createStatement();
		ResultSet rs_check_id=st_check_id.executeQuery("select AcademicYear,semester,tbl_student.grade,tbl_student.section_id,tbl_student.stud_id,gender,firstname,sum(obtainedMark) as total_mark,subject_id,middlename,lastname from tbl_student right join tbl_test on tbl_student.stud_id=tbl_test.Stud_id where teacher_id='"+teacherID+"'and semester='"+sms+"' group by AcademicYear,semester,tbl_student.grade,tbl_student.section_id,lastname,tbl_student.stud_id,subject_id, middlename,firstname,gender");
		while(rs_check_id.next()){
			checkid=rs_check_id.getString("stud_id");
			SubID=rs_check_id.getString("subject_id");
			Grade=rs_check_id.getInt("grade");
			section=rs_check_id.getString("section_id");
			semester=rs_check_id.getString("semester");
			total=rs_check_id.getFloat("total_mark");
			AcademicYear=rs_check_id.getString("AcademicYear");
					            %><tr>
                     <form method="post"
								action="${pageContext.request.contextPath}/UpdateMark"
								id="mark" name="mark" onsubmit="return valiatemark(this)">
                           
                              
                             <td><input type="text" class="form-control"
                            value="<%=checkid %>" name="studid"readonly></td> 
                              
                                <td><input type="text" name="subid" value="<%=SubID %>" class="form-control"readonly></td>
                                  
                                <td><input type="text" value="<%=teacherID %>" class="form-control"name="teacherid"readonly></td>
                                <td><input type="text" name="grade" value="<%=Grade %>" class="form-control"readonly></td>                                  
                                <td> <input type="text" value="<%=semester %>" class="form-control" name="semester"readonly></td>
                                 <td><input type="text" value="<%=section %>" name="section" class="form-control"readonly></td>
                                
                                <td><input type="text" name="total" value="<%=total %>" class="form-control"readonly></td>
                                <td><input type="text" name="AcademicYear" value="<%=AcademicYear %>" class="form-control"readonly></td></tr>
                              <%
		}}
            	
                
%>
	<td><button type="submit"
										class="btn btn-primary fa fa-save" value="save mark"></button>
										</td>
							</form>
							

</table>
<body>
    <%%>
</body>
</html>