<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Student Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="css/Style.css" rel="stylesheet">

<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>
	<!-- ======= Navbar ======= -->
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="#">SIMS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="Home.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="RegisterStudent.jsp">Register Student</a></li>
				<li class="nav-item active"><a class="nav-link" href="ViewStudent.jsp">View Student</a></li>
				<li class="nav-item"><a class="nav-link" href="Search.jsp">Search</a></li>
				<li class="nav-item"><a class="nav-link" href="Logout.jsp">Logout</a></li>
			</ul>
		</div>
	</nav><br><br><br>
<div class="row" style="float:right">

</div>
	<h1>List of Students</h1>
	<table>
		<tr>
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gender</th>
			<th>Department</th>
			<th>Batch</th>
			<th>Registration Date</th>
		</tr>
		<%
		try{
	    Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sims","root", "484848"); 
		String Query = "select * from studentinfo";
		Statement stm = conn.createStatement(); 
		ResultSet rs = stm.executeQuery(Query);
		while (rs.next()) {
		%>
		<tr>
		<td><%= rs.getString("Id") %></td>
		<td><%= rs.getString("FirstName") %></td>
		<td><%= rs.getString("LastName") %></td>
		<td><%= rs.getString("Gender") %></td>
		<td><%= rs.getString("Department") %></td>
		<td><%= rs.getString("Batch") %></td>
		<td><%= rs.getString("RegDate") %></td>
		</tr>
		<%
		}
		}catch (Exception e) {
            out.print(e.getMessage());
        }
		%>

	</table>
	<footer style="margin-top:50vh;">
	  All Right Reserved.
	</footer>
</body>
</html>