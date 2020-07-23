<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="databaseConnection.Dbconnection"%>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("../index.jsp");
	} else 
	{
		
		Date year=new Date();
		SimpleDateFormat yrformmat=new SimpleDateFormat("yyyy");
	String currentyear=yrformmat.format(year);
	
		
		String ActiveUser = session.getAttribute("user").toString();
		Dbconnection DBconnection = new Dbconnection();
%>

<html>
<head>

<style>
input[type='number'] {-moz-appearance:textfield;
}
</style>
<link type="text/css" rel="stylesheet" title="currentStyle"
	href=../resources/css/demo_table.css />

<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#mark').bdt(
			{
			ordering:true,
			scrollY:300,
			paging:false
			});

})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />

<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>
<title>mark input form</title>

<style type="text/css">
.error {
	color: red;
	font: small-12px brown;
}
</style>
</head>
<body>
	<div class="container-fluid">
	
            <img src="../images/212.jpg" alt="" class="col-lg-12"/>
		
	
	<div style="color: red" class="col-lg-12">
		<a href="Tindex.jsp"><span class="fa fa-arrow-left"></span><strong>
				back to Menu</strong></a>
	</div>
	<%
		String TeacherID, grade, section, room, branch,academicyear;

	Date currrentdate=new Date();
	SimpleDateFormat dateFormat=new SimpleDateFormat("Y");
	String currentYear=dateFormat.format(currrentdate);
	
			Connection connection = DBconnection.getConnection();
			Statement st = connection.createStatement();
			String sql = "select Teacher_Id from TBL_Users where userName='" + ActiveUser + "' ";
			ResultSet rs_test = st.executeQuery(sql);
			if (rs_test.next()) {
				TeacherID = rs_test.getString(1);
				//_branch = rs_test.getString(2);
				ResultSet rs_test_hrm = st
						.executeQuery("select * from TBL_HomeRoom where Teacher_Id='" + TeacherID + "' and AcadamicYear='"+currentYear+"'");
				if (rs_test_hrm.next()) {
					grade = rs_test_hrm.getString("Grade");
					//out.println(grade);
					section = rs_test_hrm.getString("Section_id");
                                        academicyear=rs_test_hrm.getString("AcadamicYear");
                                        
					//out.println(section);
	%>
	<div class="container-fluid" style="margin-top: 3px;">
		<div class="  container-fluid">
			<h4 class="text-info text-left container col-md-offseet-2">
				Kolfe secondary school
				
				<br> Mark update form for Grade
				<%=grade.concat(section)%></h4>
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
		</div>
		<%
                    String sub=null;
                    Statement st_subject_teacher=connection.createStatement();
                    ResultSet rs_teacherassignment=st_subject_teacher.executeQuery("select * from TBL_Subject_Teacher where Teacher_Id='"+TeacherID+"'and Grade='"+grade+"'and section_id='"+section+"'");
                            while(rs_teacherassignment.next()){
                    sub=rs_teacherassignment.getString("Subject_id");
                            out.println(sub);
                            }
		String semister = request.getParameter("semister");
						if (semister == null) {
		%>
		<div class="alert alert-warning">
			<h5 class=" text-warning">you should have to choose semester</h5>
		</div>


		<%
			} else {
		%>


		<table
			class="table table-responsive table-condensed table-bordered table-striped"
			id="mark">
			<thead>

				<tr>

					<th>Student ID</th>
					<th>AMHARIC</th>
					<th>ENGLISH </th>
					<th>MATHS</th>
					<th>PHYSICS</th>
					<th>CHEMISTRY</th>
					<th>BIOLOGY</th>
					<th>GEOGRAPHY</th>
                    <th>HISTORY</th>
					<th>CIVICS</th>
					<th>HPE</th>
					<th>INFO.TECH.</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
			<span class="alert alert-info well well-sm "><strong>Message:
						<span style="color: red">${ nupdted } ${notrefreshed }</span> <span
						style="color: red">${AlreadyInserted}</span> <span
						style="color: green">${refreshed} ${updted}</span>
				</strong></span>


				<div class="pull-right">

					<form method="post"
						action="${pageContext.request.contextPath }/RankRefresh">
						<%
	int Year=Integer.valueOf(currentyear)-7;
	%>

						<input type="hidden" name="section" value="<%=section%>">
						<input type="hidden" name="semister" value="<%=semister%>">
						<input type="hidden" name="grade" value="<%=grade%>"> <input
							type="hidden" name="year" value="<%=Year%>"> 
							
						<button type="submit" class="btn btn-success">
							<strong>Refresh Rank of Students</strong>
						</button>
					</form>
				</div>
				<%
			request.getSession().setAttribute("AlreadyInserted", null);
			request.getSession().setAttribute("updted", null);
			request.getSession().setAttribute("nupdted", null);
			request.getSession().setAttribute("refreshed", null);
			request.getSession().setAttribute("notrefreshed", null);
				%>

				<%
				String studentid=null;
				int i=0;
					Statement Markstatement = DBconnection.getConnection().createStatement();
									ResultSet rs_stud = Markstatement.executeQuery("select * from TBL_Student where Grade='"+grade+"' and Section_id='"+section+"'");
									while (rs_stud.next()) {
										studentid=rs_stud.getString("Stud_id");
				%>

				<form class="form-group" name="mark" id="mark"
					action="${pageContext.request.contextPath }/UpdateMark"
					method="post" onsubmit="return validateform(this)">

					<tr>

						<td class="text-info"><%=studentid %></td>
						<%
                                                    float test1=0;
						int iterator=0;
						String pre="sub";
						String subject="subject";
						Statement st_subid=DBconnection.getConnection().createStatement();
						ResultSet ressub=st_subid.executeQuery("select Distinct Subject_id from TBL_SUBJ where Grade='"+grade+"'order by Subject_id");
						while(ressub.next())
						{
					     String name=pre+iterator; 
					     String subname=subject+iterator;
						Statement st_subject=DBconnection.getConnection().createStatement();
                                                ResultSet rs_subject=st_subject.executeQuery("select Distinct Stud_id, obtainedMark from tbl_test where grade='"+grade+"' and subject_id='"+sub+"'and type='t1'");
                                                while(rs_subject.next()){
                                                    test1=rs_subject.getFloat("obtainedMark");
                                                    
                                                }
                                               
                                                %>
                                                
                                                <%   float test=0,test2=0,mid=0,finalexam=0,activity=0,assignment=0,result=0;
                                                    	Statement st_subject_test=DBconnection.getConnection().createStatement();
                                                ResultSet rs_subject_test=st_subject_test.executeQuery("select Distinct subject_id, obtainedMark from tbl_test where grade='"+grade+"' and subject_id='"+sub+"'and type='t1'and stud_id='"+studentid+"'");
                                                while(rs_subject_test.next()){
                                                    test=rs_subject_test.getFloat("obtainedMark");
                                                    
                                                }
                                               	Statement st_subject_test2=DBconnection.getConnection().createStatement();
                                                ResultSet rs_subject_test2=st_subject_test2.executeQuery("select subject_id, obtainedMark from tbl_test where grade='"+grade+"' and subject_id='"+sub+"'and type='t2'and stud_id='"+studentid+"'");
                                                while(rs_subject_test2.next()){
                                                    test2=rs_subject_test2.getFloat("obtainedMark");
                                                    
                                                }
                                                    	Statement st_subject_mid=DBconnection.getConnection().createStatement();
                                                ResultSet rs_subject_mid=st_subject_mid.executeQuery("select subject_id, obtainedMark from tbl_test where grade='"+grade+"' and subject_id='"+sub+"'and type='mid'and stud_id='"+studentid+"'");
                                                while(rs_subject_mid.next()){
                                                    mid=rs_subject_mid.getFloat("obtainedMark");
                                                    
                                                }
                                                    	Statement st_subject_assignment=DBconnection.getConnection().createStatement();
                                                ResultSet rs_subject_assignment=st_subject_assignment.executeQuery("select  subject_id,obtainedMark from tbl_test where grade='"+grade+"' and subject_id='"+sub+"'and type='assignment'and stud_id='"+studentid+"'");
                                                while(rs_subject_assignment.next()){
                                                    assignment=rs_subject_assignment.getFloat("obtainedMark");
                                                    
                                                }
                                                     	Statement st_subject_activity=DBconnection.getConnection().createStatement();
                                                ResultSet rs_subject_activity=st_subject_activity.executeQuery("select subject_id, obtainedMark from tbl_test where grade='"+grade+"' and subject_id='"+sub+"'and type='ac'and stud_id='"+studentid+"'");
                                                while(rs_subject_activity.next()){
                                                    activity=rs_subject_activity.getFloat("obtainedMark");
                                                    
                                                }
                                                     	Statement st_subject_finalexam=DBconnection.getConnection().createStatement();
                                                ResultSet rs_subject_finalexam=st_subject_finalexam.executeQuery("select  subject_id,obtainedMark from tbl_test where grade='"+grade+"' and subject_id='"+sub+"'and type='final'and stud_id='"+studentid+"'");
                                                while(rs_subject_finalexam.next()){
                                                    finalexam=rs_subject_finalexam.getFloat("obtainedMark");
                                                    
                                                }
                                               result=test+test1+mid+assignment+activity+finalexam;
                                             
                                                %> 
						<td>
                            <input type="number" step="0.01" name="<%=subname%>" value="<%=result%>"
							class="col-lg form-control " required="required" min="1"
							max="100"> <input type="text" name="<%=name%>"
							value="<%=ressub.getString(1)%>" class="form-control"
							required="required" min="1" max="100"></td>
						<%
						iterator++;
						} 
                                                 %>
						<td><input type="hidden" name="studentid"
							value="<%=studentid%>"> <input type="hidden"
							name="teacherid" value="<%=TeacherID%>"> <input
							type="hidden" name="semister" value="<%=semister%>"> <input
							type="hidden" name="grade" value="<%=grade%>"> <input
							type="hidden" name="section" value="<%=section%>">
							<button type="submit" class="btn btn-success">
								<span class="fa fa-save"></span>

							</button></td>
					</tr>
				</form>
                            <%
			i++;
		        }
		if(i==0)
		{%>
				<tr>
					<td colspan="15">No student found for Grade <%=grade %>
						section <%=section %></td>
				</tr>
				<%
							
						}
				%>
			</tbody>
		</table>

	</div>
	<%
		}
				} else {
				%>
	<div class="alert alert-danger">Dear User you cannot update mark
		of students</div>
	<%
				}
			}
	%>


</body>
</html>
<%
	}
%>