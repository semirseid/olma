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

<title>Test</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>


</head>

<body style="font-family: Trebuchet MS, sans-serif;">

    <img src="../images/212.jpg" alt="" class="col-lg-12"/>
		   <div class="col-lg-4 col-sm-4 col-md-4">

			<%@ include file="../includes/Tsidebar.jsp"%>
		</div>

		<span class=" col-lg-8 col-sm-8 col-md-9"> <%@ include
				file="Marksubmission.jsp"%>
		</span>
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
