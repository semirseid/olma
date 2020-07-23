<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>
    	<%@page import="java.sql.*"%>
    <%@page import="databaseConnection.Dbconnection"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<div class="container-fluid">
		<div style="margin: 2px -14px 0 -16px;">
			<%@ include file="../includes/vector.jsp"%>
		</div>
		<div class="row" style="margin: -20px -14px 0 -16px;">
			<%@ include file="../includes/nav.html"%>
		</div>
	</div>
	<div class="container-fluid"
		style="margin-left: 8px; margin-top: -15px">
		<div class="col-lg-3 col-md-3">
			<%@ include file="../includes/sidebar.jsp"%>
		</div>
<title>Teaching time scheduling</title>
</head>
<body>
<div class="col-lg-offset-3" style="margin-top: -390px;">
<FORM action="${pageContext.request.contextPath}/ScheduleControler" method="post">
<div class="container-fluid">
								<strong>${schedul} ${oops}</strong>
							</div>

							<%
								request.getSession().setAttribute("studregistered", null);
									request.getSession().setAttribute("oops", null);
							%>
<div class="form-group col-lg-4">
Select Teacher
<select class="form-control" name="teacher">

<%Dbconnection connection=new Dbconnection();
String id=null,name=null;
Statement st_schedule=connection.getConnection().createStatement();
ResultSet rs_schedul=st_schedule.executeQuery("select * from [dbo].[TBL_teacher]");
while(rs_schedul.next()){%>
<option>
<%
	id=rs_schedul.getString("TeacherId");
    name=rs_schedul.getString("FirstName");

	out.println(name);%>
	</option>
	
	<%
}

%>
</select>
</div>
<div class="form-group col-lg-4">
Academic Year

<%
String academicyear=null;
Statement st_academicyear=connection.getConnection().createStatement();
ResultSet rs_academicyear=st_academicyear.executeQuery("select * from tbl_setup");
while(rs_academicyear.next()){
	academicyear=rs_academicyear.getString("AcademicYear");
}
%>
<input type="text" name="Academicyear" class="form-control" value="<%=academicyear%>">
</div>

<div class="form-group col-lg-4">
Select Section<select class="form-control" name="section">

<% String section=null,Grade=null; 
Statement st_section=connection.getConnection().createStatement();
ResultSet rs_section=st_section.executeQuery("select distinct Section_id, Grade from section");
while(rs_section.next()){%><option><%
	section=rs_section.getString("Section_id");
	Grade=rs_section.getString("Grade");
	out.print(Grade.concat(section));
	
	
	%>
	</option>
        
	<%}%>
</select>
</div>
<div class="col-lg-4">
Course Name: <INPUT type="text" name="title" size="35" class="form-control"><BR>
</div>

Course Time:
Sun<INPUT type="checkbox" name="day" value="sun">
Mon<INPUT type="checkbox" name="day" value="mon">
Tue<INPUT type="checkbox" name="day" value="tue">
Wed<INPUT type="checkbox" name="day" value="wed">
Thu<INPUT type="checkbox" name="day" value="thu">
Fri<INPUT type="checkbox" name="day" value="fri">
Sat<INPUT type="checkbox" name="day" value="sat">

<SELECT name="starttime">
<OPTION value="8:00 AM">8:00 AM</OPTION>
<OPTION value="8:41 AM">8:41 AM</OPTION>
<OPTION value="9:21 AM">9:21 AM</OPTION>
<OPTION value="11:00 AM">9:21 AM</OPTION>
<OPTION value="12:00 PM">12:00pm</OPTION>
<OPTION value="12:00 PM">1:00pm</OPTION>
<OPTION value="12:00 PM">2:00pm</OPTION>
<OPTION value="1512:00 PM">3:00pm</OPTION>
<OPTION value="1612:00 PM">4:00pm</OPTION>
<OPTION value="1712:00 PM">5:00pm</OPTION>
<OPTION value="1812:00 PM">6:00pm</OPTION>
<OPTION value="1912:00 PM">7:00pm</OPTION>
<OPTION value="2012:00 PM">8:00pm</OPTION>
<OPTION value="2112:00 PM">9:00pm</OPTION>
</SELECT>
to
<SELECT name="endtime">
<OPTION value="8:40 AM">8:40 am</OPTION>
<OPTION value="9:20 AM">10:00am</OPTION>
<OPTION value="10:00 AM">11:00am</OPTION>
<OPTION value="12">12:00pm</OPTION>
<OPTION value="13">1:00pm</OPTION>
<OPTION value="14">2:00pm</OPTION>
<OPTION value="15">3:00pm</OPTION>
<OPTION value="16">4:00pm</OPTION>
<OPTION value="17">5:00pm</OPTION>
<OPTION value="18">6:00pm</OPTION>
<OPTION value="19">7:00pm</OPTION>
<OPTION value="20">8:00pm</OPTION>
<OPTION value="21">9:00pm</OPTION>
<OPTION value="22">10:00pm</OPTION>
</SELECT>
<BR>
<BR>
<INPUT type="submit" name="Submit" value="AddCourse">
</FORM>



</div>

<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">

		<p class="text-info well well-sm ">This system is developed by
			volunteer students graduated from Adama science and Technology
			University for Oromiya Development Association</p>

		<%
 
Date date=new Date(); 
SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
		SimpleDateFormat lsdf=new SimpleDateFormat("MMMM");

String year=sdf.format(date);
String month=lsdf.format(date);
out.println("<center>"+"<h5>"+"&copy ODASBS"+" "+month+" "+year+"</h5>"+"</center");

%>

	</div>
</body>
</html>