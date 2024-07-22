<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<link rel="stylesheet" href="/css/register3.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
</head>
<body>
	<%@include file="common/menu.jsp"%>

	<div class="container" style="margin-top: 80px !important; max-width:55%;">
		<div class="container1">
			<div class="card">
				<h2 class="text-center">Đăng ký tài khoản</h2>
				<form action="/layout/create" method="post" modelAttribute="user">

					<div class="mt-4">

						<div class="box-input">
							<input class="box-input__main" name="fullname" id="name"
								placeholder="" maxlength="255" required autocomplete="off" /> <label
								for="name">NHẬP HỌ VÀ TÊN(*)</label>
							<div class="box-input__line"></div>
							<div class="box-input__err-validate">Vui lòng không bỏ
								trống</div>
						</div>
					</div>


					<div class="mt-4">
						<div class="box-input">
							<input class="box-input__main" type="text" id="phone"
								name="username" placeholder="" maxlength="255" required
								autocomplete="off" /> <label for="phone">TÊN ĐĂNG
								NHẬP(*)</label>
							<div class="box-input__line"></div>
							<div class="box-input__err-validate">Vui lòng không bỏ
								trống</div>
						</div>
					</div>

					<div class="mt-4">
						<div class="box-input">
							<input class="box-input__main" type="email" id="email"
								name="email" placeholder="" maxlength="255" required
								autocomplete="off" /> <label for="email">NHẬP EMAIL(*)</label>
							<div class="box-input__line"></div>
							<div class="box-input__err-validate">Vui lòng không bỏ
								trống</div>
						</div>
					</div>

					<div class="mt-4">
						<div class="box-input">
							<input class="box-input__main" type="date" id="birthDate"
								name="birthday1" placeholder="" required autocomplete="off" />
							<label for="birthDate">NHẬP NGÀY SINH(*)</label>
							<div class="box-input__line"></div>
							<div class="box-input__err-validate">Vui lòng không bỏ
								trống</div>
						</div>
					</div>

					<div class="mt-4">
						<div>
							<input type="radio" id="male" name="gender1" value="male" /> <label
								for="male">Nam</label> 
							<input type="radio" id="female"
								name="gender1" value="female" /> <label for="female">Nữ</label>
						</div>
					</div>



					<div class="mt-4">
						<div class="box-input">
							<input class="box-input__main" type="password" id="password"
								name="password" placeholder="" maxlength="255" required
								autocomplete="off" /> <label for="password">NHẬP MẬT
								KHẨU(*)</label>
							<div class="box-input__line"></div>
							<div class="box-input__err-validate">Vui lòng không bỏ
								trống</div>
						</div>
					</div>

					<div class="mt-4">
						<div class="box-input">
							<input class="box-input__main" type="password"
								id="confirmPassword" name="confirmPassword" placeholder=""
								maxlength="255" required autocomplete="off" /> <label
								for="confirmPassword">XÁC NHẬN MẬT KHẨU(*)</label>
							<div class="box-input__line"></div>
							<div class="box-input__err-validate">Vui lòng không bỏ
								trống</div>
						</div>
					</div>

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="terms" /> <label
							class="form-check-label" for="terms">Tôi đồng ý với các
							điều khoản bảo mật cá nhân</label>
					</div>
					<button type="submit" class="btn btn-primary btn-block">Đăng
						ký</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="common/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
