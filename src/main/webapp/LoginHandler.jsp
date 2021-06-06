<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<% 
   
   
      String uname = request.getParameter("email");
      session.setAttribute("uname",uname);

      String pw = request.getParameter("pass");
          
        try{
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sims","root","484848");
         PreparedStatement ps = con.prepareStatement("SELECT * FROM userinfo WHERE Email=? AND Password=?");
         ps.setString(1, uname);
         ps.setString(2, pw);
       
         ResultSet rs = ps.executeQuery();
         if (rs.next())
         {
             response.sendRedirect("Home.jsp");
         }
         else 
         {
             response.sendRedirect("LoginError.jsp");
             
         }         
       }catch (SQLException e)
       {
       out.print(e.getMessage());
       }
      %>