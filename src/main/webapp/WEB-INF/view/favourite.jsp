<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Mục yêu thích</title>

<%@include file="common/taglib.jsp"%>


</head>
<body ng-app="myapp">
	<div ng-controller="myctrl">
		<!-- menu -->
		<%@include file="common/menu.jsp"%>
		<br>
		<br>
		<br>
		<br>
		<h1>Đây là trang mục yêu thích của tôi</h1>



	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- <script src="js/poly.js"></script> -->
	<script src="https://cdn.emailjs.com/dist/email.min.js"></script>

</body>
</html>


