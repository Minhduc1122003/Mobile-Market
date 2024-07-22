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

<link href="/css/thongke.css" rel="stylesheet">

<style>
.vertical-align-middle {
	vertical-align: middle; /* Căn giữa hàng dọc */
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
			<div class="user-info">
				<div class="row">
					<div class="col">
						<!-- Thanh tab -->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="tab1-tab"
									data-bs-toggle="tab" data-bs-target="#tab1" type="button"
									role="tab" aria-controls="tab1" aria-selected="true">Thống
									kê theo năm</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab2-tab" data-bs-toggle="tab"
									data-bs-target="#tab2" type="button" role="tab"
									aria-controls="tab2" aria-selected="false">Thống kê
									theo người dùng</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab3-tab" data-bs-toggle="tab"
									data-bs-target="#tab3" type="button" role="tab"
									aria-controls="tab3" aria-selected="false">Thống kê
									từng đơn hàng</button>
							</li>
						</ul>
						<!-- Nội dung của tab -->
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="tab1" role="tabpanel"
								aria-labelledby="tab1-tab">
								<!-- Nội dung của tab 1 -->
								<h1 class="text-center">Tổng doanh thu theo năm</h1>


								<div class="row col"
									style="padding: 20px; margin-top: 10px; border-radius: 10px">
									<div style="height: 400px;">
										<table class="table table-hover ">
											<thead>
												<tr class="text-center">
													<th class="col">Năm</th>
													<th class="col">Tháng</th>
													<th class="col">Tổng đơn hàng</th>
													<th class="col">Tổng tiền đã thu</th>
													<th class="col">Số lượng đã bán</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="thongke" items="${thongkeList}">

													<tr class="text-center">

														<td class="col">${thongke.year}</td>
														<td class="col">${thongke.month}</td>
														<td class="col">${thongke.totalOrders}</td>
														<td class="col">${thongke.totalRevenue}</td>
														<td class="col">${thongke.totalQuantitySold}</td>

													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
									<button type="submit" class="btn btn-success float-end">Xuất
										file Excel</button>

								</div>
								<!-- Form và bảng thống kê của tab 1 -->
								<!-- Điền mã HTML của tab 1 vào đây -->
							</div>

							<div class="tab-pane fade" id="tab2" role="tabpanel"
								aria-labelledby="tab2-tab">
								<!-- Nội dung của tab 2 -->
								<div class="row col" style="margin-top: 20px">
									<div class="mb-3 row">
										<label for="inputPassword" class="col-sm-2 col-form-label"
											style="margin-left: 30px;">Tìm kiếm</label>
										<div class="col-sm-8">
											<!-- Điều chỉnh kích thước của input -->
											<input type="text" class="form-control"
												placeholder="Username, Email, họ tên">
										</div>
										<div class="col-sm-2">
											<!-- Điều chỉnh kích thước của button -->
											<button type="submit" class="btn btn-primary">Tìm
												kiếm</button>
										</div>
									</div>
								</div>
								<div class="row col"
									style="padding: 20px; margin-top: 10px; border-radius: 10px">
									<div style="height: 400px;">
										<table class="table table-hover ">
											<thead>
												<tr class="text-center">
													<th class="col">Tài khoản</th>
													<th class="col">Email liên hệ</th>
													<th class="col">Họ Tên</th>
													<th class="col">Tổng đơn hàng</th>
													<th class="col">Tổng tiền đã mua</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach var="thongke2" items="${thongkeNguoidung}">

													<tr class="text-center">

														<td class="col">${thongke2.username}</td>
														<td class="col">${thongke2.email}</td>
														<td class="col">${thongke2.fullname}</td>
														<td class="col">${thongke2.totalOrders}</td>
														<td class="col">${thongke2.totalRevenue}</td>

													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
									<button type="submit" class="btn btn-success float-end">Xuất
										file Excel</button>

								</div>
							</div>

							<!-- Kết thúc tab2 -->


							<div class="tab-pane fade" id="tab3" role="tabpanel"
								aria-labelledby="tab3-tab">
								<!-- Nội dung của tab 2 -->
								<div class="row col" style="margin-top: 20px">
									<div class="mb-3 row">
										<label for="inputPassword" class="col-sm-2 col-form-label"
											style="margin-left: 30px;">Tìm kiếm</label>
										<div class="col-sm-8">
											<!-- Điều chỉnh kích thước của input -->
											<input type="text" class="form-control"
												placeholder="Username, Email, họ tên">
										</div>
										<div class="col-sm-2">
											<!-- Điều chỉnh kích thước của button -->
											<button type="submit" class="btn btn-primary">Tìm
												kiếm</button>
										</div>
									</div>
								</div>
								<div class="row col"
									style="padding: 20px; margin-top: 10px; border-radius: 10px">
									<div style="height: 400px; overflow-x: auto;">
										<table class="table table-hover">
											<thead>
												<tr class="text-center">
													<th class="col">ID</th>
													<th class="col">Ảnh</th>
													<th class="col">Tên sản phẩm</th>
													<th class="col">Số lượng</th>
													<th class="col">Username đặt hàng</th>
													<th class="col">Email liên hệ</th>
													<th class="col">Họ tên</th>
													<th class="col">Ngày đặt</th>
													<th class="col">Đơn giá</th>
													<th class="col">Giảm giá</th>
													<th class="col">Tổng tiền</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="thongke3" items="${thongkeTungSP}">
													<tr class="text-center" style="line-height: 40px;">
														<td class="col vertical-align-middle">${thongke3.OrderID}</td>
														<td class="col vertical-align-middle"><img alt=""
															src="/photo/${thongke3.image}"
															style="width: 80px; height: 70px;"></td>
														<td class="col vertical-align-middle">${thongke3.ProductName}</td>
														<td class="col vertical-align-middle">${thongke3.quantity}</td>
														<td class="col vertical-align-middle">${thongke3.UserName}</td>
														<td class="col vertical-align-middle">${thongke3.email}</td>
														<td class="col vertical-align-middle">${thongke3.fullname}</td>
														<td class="col vertical-align-middle">${thongke3.formattedOrderDate}</td>
														<td class="col vertical-align-middle">${thongke3.formattedPrice}đ</td>
														<td class="col vertical-align-middle">${thongke3.sale}%</td>
														<td class="col vertical-align-middle">${thongke3.sumPrice}đ</td>

													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<form action="/layout/thongke1" method="get">
										<button type="submit" class="btn btn-success float-end">Xuất
											file Excel</button>
									</form>


								</div>
							</div>
							<!-- Kết thúc tab2 -->







						</div>

						<!-- Form và bảng thống kê của tab 2 -->
						<!-- Điền mã HTML của tab 2 vào đây -->
					</div>
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