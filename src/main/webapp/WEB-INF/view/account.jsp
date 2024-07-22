<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<link href="/css/account2.css" rel="stylesheet">

<style>
.menuInfo {
	list-style: none;
	padding-top: 20px;
	font-size: 18px
}

.menuInfo li {
	padding-top: 10px;
}
</style>

</head>
<body>
	<%@include file="common/menu.jsp"%>

	<div class="container"
		style="margin-top: 100px; max-width: 92% !important;">
		<div class="sidebar col-3">

			<a href="/layout/index" class="active bi bi-house-door-fill"
				style="font-size: 40px;"> <span style="padding-left: 10px;">Trang
					chủ</span>
			</a> <a href="/layout/login" class="bi bi-person-circle
			"
				style="font-size: 25px;"> <span style="padding-left: 10px;">Thông
					tin tài khoản</span>


			</a><a href="/layout/thongke" class="bi bi-graph-up-arrow
			"
				style="font-size: 25px;"> <span style="padding-left: 10px;">Thống
					kê</span>


			</a> <a href="/layout/login" class="bi bi-folder-plus
			"
				style="font-size: 25px;"> <span style="padding-left: 10px;">Thêm
					sản phẩm</span>


			</a> <a href="/layout/login" class="bi bi-person-lines-fill
			"
				style="font-size: 25px;"> <span style="padding-left: 10px;">Quản
					lý người dùng</span>


			</a> <a href="/logout" class="bi bi-box-arrow-right"
				style="font-size: 25px;"> <span style="padding-left: 10px;">
					Đăng xuất</span>
			</a>
		</div>

		<div class="main-content">
			<c:forEach var="user" items="${users}">
				<h1 class="text-center">${user.fullname}</h1>

				<div class="user-info">

					<div class="col" style="max-width: 100%">
						<div class="col-5 float-start">
							<ul class="menuInfo" style="margin-left: 10px;">
								<li><b>Email:</b></li>
								<li><b>Admin:</b></li>
								<li><b>Ngày sinh:</b></li>
								<li><b>Giới tính:</b></li>
								<li><b>Trạng thái:</b></li>

							</ul>

						</div>
						<div class="col-7 float-end">

							<ul class="menuInfo" style="margin-left: 10px;">
								<li>${user.email}</li>
								<li>${user.admin}</li>
								<li>${user.birthday}</li>
								<li>${user.gender}</li>
								<li><span
									style="color: ${user.activated ? 'green' : 'red'};">${user.activateString}
										<button type="button"
											class="btn btn-outline-primary float-end"
											${user.activated ? 'hidden' : ''}>Kích hoạt</button>
								</span></li>
							</ul>



						</div>
					</div>
					<div class="barcode text-center">
						<img src="/photo/${user.photo }">
						<p style="color: gray;">@${user.username}</p>
					</div>

				</div>
				<div class="float-end">

					<a href="/account/edit?id=${user.username}"><button
							type="button" class="btn btn-primary">Cập nhật</button></a>
					<button type="button" class="btn btn-danger">Xóa tài khoản</button>

				</div>
			</c:forEach>


			<br>
			<div class="section" style="margin-top: 30px;">
				<h2>Chương trình nổi bật</h2>
				<div id="highlightCarousel" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo1.png" class="d-block w-100" alt="Promo 1">
									<p>Đặc Quyền CellphoneS</p>
									<p>OPPO Find X5 Pro</p>
									<p>Giá chỉ 17.89 Triệu</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo2.png" class="d-block w-100" alt="Promo 2">
									<p>Thu cũ làm chủ 4G</p>
									<p>Trợ giá lên đến 400K</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo1.png" class="d-block w-100" alt="Promo 1">
									<p>Đặc Quyền CellphoneS</p>
									<p>OPPO Find X5 Pro</p>
									<p>Giá chỉ 17.89 Triệu</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo2.png" class="d-block w-100" alt="Promo 2">
									<p>Thu cũ làm chủ 4G</p>
									<p>Trợ giá lên đến 400K</p>
								</div>
							</div>
						</div>
						<!-- Thêm các mục khác nếu cần -->
					</div>
					<button class="carousel-control-prev " type="button"
						data-bs-target="#highlightCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#highlightCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>



			<div class="section">
				<h2>Chương trình nổi bật</h2>
				<div id="highlightCarousel" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo1.png" class="d-block w-100" alt="Promo 1">
									<p>Đặc Quyền CellphoneS</p>
									<p>OPPO Find X5 Pro</p>
									<p>Giá chỉ 17.89 Triệu</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo2.png" class="d-block w-100" alt="Promo 2">
									<p>Thu cũ làm chủ 4G</p>
									<p>Trợ giá lên đến 400K</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo1.png" class="d-block w-100" alt="Promo 1">
									<p>Đặc Quyền CellphoneS</p>
									<p>OPPO Find X5 Pro</p>
									<p>Giá chỉ 17.89 Triệu</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="d-flex justify-content-center">
								<div class="item">
									<img src="promo2.png" class="d-block w-100" alt="Promo 2">
									<p>Thu cũ làm chủ 4G</p>
									<p>Trợ giá lên đến 400K</p>
								</div>
							</div>
						</div>
						<!-- Thêm các mục khác nếu cần -->
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#highlightCarouselPrev" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>

					<button class="carousel-control-next" type="button"
						data-bs-target="#highlightCarouselNext" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="common/footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>