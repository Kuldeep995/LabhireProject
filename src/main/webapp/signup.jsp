<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"  import="java.util.*" import="checkandacess.check"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
   String username =request.getParameter("username");
   String password=request.getParameter("pass");
   String email=request.getParameter("email");
   long aadhar=Long.parseLong(request.getParameter("aadhar"));
   long phone=Long.parseLong(request.getParameter("phone"));
   check c=new check();
   boolean s=c.setuser(username,password,email,aadhar,phone);
   if(s==false)
   {
	   response.sendRedirect("error.html");
   }
   else
   {
	    
	   response.sendRedirect("index.html");

   }
   %>
</body>
</html>