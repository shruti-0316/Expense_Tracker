<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.conn.HibernateUtil"%>
<%@page import="com.Dao.ExpenseDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/All_css.jsp" %>
<style type="text/css">
.card-sh{
box-shadow: 0 0 6px 0 rgba(0,0,0,0.3)
}
</style>
</head>
<body class="bg-light">

<c:if test="${empty loginUser }">
<c:redirect url="../login.jsp"></c:redirect>
</c:if>


<%@include file="../component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-8 offset-md-2 mt-3">
<div class="card">
<div class="card-header text-center fs-3"> All Expenses</div>
<%
					String msg = (String) session.getAttribute("msg");
					if (msg != null) {
					%>
					<p class="text-center text-success"><%=msg%></p>
					<%
					session.removeAttribute("msg");
					}
					%>
<div class="card-body">

<table class="table">
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Description</th>
      <th scope="col">Date</th>
      <th scope="col">Time</th>
	  <th scope="col">Price</th>
	  <th scope="col">Action</th>
	  
	  
    </tr>
  </thead>
  <tbody>
  <%
  User user = (User)session.getAttribute("loginUser");
 ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
 List<Expense> list= dao.getAllExpense(user);
 for(Expense e : list){
  %>
   <tr>
      <th scope="row"><%= e.getTitle() %></th>
      <td><%= e.getDescription() %></td>
      <td><%= e.getDate() %></td>
      <td><%= e.getTime() %></td>
       <td><%= e.getPrice() %></td>
       <td>
       <a href="edit_expense.jsp?id=<%=e.getId() %>" class="btn btn-sm btn-primary me-1">Edit</a>
        <a href="../delete?id=<%= e.getId() %>"  class="btn btn-sm btn-danger me-1">Delete</a>
       </td>
    </tr>
   
  <%
  } 	
  %>
  
   
 
  </tbody>
</table>
</div>
</div>
</div>

</div>
</div>

</body>
</html>