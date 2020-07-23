<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("../index.jsp");
	} else {
		Dbconnection dbconn = new Dbconnection();
                int  Grade = 0;
		String  Stud_id = null,AcademicYear=null;float total=0,average=0,classactivity=0,calculet=0,Wrtting=0,Reading=0,groupwork=0,homework=0,classwork=0,finalexam=0;
		String SubID = null, section = null, FirstName = null, LastName = null, teacherID = null, semester = null,activity=null;
		String Loggeduser = session.getAttribute("user").toString();
		Statement statment_active = dbconn.getConnection().createStatement();
		ResultSet rs_active = statment_active
				.executeQuery("select Teacher_Id from TBL_Users where userName='" + Loggeduser + "'");
		if (rs_active.next()) {
			teacherID = rs_active.getString(1);
			
		}
		/* Statement st_details = dbconn.getConnection().createStatement();
		ResultSet rs_detail = st_details
				.executeQuery("select  from tbl_homeroom where Teacher_Id='" + teacherID + "'");
		while (rs_detail.next()) {
			FirstName = rs_detail.getString(1);
			LastName = rs_detail.getString(2);
		} */
		Statement statment_sub = dbconn.getConnection().createStatement();
		ResultSet rs_sub = statment_sub
	.executeQuery("select Grade,Section_id, teacher_id from tbl_homeroom where Teacher_Id='"
						+ teacherID + "'");
                while(rs_sub.next()){
      
                 section=rs_sub.getString("section_id");
                 Grade=rs_sub.getInt("grade");
                 teacherID=rs_sub.getString("teacher_ID");
    
               %><div class="container-fluid" style="margin-top: 3px;">
		<div class="  container-fluid">
			<h4 class="text-info text-left container col-md-offseet-2">
				Kolfe secondary school
				
				<br> Mark update form for Grade
				<%=Grade%><%=section%></h4>
			<form class="form-inline" method="post" action="">
				<h4>${choose_section }</h4>
				<div class="form-inline col-lg-4 col-md-5 pull-right"
					style="margin: -50px 2px 12px 1px;">
					<strong> Choose Semester </strong><select required
						class="form-control" name="semister">
						<option></option>
						<option value="I">First semester</option>
						<option value="II">Second semester</option>
					</select>
					<button class="btn btn-primary">
						<span class="fa fa-arrow-right"></span>
					</button>
				</div>
			</form>
		</div><%
                }
                List<String> id = new ArrayList<>();
                List<Float> av=new ArrayList<>();
                
                Statement st=dbconn.getConnection().createStatement();
            	ResultSet rs=st.executeQuery("select distinct stud_id,semester,Section_id,AcademicYear from total_mark  where section_id='"+section+"'");
            	while(rs.next()){
            	
            	Stud_id=rs.getString("stud_id");
            	
            	semester=rs.getString("semester");
            	AcademicYear=rs.getString("AcademicYear");
            	section=rs.getString("section_id");
            Statement st_total=dbconn.getConnection().createStatement();
                	ResultSet rs_total=st_total.executeQuery("select sum(total) from total_mark  where stud_id='"+Stud_id+"' and section_id='"+section+"'");
                	while(rs_total.next()){
                	total=rs_total.getFloat(1);
 
            	int i=0;
                	Statement st_average=dbconn.getConnection().createStatement();
                	ResultSet rs_average=st_average.executeQuery("select count(subject_id) from total_mark  where stud_id='"+Stud_id+"' and section_id='"+section+"'");
                	while(rs_average.next()){
                		activity=rs_average.getString(1);	
                		float a=Float.valueOf(activity);
                     average=total/a;
                  
                	}
                	float result=0;
                   	int rank=0;
                	 Statement st_rank=dbconn.getConnection().createStatement();
                	ResultSet rs_rank=st_rank.executeQuery("select distinct total, RANK() over(order by total DESC) As 'Rank' From total_mark");
                	while(rs_rank.next())
                	{
               rank++;
                  }%>
                	<tr>
                	<form action="${pageContext.request.contextPath}/RankRefresh" method="post">
                	<td><input type=text value="<%=Stud_id %> " name="stud_id"class="form-control" readonly="readonly"></td>
                	<td><input type="text" name="grade" value="<%=Grade %>" class="form-control"readonly="readonly"></td>
                	<td><input type="text" value="<%=total %>" name="total" class="form-control" readonly="readonly"></td>
                	<td><input type="text" value="<%=average %>" name="average" class="form-control" readonly="disabled"></td>
                    <td><input type="text" value="<%=teacherID %>" name="teacher_id" class="form-control"readonly="readonly"></td>
                	<td><input type="text" value="<%=semester %>"  name="semseter" class="form-control" readonly="readonly"></td>
                	<td><input type="text" value="<%=section %>" name="section" class="form-control" readonly="readonly"></td>
                	<td><input type="text" value="<%=AcademicYear %>" name="academicyear" class="form-control" readonly="readonly"></td>
                             <%  
               
                
                
                
	}	}
    Statement st_avg=dbconn.getConnection().createStatement();
    ResultSet rs_avg=st_avg.executeQuery("select Stud_id, AVG(total) as 'average'  From total_mark group by Stud_id");
    while(rs_avg.next()){
    	Stud_id=rs_avg.getString(1);
    	average=rs_avg.getFloat(2);
    	//out.println(average);
    }
	
	

 %>
 	<div class="col-lg-2"><input type="submit" value="submit" class="btn btn-primary"></div>
                	</form>
                	 </tr>
<%} %>
 </table>
</body>
</html>