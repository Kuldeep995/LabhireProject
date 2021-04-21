<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"  import="java.util.*" import="checkandacess.check"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title> LabHire </title>
    <meta name="description" content=" ">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="nav.css">
  </head>
  <body>


<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#myNavbar">
                <span class="glyphicon glyphicon-menu-hamburger"></span>
            </button>


         <div class="navbar-left logo">
       <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 291 385.3" style="enable-background:new 0 0 291 385.3;" xml:space="preserve">
<style type="text/css">
	.st0{fill:#000;}
</style>
<polygon class="st0" points="82.1,12 7.4,138.7 38.7,237.3 "/>
<polygon class="st0" points="92.7,5.3 199.4,8.7 223.4,82.7 "/>
<polygon class="st0" points="89.4,8.7 223.4,86.7 42.1,237.3 "/>
<polygon class="st0" points="206.1,15.3 262.7,66 228.1,82.7 "/>
<polygon class="st0" points="262.7,70 228.1,86 266.4,175.3 "/>
<polygon class="st0" points="228.1,92.7 262.7,179.3 173.4,328 "/>
<polygon class="st0" points="223.4,92.7 44.7,240 167.7,336 "/>
<polygon class="st0" points="252.1,210.3 184.4,380.3 170.7,339.7 "/>
<polygon class="st0" points="60.1,260.3 167.4,341 180.4,380.3 "/>
</svg>
          </div>
		<h1 class="brand brand-name navbar-left"><div class"navbar-left"> LabHire </h1>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="card.html">Home</a></li>
   				<li><a href="ajh.html">Add Job</a></li>
   				<li><a href="remove.html">Remove Job</a></li>
    			<li><a href="nav.html">Status of old Jobs</a></li>
    				<li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
<%//to list all the jobs to be removed
long s=(long)session.getAttribute("user");
check c=new check();
 ArrayList<String> value=c.getCategory(s);
 if(value.size()==0)
 {
	 System.out.println("success redirected to noempl.jsp");
	 session.setAttribute("error","No Job has been posted");
	 response.sendRedirect("noempl.jsp");
 }
%>

 <div class="li1">
    <h1 style="color:#DCDCDC;">Remove Jobs</h1>
    <br>
<ul>
<% for (String t : value)  { 
      %>
       <li><a href="remove1.jsp?remove=<%=t%>"><span><%=t%></span></a></li>
      
      <%}%>
</ul>
</div>

     
</body>
</html>