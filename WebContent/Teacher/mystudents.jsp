<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>

<%  
 if(session.getAttribute("user")==null)
 {
	 
	 response.sendRedirect("../index.jsp");
 }
 
 else
 {
 %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Teachers-page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>

<body>
	<div class="container-fluid">
            <img src="../images/212.jpg" alt="" class="col-lg-12"/>
		<div class="col-lg-3 col-sm-4 col-md-3" style="margin-right:14px">


			<%@ include file="../includes/Tsidebar.jsp"%>


		</div>

		<div class="col-lg-9 col-sm-7 col-md-9" style="margin-left: -15px">



			<%@ include file="studentlist.jsp"%>
		</div>
	</div>
	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">
		<hr style="border: 1px solid brown">
		<p class="text-info">This system is developed by volunteer
			students graduated from Adama science and Technology University for
			Oromiya Development Association</p>

		<%
Date date=new Date(); 
SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
		SimpleDateFormat lsdf=new SimpleDateFormat("MMMM");

String year=sdf.format(date);
String month=lsdf.format(date);
out.println("<center>"+"<h5>"+"&copy"+" "+month+" "+year+"</h5>"+"</center");
 }
%>

	</div>

</body>
</html>
