<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*,java.lang.*,java.io.*" %>
<%@ page import="java.util.Date"%>
<%!
public class studentinfo {
	private String firstname;
	private String lastname;
	private String gender;
	private String department;
	private String batch;
	private String description;
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
%>

<%
Connection conn = null;
PreparedStatement ps = null;
studentinfo student = new studentinfo();
Date date = new Date();
Timestamp timeStamp = new Timestamp(date.getTime());
String fname = request.getParameter("firstname");
student.setFirstname(fname);
String lname = request.getParameter("lastname");
student.setLastname(lname);
String gender = request.getParameter("gender");
student.setGender(gender);
String dept = request.getParameter("department");
student.setDepartment(dept);
String batch = request.getParameter("batch");
student.setBatch(batch);
String desc = request.getParameter("description");
student.setDescription(desc);

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/sims","root","484848");
    //conn = DriverManager.getConnection(url, username, password);
    ps = conn.prepareStatement("INSERT INTO studentinfo (FirstName ,LastName ,Gender ,Department ,Batch ,Description ,RegDate)"
            + "values(?,?,?,?,?,?,?)");
    ps.setString(1, student.getFirstname());
    ps.setString(2, student.getLastname());
    ps.setString(3, student.getGender());
    ps.setString(4, student.getDepartment());
    ps.setString(5, student.getBatch());
    ps.setString(6, student.getDescription());
    ps.setTimestamp(7, timeStamp);

    ps.executeUpdate();
    response.sendRedirect("ViewStudent.jsp");

} catch (Exception e) {
 System.out.print(e.getMessage());
}
%>