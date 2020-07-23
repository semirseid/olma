<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
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
<html>
<head>
<meta charset="utf-8">
<title>Teachers-page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
#body {
	font-family: "Trebuchet MS", sans-serif;
}
</style>
</head>

<body id="body">
    <img src="../images/212.jpg" alt="" class="col-lg-12"/>

    <div class="col-lg-4 col-sm-4 col-md-4"style="margin-left:14px;">


			<%@ include file="../includes/Tsidebar.jsp"%>
		</div>


		<div class="col-lg-6 col-sm-7 col-md-7" style="margin-left: -10px;margin-right: 16px;">



			<%@ include file="hrmtabs2.jsp"%>








		</div>
	</div>
	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">
		<hr style="border: 1px solid brown">
		<p class="text-info">This system is developed by volunteer
			students graduated from Adama science and Technology University for
			Oromiya Development Association</p>



	</div>
	<%} %>
</body>
</html>
