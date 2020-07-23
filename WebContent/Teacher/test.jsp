
<%if(session.getAttribute("user")==null)
	{
	response.sendRedirect("../index.jsp");
	}
	else
	{
	%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="databaseConnection.*"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/font-awesome/css/font-awesome.min.css" />

<title>test</title>
</head>
<body>
	<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">Student Test update form</div>
			<div class="panel-body">
				<%
String id,fname,lname,TID=null,subid=null,Grade=null,section=null,branch=null;
Dbconnection dbconnnect=new Dbconnection();
Statement getTeacher=dbconnnect.getConnection().createStatement();
ResultSet ActiveTeacher=getTeacher.executeQuery("Select Teacher_Id from TBL_USers where userName='"+session.getAttribute("user").toString()+"'");

if(ActiveTeacher.next())
{
	TID=ActiveTeacher.getString(1);
	//branch=ActiveTeacher.getString(2);
	//out.print(TID);
}
Statement st_selectsubject=dbconnnect.getConnection().createStatement();
ResultSet rs_sub=st_selectsubject.executeQuery("select Distinct Subject_id from TBL_Subject_Teacher where Teacher_Id='"+TID+"'");

	while(rs_sub.next())	
	{
		subid=rs_sub.getString(1);
	}
     Statement st_gs=dbconnnect.getConnection().createStatement();
	ResultSet rs_gs=st_gs.executeQuery("select Grade,Section_id from TBL_Subject_Teacher where Teacher_Id='"+TID+"'");
	int min=0,max=0;
	%>
				<form action="" method="post" class="form-inline pull-left">
					<select class="form-control" name="grade" required="required">
						<option value="">Choose Grade</option>
						<%
while(rs_gs.next())
{
	Grade=rs_gs.getString("Grade");
	section=rs_gs.getString("Section_id");
	section=rs_gs.getString(2);
%>
						<option value="<%=Grade.concat(section)%>"><%=Grade+ section%></option>
                                                
						<%} %>
					</select> 
                                                                       
					<select class="form-control " name="semester" required="required">
						<option value="">Choose semester</option>
                                                <option value="I">First semester</option>
                                                <option value="II">Second semester</option>
                                        
                                        <%if(request.getParameter("semester")==null){
                                           %>
                                           
			
                                        <%}
else {
String semester=request.getParameter("semester");
if(semester.equals("I")||semester.equals("II")){

}

}%>
                  </select>                      
                        <select class="form-control" required name="test">
						<option value="">Choose test</option>
						<option value="monthly">monthly test(10)</option>
						<option value="classwork">Classwork(15)</option>
						<option value="homework">Home work(15)</option>
						<option value="groupwork">Group work(15)</option>
						<option value="Reading">Reading(15)</option>
						<option value="Wrtting">Writting (15)</option>
						<option value="calculet">Calculet(15)</option>
						<option value="classactivity">Class Activity (15)</option>
						<option value="final">Final(40)</option>
						
					</select>
					<button class="btn btn-primary">choose test</button>
				</form>
			</div>
			<%
if(request.getParameter("test")==null)
{
	%>
			<div class=" well well-sm alert-warning">
				<h5 class="text-danger">choose test mechanism</h5>
			</div>
			<%}
else
{
	String test=request.getParameter("test");
	if(test.equals("monthly"))
	{
		min=1;
		max=10;
	}
	
	else if (test.equals("classactivity")||test.equals("calculet")||test.equals("Wrtting")||test.equals("Reading")||test.equals("groupwork")||test.equals("homework")||test.equals("classwork")||test.equals("monthly"))
	{
		min=1;
		max=15;
	}
	else if(test.equals("final")){
		min=1;
	  max=30;
	}
%>
			<div class="container-fluid">

				<strong><strong>${exists} ${notsaved} ${saved}</strong> </strong>

				<%
	request.getSession().setAttribute("exists", null);
	request.getSession().setAttribute("notsaved", null);
	request.getSession().setAttribute("saved", null);
	%>
				<table class="table  table-condensed" id="mark">

					<thead>
						<tr>    <th>Semester</th>
							<th>TestName</th>
							<th>Student ID</th>
							<th>Full name</th>
							<th>Mark obtained</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>

						<%
Statement st=dbconnnect.getConnection().createStatement();
        String choosengrade=request.getParameter("grade");
	 
	out.print("<div class='alert'><strong> you selected Grade= "+Grade+" section="+section+"</strong></div>");
ResultSet Result=st.executeQuery("select * from TBL_student where Grade='"+Grade+"' and Section_id='"+section+"'  ");
while(Result.next())
{
	id=Result.getString("Stud_id");
	fname=Result.getString("FirstName");
	lname=Result.getString("middlename");

	%>
						<tr>
							<form method="post"
								action="${pageContext.request.contextPath}/SaveTestResult"
								id="mark" name="mark" onsubmit="return valiatemark(this)">
                                                            <td><%=request.getParameter("semester")%></td>
								<td><%=request.getParameter("test")%> <input
									name="teacherid" type="hidden" value="<%=TID%>"> <input
									name="subid" type="hidden" value="<%=subid%>"> <input
									name="studid" type="hidden" value="<%=id%>"> <input
									name="semester" type="hidden" value="<%=request.getParameter("semester")%>"> <input
									name="test" type="hidden"
									value="<%=request.getParameter("test")%>"> <input
									name="section" type="hidden" value="<%=section%>"> <input
									name="grade" type="hidden" value="<%=Grade%>"></td>
								<td>
									<div>
										<%= id%>
									</div>
								</td>
								<td><%= fname+" "+lname%></td>
								<td><input type="number" class="form-control"
									name="obtainedMark" style="width: 150px" required="required"
									min="<%=min %>" max="<%=max%>"></td>
									</tr>
									<%} %>
								<td><button type="submit"
										class="btn btn-primary fa fa-save" value="save mark"></button>
										</td>
							</form>
							
							</div>
					
						<% 

}
%>
					</tbody>
				</table>
			</div>
			<script type="text/javascript">
$(document).ready(function()
		{
$("#mark").bdt();	
});
</script>
			<%
 }
%>
		</div>
	</div>
	<script type="text/javascript"
		src="../resources/jquery/jquery.validate.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>
</body>
</html>