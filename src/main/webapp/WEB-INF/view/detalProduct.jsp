<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="/css/detalProduct.css" />

<title>Chi tiết sản phẩm</title>

</head>
<body>
	<%@include file="common/menu.jsp"%>

	<div class="container" style="margin-top: 20px;">
		<c:forEach var="product" items="${products}">

			<div class="product-details">
				<div class="product-image">
					<div class="slideshow-container">
						<img id="slideImage" src="/photo/${product.image}"
							alt="Product Image" class="img-fluid">
					</div>
					<div class="thumbnail-container">
						<img src="/photo/iphone-13_3.webp" alt="Thumbnail 1"
							class="thumbnail img-fluid"
							onclick="changeImage('/photo/iphone-13_3.webp')"> <img
							src="/photo/iphone-13_1.webp" alt="Thumbnail 2"
							class="thumbnail img-fluid"
							onclick="changeImage('/photo/iphone-13_1.webp')"> <img
							src="/photo/iphone-13_2_.webp" alt="Thumbnail 3"
							class="thumbnail img-fluid"
							onclick="changeImage('/photo/iphone-13_2_.webp')"> <img
							src="/photo/iphone-13_4.webp" alt="Thumbnail 4"
							class="thumbnail img-fluid"
							onclick="changeImage('/photo/iphone-13_4.webp')"><img
							src="/photo/iphone-13_5.webp" alt="Thumbnail 5"
							class="thumbnail img-fluid"
							onclick="changeImage('/photo/iphone-13_5.webp')">
					</div>
				</div>
				<div class="product-info">

					<form action="/layout/chitietsanpham/insert?id=${product.id}" method="post">

						<h1>${product.name}</h1>
						<div class="rating">⭐⭐⭐⭐⭐ 175 đánh giá</div>
						<div class="price">
							<span id="current-price">${product.priceNew} đ</span> <span
								class="old-price">${product.priceOld} đ</span>
						</div>
						<div class="highlight">
							<h2>Tính năng nổi bật</h2>
							<ul>
								<li>Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ
									trợ mạng 5G tốc độ cao</li>
								<li>Không gian hiển thị sống động - Màn hình 6.1" Super
									Retina XDR độ sáng cao, sắc nét</li>
								<li>Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ
									ổn định hình ảnh quang học</li>
								<li>Tối ưu điện năng - Sạc nhanh 20W, đầy 50% pin trong
									khoảng 30 phút</li>
							</ul>
						</div>
						<div class="variants col-md-6">
							<label>Chọn dung lượng</label>
							<div class="option">
								<input type="radio" name="capacityID" value="2"
									data-price="13590000" checked> 128GB -
								${product.priceNew}₫
							</div>
							<div class="option">
								<input type="radio" name="capacityID" value="3"
									data-price="16900000"> 256GB - ${product.price256}₫
							</div>
							<div class="option">
								<input type="radio" name="capacityID" value="4"
									data-price="24390000"> 512GB - ${product.price512}₫
							</div>
						</div>
						<div class="variants">
							<label>Chọn màu sắc</label>
							<div class="option">
								<input type="radio" name="colorID" value="1"
									data-price="13890000" checked> Đen - 13.890.000₫
							</div>
							<div class="option">
								<input type="radio" name="colorID" value="2"
									data-price="13790000"> Trắng - 13.790.000₫
							</div>
							<div class="option">
								<input type="radio" name="colorID" value="5"
									data-price="13790000"> Hồng - 13.790.000₫
							</div>

							<div class="option">
								<input type="radio" name="colorID" value="4"
									data-price="13690000"> Đỏ - 13.690.000₫
							</div>
						</div>
						<div class="button-container">
							<button type="submit" class="button button-orange">Thêm
								vào giỏ hàng</button>
							<button type="submit" class="button button-red button-icon">MUA
								NGAY</button>
							<br> <br>
							<p>(Giao nhanh từ 2 giờ hoặc nhận tại cửa hàng)</p>
						</div>
						<div class="offer-container">
							<h2>Ưu đãi dành cho bạn</h2>
							<ul>
								<li><img src="photo/check.png" alt="check"> Xem chính
									sách ưu đãi dành cho thành viên Smember</li>
								<li><img src="photo/vib.webp" alt="VIB"> Giảm đến 1
									triệu khi thanh toán qua thẻ tín dụng VIB</li>
								<li><img src="photo/vnpay.webp" alt="VNPAY"> Giảm đến
									500K khi thanh toán qua VNPAY-QR</li>
								<li><img src="photo/hsbc.webp" alt="HSBC"> Giảm đến
									500K khi thanh toán qua thẻ tín dụng HSBC</li>
								<li><img src="photo/momo.webp" alt="MoMo"> Nhập mã
									CPSMM giảm 2% - Tối đa 200.000 đồng</li>
								<li><img src="photo/kredivo.webp" alt="Kredivo"> Giảm
									đến 700.000đ khi thanh toán qua Kredivo</li>
								<li><img src="photo/homecredit.webp" alt="Home Credit">
									Giảm 400.000đ khi thanh toán bằng thẻ tín dụng Home Credit</li>
								<li><img src="photo/check.png" alt="check"> Liên hệ
									B2B để được tư vấn giá tốt nhất cho khách hàng doanh nghiệp khi
									mua số lượng nhiều</li>
							</ul>
						</div>
				</div>

				</form>
			</div>
	</div>
	<div class="row">

		<div class="thucu">
			<button class="btn btn-outline-secondary">THU CŨ ĐỔI MỚI GIÁ
				TỐT</button>
			<button style="margin-left: 20px;" class="btn btn-outline-secondary">THAM
				KHẢO HÀNG CŨ</button>
		</div>

		<div class="product-card">
			<img src="/photo/iphone-13_1.webp" alt="iPhone 11 64GB">
			<h3>iPhone 11 64GB | Chính hãng VN/A</h3>
			<p>
				Giá thu đến: <span class="price">4.252.500₫</span>
			</p>
			<a href="#" class="button-red">Lên đời ngay</a>
		</div>
		<div class="product-card">
			<img src="/photo/iphone-13_1.webp" alt="iPhone 11 128GB">
			<h3>iPhone 11 128GB | Chính hãng VN/A</h3>
			<p>
				Giá thu đến: <span class="price">4.987.500₫</span>
			</p>
			<a href="#" class="button-red">Lên đời ngay</a>
		</div>
		<div class="product-card">
			<img src="/photo/iphone-13_1.webp" alt="iPhone 12 64GB">
			<h3>iPhone 12 64GB | Chính hãng VN/A</h3>
			<p>
				Giá thu đến: <span class="price">5.617.500₫</span>
			</p>
			<a href="#" class="button-red">Lên đời ngay</a>
		</div>
		<div class="product-card">
			<img src="/photo/iphone-13_1.webp" alt="iPhone 11 256GB">
			<h3>iPhone 11 256GB | Chính hãng VN/A</h3>
			<p>
				Giá thu đến: <span class="price">5.512.500₫</span>
			</p>
			<a href="#" class="button-red">Lên đời ngay</a>
		</div>
		<div class="product-card">
			<img src="/photo/iphone-13_1.webp" alt="iPhone 12 256GB">
			<h3>iPhone 12 256GB | Chính hãng VN/A</h3>
			<p>
				Giá thu đến: <span class="price">6.982.500₫</span>
			</p>
			<a href="#" class="button-red">Lên đời ngay</a>
		</div>
	</c:forEach>

	</div>
	<%@include file="common/footer.jsp"%>

	<script>
		function changeImage(src) {
			document.getElementById('slideImage').src = src;
		}

		const images = [
		    '/photo/iphone-13_1.webp',
		    '/photo/iphone-13_2_.webp',
		    '/photo/iphone-13_3.webp',
		    '/photo/iphone-13_4.webp',
		    '/photo/iphone-13_5.webp'
		];

		let currentIndex = 0;
		let slideInterval;

		function showSlide(index) {
		    clearInterval(slideInterval);
		    currentIndex = index;
		    document.getElementById('slideImage').src = images[currentIndex];
		    updateActiveThumbnail();
		    startSlideshow();
		}

		function updateActiveThumbnail() {const thumbnails = document.querySelectorAll('.thumbnail img');
		    thumbnails.forEach((thumbnail, index) => {
		        if (index === currentIndex) {
		            thumbnail.classList.add('active');
		        } else {
		            thumbnail.classList.remove('active');
		        }
		    });
		}

		function startSlideshow() {
		    slideInterval = setInterval(() => {
		        currentIndex = (currentIndex + 1) % images.length;
		        document.getElementById('slideImage').src = images[currentIndex];
		        updateActiveThumbnail();
		    }, 3000); // Change image every 3 seconds
		}

		/* document.addEventListener('DOMContentLoaded', () => {
			updateActiveThumbnail();
		    startSlideshow();

		    const capacityOptions = document.querySelectorAll('input[name="capacity"]');
		    const colorOptions = document.querySelectorAll('input[name="color"]');
		    const priceDisplay = document.getElementById('current-price');

		    const getCurrentPrice = () => {
		        const selectedCapacity = document.querySelector('input[name="capacity"]:checked');
		        const selectedColor = document.querySelector('input[name="color"]:checked');
		        const basePrice = parseInt(selectedCapacity.dataset.price);
		        return basePrice;
		    };

		    const updatePriceDisplay = () => {
		        const newPrice = getCurrentPrice();
		        priceDisplay.textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(newPrice);
		    };

		    capacityOptions.forEach(option => option.addEventListener('change', updatePriceDisplay));
		    colorOptions.forEach(option => option.addEventListener('change', updatePriceDisplay));

		    updatePriceDisplay(); */
		});
	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>