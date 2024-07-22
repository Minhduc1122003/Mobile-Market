<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>


.footer {
margin-top:20px;
	background-color: #fff;
	padding: 20px 0;
	box-shadow: 0 -1px 5px rgba(0, 0, 0, 0.1);
}

.footer-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	max-width: 1300px;
	margin: 0 auto;
	padding: 0 20px;
}

.footer-column {
	flex: 1;
	min-width: 200px;
	margin: 20px 15px;
}

.footer-column h3 {
	color: #e60012;
	font-size: 18px;
	margin-bottom: 10px;
}

.footer-column h4 {
	color: #000;
	font-size: 16px;
	margin-bottom: 10px;
}

.footer-column p, .footer-column ul {
	color: #333;
	font-size: 14px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.footer-column ul li {
	margin-bottom: 5px;
}

.footer-column ul li a {
	color: #333;
	text-decoration: none;
}

.footer-column ul li a:hover {
	text-decoration: underline;
}

.footer-column form {
	display: flex;
	flex-direction: column;
}

.footer-column form input[type="email"], .footer-column form input[type="tel"]
	{
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
}

.footer-column form .checkbox-container {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.footer-column form .checkbox-container input {
	margin-right: 10px;
}

.footer-column form button {
	background-color: #e60012;
	color: white;
	border: none;
	padding: 10px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

.footer-column form button:hover {
	background-color: #b3000d;
}



.footer-bottom {
	background-color: #f1f1f1;
	text-align: center;
	padding: 10px 20px;
	font-size: 14px;
	color: #666;
}
</style>
	<footer class="footer">
		<div class="footer-container">
			<div class="footer-column">
				<h3>Tổng đài hỗ trợ miễn phí</h3>
				<p>
					Gọi mua hàng <strong>1800.2097</strong> (7h30 - 22h00)
				</p>
				<p>
					Gọi khiếu nại <strong>1800.2063</strong> (8h00 - 21h30)
				</p>
				<p>
					Gọi bảo hành <strong>1800.2064</strong> (8h00 - 21h00)
				</p>
				<h4>Phương thức thanh toán</h4>
				<img src="payment_methods.png" alt="Phương thức thanh toán">
			</div>
			<div class="footer-column">
				<h3>Đăng ký nhận tin khuyến mãi</h3>
				<p>
					<strong>Nhận ngay voucher 10%</strong>
				</p>
				<p>
					<em>Voucher sẽ được gửi sau 24h, chỉ áp dụng cho khách hàng
						mới</em>
				</p>
				<form>
					<input type="email" placeholder="Email *" required> <input
						type="tel" placeholder="Số điện thoại">
					<div class="checkbox-container">
						<input type="checkbox" id="terms" required> <label
							for="terms">Tôi đồng ý với điều khoản của CellphoneS</label>
					</div>
					<button type="submit">ĐĂNG KÝ NGAY</button>
				</form>
			</div>
			<div class="footer-column">
				<h3>Thông tin và chính sách</h3>
				<ul>
					<li><a href="#">Mua hàng và thanh toán Online</a></li>
					<li><a href="#">Mua hàng trả góp Online</a></li>
					<li><a href="#">Mua hàng trả góp bằng thẻ tín dụng</a></li>
					<li><a href="#">Chính sách giao hàng</a></li>
					<li><a href="#">Tra điểm Smember</a></li>
					<li><a href="#">Xem ưu đãi Smember</a></li>
					<li><a href="#">Tra thông tin bảo hành</a></li>
					<li><a href="#">Tra cứu hóa đơn điện tử</a></li>
					<li><a href="#">Thông tin hóa đơn mua hàng</a></li>
					<li><a href="#">Trung tâm bảo hành chính hãng</a></li>
					<li><a href="#">Quy định về việc sao lưu dữ liệu</a></li>
				</ul>
			</div>
			<div class="footer-column">
				<h3>Dịch vụ và thông tin khác</h3>
				<ul>
					<li><a href="#">Khách hàng doanh nghiệp (B2B)</a></li>
					<li><a href="#">Ưu đãi thanh toán</a></li>
					<li><a href="#">Quy chế hoạt động</a></li>
					<li><a href="#">Chính sách bảo mật thông tin cá nhân</a></li>
					<li><a href="#">Chính sách Bảo hành</a></li>
					<li><a href="#">Liên hệ hợp tác kinh doanh</a></li>
					<li><a href="#">Tuyển dụng</a></li>
					<li><a href="#">Dịch vụ bảo hành điện thoại</a></li>
					<li><a href="#">Dịch vụ bảo hành mở rộng</a></li>
				</ul>
				<h4>Smember: Tích điểm & sử dụng ưu đãi</h4>
				<div class="app-links">
					<a href="#"><img src="google_play.png" alt="Google Play"></a>
					<a href="#"><img src="app_store.png" alt="App Store"></a>
				</div>
			</div>
			<div class="footer-column">
				<h3>Kết nối với CellphoneS</h3>
				<div class="social-links">
					<a href="#"><img src="facebook.png" alt="Facebook"></a> <a
						href="#"><img src="youtube.png" alt="YouTube"></a> <a
						href="#"><img src="instagram.png" alt="Instagram"></a> <a
						href="#"><img src="tiktok.png" alt="TikTok"></a> <a href="#"><img
						src="zalo.png" alt="Zalo"></a>
				</div>
				<h4>Website thành viên</h4>
				<ul>
					<li><a href="#">dienmayxanh.com</a></li>
					<li><a href="#">thegioididong.com</a></li>
					<li><a href="#">bachhoaxanh.com</a></li>
				</ul>
			</div>
		</div>
		<div class="footer-bottom">
			<p>© 2024 Công ty TNHH Thương Mại và Dịch Vụ Kỹ Thuật ĐIỆU PHÚC.
				GPDKKD: 0316172372 cấp tại Sở KH & ĐT TP. HCM. Địa chỉ văn phòng:
				350-352 Võ Văn Kiệt, Phường Cô Giang, Quận 1, Thành phố Hồ Chí Minh,
				Việt Nam. Điện thoại: 028.7108.9666.</p>
		</div>
	</footer>
