
<%if(session.getAttribute("registrar")==null) {
	
	response.sendRedirect("../index.jsp");
}
else{%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%Dbconnection dbcon=new Dbconnection();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function printpage() {

    var printButton = document.getElementById("printpagebutton");
 
    printButton.style.visibility = 'hidden';
   
    window.print()
     printButton.style.visibility = 'visible';
}


</script>



<%String userid=session.getAttribute("registrar").toString()
,branch=null;
Statement sttotal=dbcon.getConnection().createStatement();
ResultSet rsttotal=sttotal.executeQuery("select *from tbl_users where username='"+userid+"'");
while(rsttotal.next()){
	//branch=rsttotal.getString("branch");
	//out.println(branch);
}
String ademicyear=null;int total_m=0,total_f=0,total_stud=0;
ResultSet rsgrade=sttotal.executeQuery("select AcademicYear from tbl_setup where calandar_status='1' ");
while(rsgrade.next()){
	ademicyear=rsgrade.getString("AcademicYear");
	}
int male_8=0;
ResultSet totalstud=sttotal.executeQuery("select count(stud_id)from tbl_student where gender='male' and Grade='8' and Status='Active'");
while(totalstud.next()){
	male_8=totalstud.getInt(1);
}

int female_8=0;int total_8=0;
ResultSet rsfemaletotal=sttotal.executeQuery("select count(stud_id) from tbl_student where  gender='female'and grade='8'and Status='Active' ");
while(rsfemaletotal.next()){
	female_8=rsfemaletotal.getInt(1);
	//grade=rsfemaletotal.getInt(2);
	total_8=male_8+female_8;
	//out.println(female);
}%>
<div>
	<span> students of EthioChaina in <%=ademicyear %>
	</span>
	<hr>
	<table id="table" class="table table-responsive table-bordered">
		<thead>
			<tr>
				<th>Grade</th>
				<th>Male</th>
				<th>Female</th>
				<th>Total</th>

			</tr>
			<tr>
				<td>8</td>
				<td><%=male_8%></td>
				<td><%=female_8 %></td>
				<td><%=total_8 %></td>

			</tr>
			<tr>
				<%
int total_7=0;
int grade_7=0;
Statement st_grade_7=dbcon.getConnection().createStatement();
ResultSet rs_grade_7=st_grade_7.executeQuery("select *from tbl_student where  Grade='7' and Status='Active'");
while(rs_grade_7.next()){
	grade_7=rs_grade_7.getInt("Grade");
	//out.println(grade-10);
}
int male_7=0;
ResultSet rs_male_stud=st_grade_7.executeQuery("select count(stud_id) from tbl_student where  Grade='7' and Gender='male' and Status='Active'" );
while(rs_male_stud.next()){
	male_7=rs_male_stud.getInt(1);
}int femal_7=0;
ResultSet rs_female_7=st_grade_7.executeQuery("select count(stud_id) from tbl_student where  Grade='7'and Gender ='female' and Status='Active'");
while(rs_female_7.next()){
	femal_7=rs_female_7.getInt(1);
}
total_7=male_7+femal_7;
%>
				<td>7</td>
				<td><%=male_7%></td>
				<td><%=femal_7%></td>
				<td><%=total_7%></td>
			</tr>
			<tr>
				<%
int male_6=0;
Statement st_6=dbcon.getConnection().createStatement();
ResultSet rs_6=st_6.executeQuery("select count(stud_id) from tbl_student where Grade='6'and gender='male' and Status='Active'" );
while(rs_6.next()){
	male_6=rs_6.getInt(1);
}
int female_6=0,total_6=0;
ResultSet rs_female_6=st_6.executeQuery("select count(stud_id)from tbl_student where grade='6'and gender='female' and Status='Active'");
while(rs_female_6.next()){
	female_6=rs_female_6.getInt(1);
	total_6=male_6+female_6;
}%>
				<td>6</td>
				<td><%=male_6 %></td>
				<td><%=female_6 %></td>
				<td><%=total_6 %></td>
			</tr>
			<tr>
				<td>5</td>
				<%int male_5=0,female_5=0,total_5=0;
Statement st_5=dbcon.getConnection().createStatement();
ResultSet rs_5=st_5.executeQuery("select count(stud_id) from tbl_student where  gender='male'and grade='5'and Status='Active'");
while(rs_5.next()){
	male_5=rs_5.getInt(1);
}
ResultSet rs_5_female=st_5.executeQuery("select count(stud_id)from tbl_student where grade='5'and gender='female' and Status='Active' ");
while(rs_5_female.next()){
	female_5=rs_5_female.getInt(1);
	total_5=male_5+female_5;
	total_m=male_8+male_7+male_6+male_5;
	total_f=female_8+femal_7+female_6+female_5;
	total_stud=total_8+total_7+total_6+total_5;
}
%>
				<td><%=male_6 %></td>
				<td><%=female_6 %></td>
				<td><%=total_6 %></td>
			</tr>
			<tr>
			<td>
			4
			</td>
							<%int male_4=0,female_4=0,total_4=0;
Statement st_4=dbcon.getConnection().createStatement();
ResultSet rs_4=st_4.executeQuery("select count(stud_id) from tbl_student where  gender='male'and grade='4'and Status='Active'");
while(rs_4.next()){
	male_4=rs_4.getInt(1);
}
ResultSet rs_4_female=st_4.executeQuery("select count(stud_id)from tbl_student where grade='4'and gender='female' and Status='Active' ");
while(rs_4_female.next()){
	female_4=rs_4_female.getInt(1);
	total_4=male_4+female_4;
	total_4=male_4+female_4;
	total_m=male_8+male_7+male_6+male_5+male_4;
	total_f=female_8+femal_7+female_6+female_5+female_4;
	total_stud=total_8+total_7+total_6+total_5;
}
%>
				<td><%=male_4 %></td>
				<td><%=female_4 %></td>
				<td><%=total_4 %></td>
			</tr>
				<tr>
			<td>
			3
			</td>
							<%int male_3=0,female_3=0,total_3=0;
Statement st_3=dbcon.getConnection().createStatement();
ResultSet rs_3=st_3.executeQuery("select count(stud_id) from tbl_student where  gender='male'and grade='3'and Status='Active'");
while(rs_3.next()){
	male_3=rs_3.getInt(1);
}
ResultSet rs_3_female=st_3.executeQuery("select count(stud_id)from tbl_student where grade='3'and gender='female' and Status='Active' ");
while(rs_3_female.next()){
	female_3=rs_3_female.getInt(1);
	total_3=male_3+female_3;
	total_m=male_8+male_7+male_6+male_5+male_4+male_3;
	total_f=female_8+femal_7+female_6+female_5+female_4+female_3;
	total_stud=total_8+total_7+total_6+total_5+total_4+total_3;
}
%>
				<td><%=male_3 %></td>
				<td><%=female_3 %></td>
				<td><%=total_3 %></td>
			</tr>
				<tr>
			<td>
			2
			</td>
							<%int male_2=0,female_2=0,total_2=0;
Statement st_2=dbcon.getConnection().createStatement();
ResultSet rs_2=st_2.executeQuery("select count(stud_id) from tbl_student where  gender='male'and grade='2'and Status='Active'");
while(rs_2.next()){
	male_2=rs_2.getInt(1);
}
ResultSet rs_2_female=st_2.executeQuery("select count(stud_id)from tbl_student where grade='2'and gender='female' and Status='Active' ");
while(rs_2_female.next()){
	female_2=rs_2_female.getInt(1);
	total_2=male_2+female_2;
	total_m=male_8+male_7+male_6+male_5+male_4+male_3+male_2;
	total_f=female_8+femal_7+female_6+female_5+female_4+female_3+female_2;
	total_stud=total_8+total_7+total_6+total_5+total_4+total_3+total_2;
}
%>
				<td><%=male_2%></td>
				<td><%=female_2 %></td>
				<td><%=total_2 %></td>
			</tr>
				<tr>
			<td>
			1
			</td>
							<%int male_1=0,female_1=0,total_1=0;
Statement st_1=dbcon.getConnection().createStatement();
ResultSet rs_1=st_1.executeQuery("select count(stud_id) from tbl_student where  gender='male'and grade='1'and Status='Active'");
while(rs_1.next()){
	male_1=rs_1.getInt(1);
}
ResultSet rs_1_female=st_1.executeQuery("select count(stud_id)from tbl_student where grade='1'and gender='female' and Status='Active' ");
while(rs_1_female.next()){
	female_1=rs_1_female.getInt(1);
	total_1=male_1+female_1;
	total_m=male_8+male_7+male_6+male_5+male_4+male_3+male_2+male_1;
	total_f=female_8+femal_7+female_6+female_5+female_4+female_3+female_2+female_1;
	total_stud=total_8+total_7+total_6+total_5+total_4+total_3+total_2+total_1;
}
%>
				<td><%=male_1 %></td>
				<td><%=female_1 %></td>
				<td><%=total_1 %></td>
			</tr>
			
			<tr>
				<td>All</td>
				<td><%=total_m %></td>
				<td><%=total_f %></td>
				<td><%=total_stud %></td>
			</tr>
	</table>
	<div class="container-fluid">
		<input type="submit" onclick="printpage();" value="print this report"
			id="printpagebutton" class="pull-right btn btn-primary" />
	</div>

	<%} %>

</html>