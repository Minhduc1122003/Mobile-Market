<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<title>Trang Người Dùng</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
	<%@include file="common/taglib.jsp"%>
<link rel="stylesheet" href="/css/login.css" />
<%@include file="common/taglib.jsp"%>
</head>
<title>Đăng nhập</title>

<body>
	<%@include file="common/menu.jsp"%>

	<div class="login-container">
		<img src="path/to/your/logo.png" alt="Logo">
		<h2>Đăng nhập với</h2>
		<div class="social-login">
			<a href="#"><img src="path/to/google-icon.png" alt="Google">
				Google</a> <a href="#"><img src="path/to/zalo-icon.png" alt="Zalo">
				Zalo</a>
		</div>
		<div class="divider">Hoặc</div>
		<form action="/layout/login" method="post">
			<div class="mt-4">
				<div class="box-input">
					<input name="user" class="box-input__main" type="text" id="name"
						placeholder="" maxlength="255" required autocomplete="off" value="alex_jones">


					<label for="name">Nhập số điện thoại/email(*)</label>
					<div class="box-input__line"></div>

				</div>
			</div>
			<div class="mt-4">
				<div class="box-input">
					<input name="password" class="box-input__main" type="password"
						id="password" placeholder="" maxlength="255" required
						autocomplete="off" value="password789"> <label for="password" >Nhập mật
						khẩu(*)</label>
					<div class="box-input__line"></div>
				</div>
			</div>
			<div class="form-check float-start">
				<input type="checkbox" name="Remember" value="true"
					class="form-check-input" id="flexCheckDefault" /> <label
					class="form-check-label" for="flexCheckDefault"> Lưu mật
					khẩu </label>
			</div>
			<div class="bottom-text" style="text-align: right;">
				<a href="#"color:#007bff;">Quên mật khẩu?</a>
			</div>
			<a class="testhover" style="width: 100%"> <span></span> <span></span>
				<span></span> <span></span>
				<button class="btn btn-outline-warning "
					style="max-width: 100%; color: white !important; height: 100%; border-radius: 0px !important; border: 1px solid white !important;">Đăng
					nhập</button>
			</a>

		</form>

		<div class="bottom-text">
			Bạn chưa có tài khoản? <a href="/layout/register">Đăng ký ngay</a>
		</div>
</div>

		

<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>