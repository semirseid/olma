<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page import="databaseConnection.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%  
 if(session.getAttribute("user")==null)
 {
 response.sendRedirect("../index.jsp");
 }
 else 
 {
	 Dbconnection gradereportConnection=new Dbconnection();
	 Statement reportstatement=gradereportConnection.getConnection().createStatement();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />

</head>
<body>



    <img src="../images/212.jpg" alt="" class="col-lg-12"/>
		
		<div class="col-lg-3 col-md-4 col-sm-4" style="margin-right: -10px;margin-left:12px;">
			<%@ include file="../includes/Tsidebar.jsp"%>
		</div>

		<%
	 String LoggedTeacher=session.getAttribute("user").toString();
	 //out.print(LoggedTeacher);....pass
	  String TeacherID=null;
	 
	 String Grade=null,section=null;
	
	 String query="select Teacher_Id from TBL_Users where userName='"+LoggedTeacher+"'";
	 ResultSet result=reportstatement.executeQuery(query);
	 if(result.next())
	 {
	   TeacherID=result.getString(1);
	   Statement Statement_select_room=gradereportConnection.getConnection().createStatement();	 
	   ResultSet rs_home=Statement_select_room.executeQuery("select Grade , Section_id from TBL_HomeRoom where Teacher_ID='"+TeacherID+"' ");
	   if(rs_home.next())
	   {
		  Grade=rs_home.getString(1);
		%>
		<div class="col-lg-9 col-md-8 col-sm-8" style="margin-left: -15px">
			<%@ include file="hrmtabs.jsp"%>
		</div>
		<%
	   }
	   else
	   {
		   %>
		<div class=" col-md-8 col-sm-8" style="margin-left: -2px">
			<div class="container col-lg-12">
				<h4 class=" page-header " style="margin-top: 1px">Dear
					User,sorry you are not home room teacher</h4>
				<p>
					Links in this page needs the user to be <strong>Home room
						Teacher</strong>
				</p>
			</div>
		</div>

		<%	   }
 }
 }
 %>
	</div>
</body>
</html>
