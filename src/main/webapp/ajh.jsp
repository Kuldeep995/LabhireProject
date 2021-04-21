<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*"  import="java.util.*" import="checkandacess.check" import="checkandacess.Twilio_Messagw"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD THE JOB</title>
</head>
<body>
<% String service =request.getParameter("service");
   String city=request.getParameter("em");
   long pay=Long.parseLong(request.getParameter("pay"));
   String more=request.getParameter("message");
   long s=(Long)session.getAttribute("user");
   check c=new check();
   boolean b=c.addjob(s,service,city,pay,more);
   if(b==true)
   {
   response.sendRedirect("addjob.html");
   }
   else
   {%>
	  <h4>Job Already Added</h4>
	  <%} %>
  
   
	 

</body>
</html>