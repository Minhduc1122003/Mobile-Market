<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/index.css">




<div class="navbar navbar-expand-lg">
	<div class="container-fluid">
		<a class="navbar-brand" href="/images/logo.png"><img
			src="/images/logo.png" alt="" /></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation" href="/ASM2/views/index">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a
					class="nav-link active text-white bi bi-house" aria-current="page"
					href="/layout/index"> Trang chủ</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-white" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Sản phẩm </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item text-white" href="#">Giá rẻ</a></li>
						<li><a class="dropdown-item text-white" href="#">Sản phẩm
								bán chạy</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item text-white position-relative"
							href="#">Đang giảm giá <span
								class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
									Hot</span></a></li>
					</ul></li>
				<br />

				<input class="form-control me-2 bi bi-search" type="text"
					placeholder="Bạn cần tìm gì?" aria-label="Search" id="inputKeyWord" />
				<a class="testhover"> <span></span> <span></span> <span></span>
					<span></span>
					<button class="btn btn-outline-warning bi bi-search"
						style="width: 80px; font-size: 15px; color: white !important; height: 100%; border-radius: 0px !important; border: 1px solid white !important;"></button>
				</a>
			</ul>
			<form class="d-flex" role="search">
				<div class="userislogin" style="cursor: pointer">
					<a class="bi bi-cart4 position-relative btn-gio-hang"
						id="openTab" href="/layout/cart"
						style="margin-right: 10px"> <span
						class="position-absolute top-5 start-100 translate-middle badge rounded-pill bg-danger"
						id="count-giohang-all" style="width: fit-content" value="0">
							${countCart}</span> <span style="padding-left:5px">Giỏ hàng</span>
					</a>
				</div>
				<div class="userislogin">
					<a  class="userislogin" href="/layout/login"><span >${login}</span></a>
				</div>



				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white bi bi-globe" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							VN </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item text-white" href="#">VN</a></li>
							<li><a class="dropdown-item text-white" href="#">EN</a></li>
						</ul></li>
				</ul>
			</form>
		</div>
	</div>
</div>
