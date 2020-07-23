<%@page import="java.sql.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%  
 if(session.getAttribute("registrar")==null)
 {
	 response.sendRedirect("../index.jsp");
 }
 else
 {
	 String branch=null;
	 Dbconnection dbconnection=new Dbconnection();
	 Statement statement_branch=dbconnection.getConnection().createStatement();
	 
	 ResultSet rs=statement_branch.executeQuery("select teacher_id from TBL_users where userName='"+session.getAttribute("registrar").toString()+"' ");
	 if(rs.next())
	 {
	 branch=rs.getString("teacher_id");
	 }
 %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>



<!DOCTYPE html>
<html lang="en">
<head>

<title>Main console</title>
<meta name="viewport" content="width=device-width, initial-scale=1">



</head>
<body style="font-family: Trebuchet MS, sans-serif;">
	<div class="container-fluid">

		<div class="row">
			<%@include file="../includes/vector.jsp"%>
		</div>


		<div class="row" style="margin-top: -20px">
			<%@ include file="../includes/nav.html"%>
		</div>

		<div class="row container-fluid" style="margin-top: -5px">
			<div class="col-md-3 col-lg-3">
				<%@ include file="../includes/sidebar.jsp"%>
			</div>
			<div class="col-md-9 col-lg-9">
				<%-- <%@ include file="../carousel.jsp" %> --%>
				<h4 class=" text-left text-info">
					ETHIOCHAINA FIRENDLY Primary School Student Recording System
					<%//=branch %>
					 of 2017
				</h4>
				<hr style="border: 1px dotted green">

				<div class="col-lg-4 "
					style="background-color: teal; border-radius: 6px; color: white">
					<h1 class="text-center">
						<%
					Statement studentcount=dbconnection.getConnection().createStatement();
					ResultSet rs_studentcount=studentcount.executeQuery("Select count(stud_id) from TBL_student where Status='active' ");
					if(rs_studentcount.next())
					{
						out.println(rs_studentcount.getString(1));
					}
					
					%>

					</h1>
					<p class="text-capitalize text-center">Students Learning</p>


				</div>
				<div class="col-lg-4 "
					style="background-color: #F7F7F9; border-radius: 6px;">
					<h1 class="text-center text-info">
						<%
					Statement teachercount=dbconnection.getConnection().createStatement();
					ResultSet rs_teachertcount=teachercount.executeQuery("Select count(Teacher_Id) from TBL_teacher where Status='active'");
					if(rs_teachertcount.next())
					{
						out.println(rs_teachertcount.getString(1));
					}
					
					%>

					</h1>
					<p class="text-capitalize text-center">Teachers Teaching</p>

				</div>
				<div class="col-lg-4 "
					style="background-color: #337AB7; border-radius: 6px; color: white">
					<h1 class="text-center">
					<%
					String course=null;
					Statement coursecount=dbconnection.getConnection().createStatement();
					ResultSet rs_course=coursecount.executeQuery("select count(distinct name) from TBL_SUBJ");
					if(rs_course.next())
					{
					course=rs_course.getString(1);
                                        int total=Integer.parseInt(course);
                                        int result=total*2;
                                        out.println(result);
					
					%>
					
					</h1>
					<p class="text-capitalize text-center">Active Courses</p>
					<%}else{
						out.println("no courses added so far");
					} %>
				</div>

				<hr style="border: 2px solid brown">

			</div>
		</div>

	</div>



	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">

		<p class="text-info well well-sm ">This system is developed by
			volunteer students graduated from Adama science and Technology
			University for EthioChaina School</p>

		<%
 }
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
