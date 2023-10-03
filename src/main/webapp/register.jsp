<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<%@include file="component/All_css.jsp" %>
<style type="text/css">
.card-sh{
box-shadow: 0 0 6px 0 rgba(0,0,0,0.3)
}

</style>

</head>
<body class="bg-light">
<%@include file="component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3 mt-5">
<div class="card card-sh bg-light">
<div class="card-header text-center fs-3">Register Page</div>
<%
String success = (String)session.getAttribute("success");
if(success != null){
%>
<p class=" text-success text-center mt-1" ><%=success %></p>
<%	
session.removeAttribute("success");
}
%>
<div class="card-body">
<form action="userRegister" method="post">
 <div class="mb-3">
 <label>Enter Full Name</label><input type="text" name="fullname" class="form-control">
 </div>
 
  <div class="mb-3">
 <label>Email</label><input type="text" name="email" class="form-control">
 </div>
 
  <div class="mb-3">
 <label>Password</label><input type="text" name="password" class="form-control">
 </div>
 
  <div class="mb-3">
 <label>About</label><input type="text" name="about" class="form-control">
 </div>
 <button class="btn btn-success col-md-12">Register</button>
 
</form>

</div>
</div>
</div>
</div>
</div>


</body>
</html>