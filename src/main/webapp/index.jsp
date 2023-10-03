
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Expansion Tracker</title>
<%@include file="component/All_css.jsp" %>

</head>
<body>
<%@include file="component/navbar.jsp" %>
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="img/exp2.jpg" class="d-block w-100" alt="..." height="560px">
      <div class="carousel-caption d-none d-md-block">
        <h5>Track Daily Expanse</h5>
        <p>"A budget is telling your money where to go instead of wondering where it went."</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="img/exp3.jpg" class="d-block w-100" alt="..."  height="560px">
      <div class="carousel-caption d-none d-md-block">
        <h5>Track Daily Expanse</h5>
        <p>"The goal isn't more money. The goal is living life on your terms." </p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/exp1.jpg" class="d-block w-100" alt="..."  height="560px">
      <div class="carousel-caption d-none d-md-block">
        <h5>Track Daily Expanse</h5>
        <p>"Every dollar you spend is a vote for what you value."</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</body>
</html>