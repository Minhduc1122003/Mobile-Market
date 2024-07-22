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
<link rel="stylesheet" href="/css/register3.css">



<style>
.menuInfo {
	list-style: none;
	padding-top: 20px;
	font-size: 18px
}

.menuInfo li {
	line-height: 40px;
	padding-top: 10px;
}
/* Hiệu ứng mờ dần cho modal */
.fade {
	transition: opacity 0.15s linear;
}

/* Hiệu ứng slide từ dưới lên cho modal */
.modal-slide-in-bottom {
    animation: slide-in-bottom 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
}

@keyframes slide-in-bottom {
    0% {
        transform: translateY(100%);
        opacity: 0;
    }
    100% {
        transform: translateY(0);
        opacity: 1;
    }
} 
.btn-close {
	transition: transform 0.3s ease, color 0.3s ease;
	/* Thêm transition để tạo hiệu ứng mượt khi xoay và thay đổi màu */
	color: black; /* Màu sắc ban đầu */
}

.btn-close:hover {
	transform: rotate(-90deg) scale(1.2);
	/* Xoay nút 90 độ và scale lớn hơn 0.2 lần khi hover */
	color: red; /* Thay đổi màu sắc thành đỏ khi hover */
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
				<h1 class="text-center">

					<input type="text" class="form-control"
						placeholder="Username, Email, họ tên" value="${user.fullname}">
				</h1>

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
								<li><div class="col-sm-8">
										<!-- Điều chỉnh kích thước của input -->
										<input type="text" class="form-control" value=""
											placeholder="${user.email}">
									</div></li>
								<li>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="inlineRadioOptions1" id="inlineRadio1_1" value="true"
											style="margin-top: 10px" ${user.admin ? 'checked' : ''}
											${!user.admin ? 'disabled' : ''}> <label
											class="form-check-label" for="inlineRadio1_1">true</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="inlineRadioOptions1" id="inlineRadio2_1" value="false"
											style="margin-top: 10px" ${!user.admin ? 'checked' : ''}
											${!user.admin ? 'disabled' : ''}> <label
											class="form-check-label" for="inlineRadio2_1">false</label>
									</div>
								</li>


								<li><div class="col-sm-8">
										<!-- Điều chỉnh kích thước của input -->
										<input type="date" class="form-control"
											placeholder="Username, Email, họ tên"
											value="${user.birthday}">
									</div></li>
								<li>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="inlineRadioOptions2" id="inlineRadio1_2" value="true"
											style="margin-top: 10px" ${user.gender ? 'checked' : ''}>
										<label class="form-check-label" for="inlineRadio1_2">Nam</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="inlineRadioOptions2" id="inlineRadio2_2" value="false"
											style="margin-top: 10px" ${!user.gender ? 'checked' : ''}>
										<label class="form-check-label" for="inlineRadio2_2">Nữ</label>
									</div>
								</li>
								<li><span
									style="color: ${user.activated ? 'green' : 'red'};">${user.activateString}




										<button type="button"
											class="btn btn-outline-primary float-end"
											data-bs-toggle="modal" data-bs-target="#exampleModal"
											${user.activated ? 'hidden' : ''}
											onclick="sendActivationCode()">Kích hoạt</button> <!-- Modal -->
								</span> <!-- Hiển thị button "Kích hoạt" nếu activateString không tồn tại hoặc là false -->



									<!-- Button trigger modal -->

									<div class="modal fade modal-slide-in-bottom" id="exampleModal"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content" style="width: 600px;">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="exampleModalLabel">
														<b><span class="bi bi-check-lg"
															style="color: green; padding-right: 5px"></span>Kích hoạt
															tài khoản</b>
													</h1>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<span><b>Chúng tôi đã gửi <span
															style="color: red;">mã xác nhận</span> đến email <i>${user.email}</i>,
															vui lòng nhập mã để kích hoạt tài khoản!
													</b></span>
													<div class="mt-4">
														<div class="box-input">
															<input class="box-input__main" name="fullname"
																id="activationCodeInput" placeholder="" maxlength="255"
																required autocomplete="off" /> <label for="name"
																id="activationCodeLabel"> <i>Nhập mã qua
																	email ${user.email} (*)</i></label>
															<div class="box-input__line"></div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-outline-secondary"
														data-bs-dismiss="modal">Đóng</button>
													<button type="button" class="btn btn-outline-success"
														id="activateButton">Kích hoạt</button>
												</div>
											</div>
										</div>
									</div></li>
							</ul>
						</div>
					</div>
					<div class="barcode text-center">
						<img src="/photo/${user.photo }">
						<p style="color: gray;">@${user.username}</p>
						<button type="button" class="btn btn-success">Upload</button>

					</div>

				</div>
				<div class="float-end">

					<button type="button" class="btn btn-success">Hoàn tất</button>
					<button type="button" class="btn btn-danger">Hủy bỏ</button>
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
	<script th:inline="javascript">
	
	let makichHoat = ''; // Khai báo biến ngoài hàm

	function sendActivationCode() {
	    // Gửi request POST đến endpoint "/sendActivationCode"
	    fetch('/sendActivationCode', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        }
	    })
	    .then(response => {
	        if (response.ok) {
	            return response.text(); // Trả về dữ liệu response dưới dạng text
	        }
	        throw new Error('Network response was not ok.');
	    })
	    .then(data => {
	        // Xử lý dữ liệu nhận được từ server (mã kích hoạt)
	        console.log('Received activation code:', data);
	        makichHoat = data; // Lưu giá trị vào biến ngoài

	    })
	    .catch(error => {
	        console.error('Error fetching activation code:', error);
	        // Xử lý lỗi nếu có
	    });
	}
	
	
	document.getElementById('activateButton').addEventListener('click', function() {
	    // Lấy giá trị từ input
	    let activationCodeInput = document.getElementById('activationCodeInput').value;
	    
	    // Mã kích hoạt cần kiểm tra (giả sử là mã ABC123)
	    let correctActivationCode = makichHoat;
	    
	    // So sánh mã nhập vào với mã chính xác
	    if (activationCodeInput === correctActivationCode) {
    // Mã nhập vào đúng
    console.log('Mã kích hoạt đúng!');
    fetch('/activatedAccount', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (response.ok) {
            return response.text(); // Trả về dữ liệu response dưới dạng text
        }
        throw new Error('Network response was not ok.');
    })
    .then(data => {
        // Chuyển hướng người dùng đến trang chỉnh sửa tài khoản
        window.location.href = data; // data chứa đường dẫn cần chuyển hướng đến
    })
    .catch(error => {
        console.error('Error activating account:', error);
        // Xử lý lỗi nếu có
    });
} else {
	        // Mã nhập vào không đúng
	        alert('Mã kích hoạt không đúng!');
	        // Hiển thị thông báo hoặc xử lý khác tại đây
	    }
	});
	
	document.getElementById('activationCodeLabel').addEventListener('click', function() {
        document.getElementById('activationCodeInput').focus();
    });
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>