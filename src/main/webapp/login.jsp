<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<%@include file="component/All_css.jsp" %>
<style type="text/css">
.card-sh{
box-shadow: 0 0 6px 0 rgba(0,0,0,0.3)
}
/* 
html {
  font-size: 15px;
}

body {
  background: -webkit-gradient(
      linear,
      left top,
      right bottom,
      from(#af5e94),
      to(#5949f2)
    )
    fixed;
} */
</style>

</head>
<body class="bg-light">
<%@include file="component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3 mt-5">
<div class="card card-sh">
<div class="card-header text-center fs-3">Login Page</div>
<%
String success = (String)session.getAttribute("msg");
if(success != null){
%>
<p class="text-danger text-center mt-1" ><%=success %></p>
<%	
session.removeAttribute("msg");
}
%>

<div class="card-body">
<form action="login" method="post">

  <div class="mb-3">
 <label>Email</label><input type="text" name="email" class="form-control">
 </div>
 
  <div class="mb-3">
 <label>Password</label><input type="text" name="password" class="form-control">
 </div>

 <button class="btn btn-success col-md-12">Login</button>
 <div class="text-center mt-2">
 Don't have account<a href="register.jsp" class="text-decoration-none"> create one</a>
 </div>
</form>

</div>
</div>
</div>
</div>
</div>


</body>
</html>