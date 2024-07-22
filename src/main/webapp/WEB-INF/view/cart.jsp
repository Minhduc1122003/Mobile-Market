<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

<style>
body {
	background-color: #f5f5f5;
}

.cart-container {
	margin-top: 20px;
}

.cart-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px;
	background-color: #fff;
	border-bottom: 1px solid #ddd;
}

.cart-item {
	background-color: #fff;
	margin-bottom: 10px;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	display: flex;
	align-items: center;
}

.cart-item img {
	max-width: 100px;
	border-radius: 10px;
}

.cart-item-info {
	display: flex;
	align-items: center;
}

.cart-item-info h5 {
	margin: 0 20px;
}

.cart-item-actions {
	display: flex;
	align-items: center;
}

.cart-item-actions button {
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
	width: 30px;
	height: 30px;
}

.cart-summary {
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	text-align: center;
}

.btn-buy {
	background-color: #d50000;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	width: 100%;
	margin-top: 20px;
}

.btn-buy:disabled {
	background-color: #ccc;
}

.cart-item-actions {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
	margin: auto; /* Căn giữa thẻ này */
}

.cart-item-actions p {
	margin: 0;
}

.cart-item-actions button {
	background-color: transparent;
	border: none;
	cursor: pointer;
	padding: 5px;
}

.cart-item-actions .text-danger {
	color: red;
	font-weight: bold;
}

.cart-item-actions del {
	color: #999;
	text-decoration: line-through;
}

.cart-item-actions span {
	margin: 0 5px;
}
</style>
</head>
<body>
	<%@include file="common/menu.jsp"%>

	<div class="container cart-container" style="margin-top: 80px;">
		<!-- Cart Header -->
		<div class="cart-header">
			<button class="btn btn-light">
				<i class="bi bi-arrow-left"></i>
			</button>
			<h2>Giỏ hàng của bạn</h2>
			<button class="btn btn-light">Giỏ hàng</button>
		</div>
		<br>

		<!-- Cart Items -->

		<table class="table">
			<thead>
				<tr class="text-center" style="padding: 20px;">
					<th class="col-5">Thông tin sản phẩm</th>
					<th class="col-3">Đơn giá</th>
					<th class="col-2" style="padding-right: 25px !important;">Số
						lượng</th>
					<th class="col-2" style="padding-right: 50px !important;">Tổng
						tiền</th>
				</tr>
			</thead>
		</table>

		<c:forEach var="product" items="${products}">
			<form action="/layout/cart/edit" method="post">
				<div class="cart-item col text-center">
					<div class="cart-item-info col-3">
						<!-- Thêm thuộc tính onchange để gọi hàm toggleButton() khi checkbox thay đổi -->
						<input type="checkbox" id="itemCheckbox${product.id}"
							onchange="toggleButton(this)"> <img
							src="/photo/${product.image}" alt="iPhone 13">
						<h5>${product.name}</h5>
					</div>
					<div class="cart-item-info col-2">
						<h5>${product.colorName }-${product.capacityName}GB</h5>
					</div>
					<div class="cart-item-actions col-3">
						<p style="width: 100%">
							<span class="text-danger" style="font-size: 20px">${product.priceNew}₫</span>
							<del>${product.priceOld}₫</del>
						</p>
					</div>
					<div class="col-2">
						<a
							href="/layout/cart/edit?action=decrease&id=${product.idCartProduct}"
							class="btn btn-outline-secondary">-</a> <span
							style="font-size: 20px">${product.count}</span> <a
							href="/layout/cart/edit?action=increase&id=${product.idCartProduct}"
							class="btn btn-outline-secondary">+</a>
					</div>
					<div class="cart-item-actions col-2">
						<p style="width: 100%">
							<span class="text-danger" id="productSum${product.id}">${product.sum}₫</span>
						</p>
						<a class="btn btn-outline-danger bi bi-trash"
							href="/layout/cart/edit?action=delete&id=${product.idCartProduct}"></a>
					</div>
				</div>
			</form>
		</c:forEach>



		<div class="cart-item">
			<p>Bảo vệ toàn diện với Bảo hành mở rộng</p>
			<!--             <a href="#" class="text-danger">chọn gói <i class="bi bi-chevron-right"></i></a> -->
		</div>

		<!-- Cart Summary -->
		<div class="cart-summary">
			<h5>Tạm tính</h5>
			<p>
				<span class="text-danger" id="tongtienThanhtoan">0₫</span>
			</p>
			<button class="btn-buy" id="buyButton" disabled>Mua ngay</button>
		</div>
	</div>

	<%@include file="common/footer.jsp"%>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		function toggleButton(checkbox) {
			// Kiểm tra xem checkbox có được chọn không
			var checkedCount = 0;

			// Nếu được chọn, lấy vị trí của checkbox trong danh sách

			var checkboxes = document
					.querySelectorAll('input[type="checkbox"]');
			
			
			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i] === checkbox) {
					// Xuất ra vị trí của checkbox
					console.log("Checkbox thứ " + (i + 1) + " đã được chọn.");

					// Lấy id của phần tử productSum tương ứng với checkbox thứ i
					var productSumElements = document
							.querySelectorAll('span#productSum');

					console.log("span thứ " + (i + 1) + " đã được chọn.");
					var spanDuocChon = productSumElements[i].innerText;
					console.log("giá trị của span: " + spanDuocChon);

					// Loại bỏ ký tự '₫' từ chuỗi
					var giaTriDaTach = spanDuocChon.replace('₫', '');
					console.log("Giá trị kiểu double: " + giaTriDaTach);

					var tongtien = document.getElementById("tongtienThanhtoan");
					tongtien.innerText = giaTriDaTach + "đ";
					var buyButton = document.getElementById("buyButton");
					buyButton.disabled = false;

					break;
				} else {
					var buyButton = document.getElementById("buyButton");
					buyButton.disabled = true;
					break;

				}
			}

		}
	</script>

</body>
</html>