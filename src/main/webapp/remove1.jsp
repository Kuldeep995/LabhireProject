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
<%  //to remove job from the database
String t=request.getParameter("remove");
    long eid=(Long)session.getAttribute("user");
    check c=new check();
    c.remove(t,eid);
    System.out.println("success redirected to remove.jsp");
    response.sendRedirect("remove.jsp");
    %>
</body>
</html>