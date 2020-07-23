
<%if (session.getAttribute("user") == null)

{
	response.sendRedirect("../index.jsp");
}
else {
	String ActiveUser = session.getAttribute("user").toString();

 %>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.time.Year"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="databaseConnection.Dbconnection"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//$('#mark').bdt();

	})
</script>

<style>
.error {
	color: red;
}

.id {
	background: teal;
}

header, footer {
	display: none;
}
</style>

<title>Roaster</title>
</head>
<body>
	<div class="container-fluid">

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="text-left text-uppercase">EthioChain Friendly Primary
					school student Record Management System</h3>
			</div>
		</div>
		<form action="" method="post">
		<%
					String Grade = null, section = null,id=null;float total=0;int grade=0;
				Dbconnection dbcon = new Dbconnection();
				Connection connection = dbcon.getConnection();
				Statement statement = connection.createStatement();
				ResultSet result = statement.executeQuery(
						"select * from TBL_HomeRoom where Teacher_Id=(select Teacher_Id from TBL_Users where userName='"
								+ ActiveUser + "' )");

				if (result.next()) {
					Grade = result.getString("Grade");
					 grade=Integer.valueOf(Grade);
					section = result.getString("Section_id");
	
		}%>
		
		<%			
		%>
		</form>
		<div class="panel-body">

			<div class="panel-content" style="margin-bottom: 4px">

				<form class="form-inline pull-right" action="" method="post"
					style="margin-bottom: 10px">

					<div class="form-group">


						<label for="semister">Semester</label> <select
							class="form-control" name="semister" required="required"
							id="semister">
							<option value="">choose semister</option>
							<option value="I">First Semister</option>
							<option value="II">Second Semister</option>
							<option value="both">Both Semisters'</option>
						</select>

					</div>

					<button type="submit" class="btn btn-success">Generate
						Roaster</button>
				</form>
				<div>
					<a href="Tindex.jsp"><span class="fa fa-arrow-left"></span><strong>
							back to Menu</strong></a>
				</div>
				<%
				String semister=request.getParameter("semister");
				
				if(semister==null||semister.trim().equals(""))
						{
					%>
				<br>
				<hr>
				<div class="container">
					<strong class="error">No semester choosen</strong>
				</div>
				<%
						}
				else if(grade<5)
				{
				%>
					<% if(semister.equals("I")){%>
					<table class="table  table-responsive table-condensed table-bordered" id="mark">
					<thead>
						<tr>
						<th colspan="21" class="text-center"><strong> <span
						class="text-uppercase "> EthioChaina school <strong></strong>
						branch Grade <%=grade+""+section%></span></strong></th>
						</tr>
						<tr class="info">
							<th >Student ID</th>
							<th >Students' Name</th>
							<th >Gender</th>
							<th >Age</th>
						   <th >semester</th>
							<th >Amharic</th>
							<th >English</th>
							<th >Maths</th>
							<th>Natural Science</th>
							<th>Statics</th>
							<th>Total</th>
							<th>Average</th>
							<th>Rank</th>
							<th>p?f</th>
						</tr>
						</thead>
					<tbody>
				<% 	String sms=null;
				Statement st_semseter=connection.createStatement();
				ResultSet rs_semseter=st_semseter.executeQuery("select semester_name from tbl_semister_management where semester_status='active'");
				if(rs_semseter.next()){
				sms=rs_semseter.getString("semester_name");
				//out.println(sms);
				}
				
							float ave=0;
				
							int bdate=0,birthmonth=0,cdate=0,cmonth=0,total_month=0,total_date=0;
							int birthdate=0,currentYear=0,age1=0;
							String stu_id=null,name=null,gender=null,semester=null;Date age=null; String sub_english=null,sub_maths=null;int rank=0;
					       Statement st=connection.createStatement();
						   ResultSet rs=st.executeQuery("select  AVG(total) as Average,birthdate,semester,tbl_student.stud_id,firstname,middlename,lastname,gender,sum(total) as total,Rank()over (order by sum(total) DESC) as Rank  from tbl_student,total_mark where tbl_student.stud_id=total_mark.stud_id and semester='"+sms+"' group by birthdate,semester,tbl_student.stud_id,firstname,middlename,lastname,gender order by stud_id DESC ");
						    while(rs.next()){
						    	id=rs.getString("stud_id");
						    	name=rs.getString("firstname");
						    	total=rs.getFloat("total");
						    	rank=rs.getInt("rank");
						    	gender=rs.getString("gender");
						    	semester=rs.getString("semester");
						    	age=rs.getDate("Birthdate");
						    	//age1=Integer.valueOf(age);
						    	ave=rs.getFloat("Average");
						    
								
								// student birthdate calculet
								SimpleDateFormat simple=new SimpleDateFormat("yyyy");
								SimpleDateFormat month=new SimpleDateFormat("MM");
								SimpleDateFormat datemonth=new SimpleDateFormat("d");
								String bmonth=month.format(age);
								String bDate=datemonth.format(age);
								String byear=simple.format(age);
								//out.println(byear);
								//out.println(bmonth);
								//out.println(Date);
								Date current_date=new Date();
								String current_year=simple.format(current_date);
								//out.println("year"+current_year);
								String current_month=month.format(current_date);
								//out.println("month"+current_month);
								String currentdate=datemonth.format(current_date);
								cmonth=Integer.valueOf(current_month);
								cdate=Integer.valueOf(currentdate);
								bdate=Integer.valueOf(bDate);
								birthmonth=Integer.valueOf(bmonth);
								//out.println("date"+currentdate);
								currentYear=Integer.valueOf(current_year);
								 birthdate=Integer.valueOf(byear);
						
								if(birthmonth>cmonth){
							    total_month=currentYear-1*12+cmonth-birthmonth;
								}
								 		age1=currentYear-birthdate;
                             %> 
                            <tr>
						    <td>
						    <%=id%>
						    </td>
						    		    <td>
						    <%=name%>
						    </td>
						    		    <td>
						    <%=gender%>
						    </td>
						    	  		    <td>
						    <%=age1%>
						    </td>
						    	  		    <td>
						    <%=semester%>
						    </td>
					<%	int iterator=0;
					float t=0;
					String pre="sub";
					String subject="subject";
					Statement st1=connection.createStatement();
					ResultSet rs1=st1.executeQuery("select * from total_mark where stud_id='"+id+"'and semester='"+sms+"' order by subject_id ASC");
					while(rs1.next()){%> <td><%
					String name1=pre+iterator; 
					String subname=subject+iterator;
					sub_english=rs1.getString(3);
					t=Float.valueOf(sub_english);
					out.println(sub_english);
					iterator++;} %>
						    <td>
						    <%=total%>
						    </td>
						     <td>
						    <%=ave%>
						    </td>
						    <td>
						    <%=rank%>
						    </td>
        	    		    <%}
        	    		    %>	
					</tbody>
				</table>
				<div class="nopint col-lg-offset-10">
					<button id="printpagebutton" type="button" class="btn btn-primary "
						onclick="printpage()">
						<span class="glyphicon glyphicon-print"> <strong>print
								roaster</strong>
						</span>
					</button>
				</div>
			
			<%} else if(semister.equals("II")){
				%>
				<table class="table  table-responsive table-condensed table-bordered" id="mark">
				<thead>
					<tr>
					<th colspan="21" class="text-center"><strong> <span
					class="text-uppercase "> EthioChaina school <strong></strong>
					branch Grade <%=grade+""+section%></span></strong></th>
					</tr>
					<tr class="info">
						<th >Student ID</th>
						<th >Students' Name</th>
						<th >Gender</th>
						<th >Age</th>
					   <th >semester</th>
						<th >Amharic</th>
						<th >English</th>
						<th >Maths</th>
						<th>Natural Science</th>
						<th>Statics</th>
						<th>Total</th>
						<th>Average</th>
						<th>Rank</th>
						<th>p?f</th>
					</tr>
					</thead>
				<tbody>
				
			
			<% 
				float ave=0;
				int bdate=0,birthmonth=0,cdate=0,cmonth=0,total_month=0,total_date=0;
				int birthdate=0,currentYear=0,age1=0;
				String stu_id=null,name=null,gender=null,semester=null;Date age=null; String sub_english=null,sub_maths=null;int rank=0;
		       Statement st=connection.createStatement();
			   ResultSet rs=st.executeQuery("select  AVG(total) as Average,birthdate,semester,tbl_student.stud_id,firstname,middlename,lastname,gender,sum(total) as total,Rank()over (order by sum(total) DESC) as Rank  from tbl_student,total_mark where tbl_student.stud_id=total_mark.stud_id and semester='II' group by birthdate,semester,tbl_student.stud_id,firstname,middlename,lastname,gender ");
			    while(rs.next()){
			    	id=rs.getString("stud_id");
			    	name=rs.getString("firstname");
			    	total=rs.getFloat("total");
			    	rank=rs.getInt("rank");
			    	gender=rs.getString("gender");
			    	semester=rs.getString("semester");
			    	age=rs.getDate("Birthdate");
			    	//age1=Integer.valueOf(age);
			    	ave=rs.getFloat("Average");
			    
					
					// student birthdate calculet
					SimpleDateFormat simple=new SimpleDateFormat("yyyy");
					SimpleDateFormat month=new SimpleDateFormat("MM");
					SimpleDateFormat datemonth=new SimpleDateFormat("d");
					String bmonth=month.format(age);
					String bDate=datemonth.format(age);
					String byear=simple.format(age);
					//out.println(byear);
					//out.println(bmonth);
					//out.println(Date);
					Date current_date=new Date();
					String current_year=simple.format(current_date);
					//out.println("year"+current_year);
					String current_month=month.format(current_date);
					//out.println("month"+current_month);
					String currentdate=datemonth.format(current_date);
					cmonth=Integer.valueOf(current_month);
					cdate=Integer.valueOf(currentdate);
					bdate=Integer.valueOf(bDate);
					birthmonth=Integer.valueOf(bmonth);
					//out.println("date"+currentdate);
					currentYear=Integer.valueOf(current_year);
					 birthdate=Integer.valueOf(byear);
			
					if(birthmonth>cmonth){
				    total_month=currentYear-1*12+cmonth-birthmonth;
					}
					 		age1=currentYear-birthdate;
                 %> 
                <tr>
			    <td>
			    <%=id%>
			    </td>
			    		    <td>
			    <%=name%>
			    </td>
			    		    <td>
			    <%=gender%>
			    </td>
			    	  		    <td>
			    <%=age1%>
			    </td>
			    	  		    <td>
			    <%=semester%>
			    </td>
			  
		<%	int iterator=0;
		String pre="sub";
		String subject="subject";
		Statement st2=connection.createStatement();
		ResultSet rs2=st2.executeQuery("select * from total_mark where stud_id='"+id+"'and semester='II' order by subject_id ASC");
		while(rs2.next()){%> <td><%
		String name1=pre+iterator; 
		String subname=subject+iterator;
		sub_english=rs2.getString(3);
		out.println(sub_english);
		iterator++;} %>
			    <td>
			    <%=total%>
			    </td>
			     <td>
			    <%=ave%>
			    </td>
			    <td>
			    <%=rank%>
			    </td>
    		    <td>
			    <%%>
			    </td>
			  <%} %>
			  		</tbody>
				</table>
				<div class="nopint col-lg-offset-10">
					<button id="printpagebutton" type="button" class="btn btn-primary "
						onclick="printpage()">
						<span class="glyphicon glyphicon-print"> <strong>print
								roaster</strong>
						</span>
					</button>
				</div>
			    <%}else if(semister.equals("both")){%>
			    <table class="table  table-responsive table-condensed table-bordered" id="mark">
					<thead>
						<tr>
						<th colspan="21" class="text-center"><strong> <span
						class="text-uppercase "> EthioChaina school <strong></strong>
						branch Grade <%=grade+""+section%></span></strong></th>
						</tr>
						<tr class="info">
							<th rowspan='2'>Student ID</th>
							<th rowspan="2">Students' Name</th>
							<th rowspan="2">Gender</th>
							<th rowspan="2">Age</th>
							
							<th colspan="2">Amharic</th>
							<th colspan="2">English</th>
							<th colspan="2">Maths</th>
							<th colspan="2">Natural Science</th>
							<th colspan="2">Statics</th>
							
						</tr>
						<tr class="info">
							
							
							
							
							<th>semester I</th>
							<th>semester II</th>
						
							
							<th>semester I</th>
							<th>semester II</th>
							
							
							<th>semester I</th>
							<th>semester II</th>
							
							
							<th>semester I</th>
							<th>semester II</th>
							
							<th>semester I</th>
							<th>semester II</th>
							
							
						 <th>Total</th>
							<th>Average</th>
							<th>Rank</th>
							<th>p?f</th>
																
						
						</tr>
                       </thead>
					<tbody>
				
			    <%
					float ave=0;
					int bdate=0,birthmonth=0,cdate=0,cmonth=0,total_month=0,total_date=0;
					int birthdate=0,currentYear=0,age1=0;
					String stu_id=null,name=null,gender=null,semester=null;Date age=null; String sub_english=null,sub_maths=null;int rank=0;
			       Statement st=connection.createStatement();
				   ResultSet rs=st.executeQuery("select tbl_student.stud_id,firstname,middlename,lastname,gender,birthdate,SUM(total) as total,AVG(total) as average,Rank()over (order by sum(total) DESC) as Rank from tbl_student,total_mark where  tbl_student.stud_id=total_mark.stud_id group by birthdate,gender,firstname,middlename,lastname,tbl_student.stud_id ");
				    while(rs.next()){
				    	id=rs.getString("stud_id");
				    	name=rs.getString("firstname");
				    	total=rs.getFloat("total");
				    	rank=rs.getInt("rank");
				    	gender=rs.getString("gender");
				    	//semester=rs.getString("semester");
				    	age=rs.getDate("Birthdate");
				    	//age1=Integer.valueOf(age);
				    	ave=rs.getFloat("Average");
				    
						
						// student birthdate calculet
						SimpleDateFormat simple=new SimpleDateFormat("yyyy");
						SimpleDateFormat month=new SimpleDateFormat("MM");
						SimpleDateFormat datemonth=new SimpleDateFormat("d");
						String bmonth=month.format(age);
						String bDate=datemonth.format(age);
						String byear=simple.format(age);
						//out.println(byear);
						//out.println(bmonth);
						//out.println(Date);
						Date current_date=new Date();
						String current_year=simple.format(current_date);
						//out.println("year"+current_year);
						String current_month=month.format(current_date);
						//out.println("month"+current_month);
						String currentdate=datemonth.format(current_date);
						cmonth=Integer.valueOf(current_month);
						cdate=Integer.valueOf(currentdate);
						bdate=Integer.valueOf(bDate);
						birthmonth=Integer.valueOf(bmonth);
						//out.println("date"+currentdate);
						currentYear=Integer.valueOf(current_year);
						 birthdate=Integer.valueOf(byear);
				
						if(birthmonth>cmonth){
					    total_month=currentYear-1*12+cmonth-birthmonth;
						}
						 		age1=currentYear-birthdate;
	                 %> 
	                <tr>
				    <td>
				    <%=id%>
				    </td>
				    		    <td>
				    <%=name%>
				    </td>
				    		    <td>
				    <%=gender%>
				    </td>
				    	  		    <td>
				    <%=age1%>
				    </td>
				    	
			<%
			int i=0;	float t=0,resul=0;
			String pre="sub";
			String subject="subject";
			ArrayList<String> Idlist_11 = new ArrayList();
			ArrayList<Float> avarege_11 = new ArrayList();
			Statement st2=connection.createStatement();
			ResultSet rs2=st2.executeQuery("select * from total_mark where stud_id='"+id+"' order by subject_id ASC");
			
			while(rs2.next()){%> 
			<td><%
			String name1=pre+i; 
			String subname=subject+i;
			sub_english=rs2.getString(3);
		    t=Float.valueOf(sub_english);
		    
		    resul=t/2;
		    out.println(sub_english);
		    i++;}%>
		    </td>
		    		    <td>
				    <%=total%>
				    </td>
				     <td>
				    <%=ave%>
				    </td>
				    <td>
				    <%=rank%>
				    </td>
	    		    <td>
				    <%%>
				    </td>
			    			
			    			
			    			<%}
					   
				    } %></tbody>
				</table>
				<div class="nopint col-lg-offset-10">
					<button id="printpagebutton" type="button" class="btn btn-primary "
						onclick="printpage()">
						<span class="glyphicon glyphicon-print"> <strong>print
								roaster</strong>
						</span>
					</button>
				</div>
			
			    	<% }else if(grade>5 && grade<7) {
			    
			    	%>
			    	 <table
					class="table  table-responsive table-condensed table-bordered"
					id="mark">
					<thead>
						<tr>
						<th colspan="21" class="text-center"><strong> <span
						class="text-uppercase "> EthioChaina school <strong></strong>
						branch Grade <%=grade+""+section%></span></strong></th>
						</tr>
						<tr class="info">
							<th>Student ID</th>
							<th>Students' Name</th>
							<th>Gender</th>
							<th>Age</th>
							<th>semester</th>
							<th>Amharic</th>
							<th>Art</th>
						    <th>Civics</th>
							<th>English</th>
							<th>Geography</th>
							<th>Maths</th>
							<th>Music</th>
							<th>Sport</th>
							<th>Total</th>
							<th>Average</th>
							<th>Rank</th>
							<th>p?f</th>
						</tr>
                       </thead>
					<tbody>
				 	
			    	<%
			    	
			    }else if(grade>6 && grade<9){
			    
			    	%>
			    		 <table
					class="table  table-responsive table-condensed table-bordered"
					id="mark">
					<thead>
						<tr>
						<th colspan="21" class="text-center"><strong> <span
						class="text-uppercase "> EthioChaina school <strong></strong>
						branch Grade <%=grade+""+section%></span></strong></th>
						</tr>
						<tr class="info">
							<th>Student ID</th>
							<th>Students' Name</th>
							<th>Gender</th>
							<th>Age</th>
							<th>semester</th>
							<th>Amharic</th>
							<th>Biology</th>
							<th>Chemistry</th>
						    <th>Civics</th>
							<th>English</th>
							<th>Geography</th>
							<th>Maths</th>
							<th>Physics</th>
							<th>Sport</th>
							<th>Total</th>
							<th>Average</th>
							<th>Rank</th>
							<th>p?f</th>
						</tr>
                       </thead>
					<tbody><%
			    	
			    }else if(grade>8 && grade<10)
			    	{%>
	    		 <table
			class="table  table-responsive table-condensed table-bordered"
			id="mark">
			<thead>
				<tr>
				<th colspan="21" class="text-center"><strong> <span
				class="text-uppercase "> EthioChaina school <strong></strong>
				branch Grade <%=grade+""+section%></span></strong></th>
				</tr>
				<tr class="info">
					<th>Student ID</th>
					<th>Students' Name</th>
					<th>Gender</th>
					<th>Age</th>
					<th>semester</th>
					<th>Amharic</th>
					<th>Biology</th>
					<th>Chemistry</th>
				    <th>Civics</th>
					<th>English</th>
					<th>Geography</th>
					<th>History</th>
					<th>It</th>
					<th>Maths</th>
					<th>Physics</th>
					<th>Sport</th>
					<th>Total</th>
					<th>Average</th>
					<th>Rank</th>
					<th>p?f</th>
				</tr>
              </thead>
			<tbody>
			     <%}else if(grade>10 && grade<13){%>
					 <table
						class="table  table-responsive table-condensed table-bordered"
						id="mark">
						<thead>
							<tr>
							<th colspan="21" class="text-center"><strong> <span
							class="text-uppercase "> EthioChaina school <strong></strong>
							branch Grade <%=grade+""+section%></span></strong></th>
							</tr>
							<tr class="info">
								<th>Student ID</th>
								<th>Students' Name</th>
								<th>Gender</th>
								<th>Age</th>
								<th>semester</th>
								<th>Amharic</th>
								<th>Biology</th>
								<th>Chemistry</th>
							    <th>Civics</th>
								<th>English</th>
								<th>Geography</th>
								<th>History</th>
								<th>It</th>
								<th>Maths</th>
								<th>Physics</th>
								<th>Sport</th>
								<th>Total</th>
								<th>Average</th>
								<th>Rank</th>
								<th>p?f</th>
							</tr>
			              </thead>
						<tbody>
			    <%}%>
			    
	</div>
	</div>
</body>
<script type="text/javascript">
		function printpage() {
		    //Get the print button and put it into a variable
		    var printButton = document.getElementById("printpagebutton");
		    //Set the print button visibility to 'hidden' 
		    printButton.style.visibility = 'hidden';
		    //Print the page content
		    window.print()
		    //Set the print button to 'visible' again 
		    //[Delete this line if you want it to stay hidden after printing]
		    printButton.style.visibility = 'visible';
		}</script>
<%}%>
</html>
