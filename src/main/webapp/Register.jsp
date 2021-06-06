<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*,java.lang.*,java.io.*" %>
<%@ page import="java.util.Date"%>

<%!
public class userinfo {
	private String FirstName;
	private String LastName;
	private String Email;
	private String Password;

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

}

%>

<%
Connection conn = null;
PreparedStatement ps = null;
userinfo user = new userinfo();
Date date = new Date();
Timestamp timeStamp = new Timestamp(date.getTime());
String fname = request.getParameter("fname");
user.setFirstName(fname);
String lname = request.getParameter("lname");
user.setLastName(lname);
String email = request.getParameter("email");
user.setEmail(email);
session.setAttribute("uname",email);
String pw = request.getParameter("password");
user.setPassword(pw);
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost/sims","root","484848");
	//conn = DriverManager.getConnection(url, username, password);
	ps = conn.prepareStatement("INSERT INTO userinfo (FirstName ,LastName ,Email ,Password ,RegDate)" 
	                         + "values(?,?,?,?,?)");
	ps.setString(1, user.getFirstName());
	ps.setString(2, user.getLastName());
	ps.setString(3, user.getEmail());
	ps.setString(4, user.getPassword());
	ps.setTimestamp(5, timeStamp);

	ps.executeUpdate();
	response.sendRedirect("Home.jsp");

} catch (Exception e) {
	System.out.print(e.getMessage());
}
%>