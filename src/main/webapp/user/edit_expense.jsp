<%@page import="com.entity.Expense"%>
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
<%@include file="../component/All_css.jsp"%>
<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3)
}
</style>
</head>
<body class="bg-light">
<c:if test="${empty loginUser }">
<c:redirect url="../login.jsp"></c:redirect>
</c:if>
  <%
  int id = Integer.parseInt(request.getParameter("id"));
  
  ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
  Expense ex = dao.getExpenseById(id);
  
  %>
	<%@include file="../component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4 mt-3">
				<div class="card card-sh">
					<div class="card-header text-center fs-3">Edit Expense</div>
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
						<form action="../update" method="post">

							<div class="mb-3">
								<label>Title</label><input class="form-control" type="text"
									name="title" value="<%= ex.getTitle()%>">
							</div>

							<div class="mb-3">
								<label>Date</label><input class="form-control" type="date"
									name="date"  value="<%= ex.getDate()%>">
							</div>

							<div class="mb-3">
								<label>Time</label><input class="form-control" type="time"
									name="time"  value="<%= ex.getTime()%>">
							</div>

							<div class="mb-3">
								<label>Description</label><input class="form-control"
									type="text" name="description"  value="<%= ex.getDescription()%>">
							</div>

							<div class="mb-3">
								<label>Price</label><input class="form-control" type="text"
									name="price"  value="<%= ex.getPrice()%>">
							</div>
 						<input type="hidden" name="id" value="<%= ex.getId()%>">
							<button class="btn btn-success col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>