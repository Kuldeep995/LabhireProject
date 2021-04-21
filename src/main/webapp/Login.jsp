<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"  import="java.util.*" import="checkandacess.check"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<%//to access server to check login credentils  
String username =request.getParameter("email");
   String password=request.getParameter("pass");
   check c=new check();
   long  s=c.getcheck(username,password);
   if(s==0)
   {
	   System.out.println("success redirected to error.html"); 
	   response.sendRedirect("error.html");
   }
   else
   {
	   System.out.println("success redirected to addjob.html");
	   session.setAttribute("user",s); 
	   response.sendRedirect("addjob.html");

   }
   %>
</body>
</html>