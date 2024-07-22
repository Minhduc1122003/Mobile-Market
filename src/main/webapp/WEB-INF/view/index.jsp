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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet" href="/css/index3.css" />


</head>
<body>
	<%@include file="common/menu.jsp"%>

	<main class="container my-4" style="margin-top:80px !important;">
		<div class="row">
			<div class="col-md-10">
				<div id="slideshow" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#slideshow" data-slide-to="0" class="active"></li>
						<li data-target="#slideshow" data-slide-to="1"></li>
						<li data-target="#slideshow" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/photo/slide1.webp" alt="Slide 1" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="/photo/slide2.webp" alt="Slide 2" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="/photo/slide3.webp" alt="Slide 3" class="d-block w-100">
						</div>
					</div>
					<a class="carousel-control-prev" href="#slideshow"
						data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#slideshow"
						data-slide="next"> <span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
			<div class="col-md-2">
				<div class="row">
					<div class="col-12 mb-4">
						<img src="/photo/item1.webp" alt="Item 1" class="img-fluid">
					</div>
					<div class="col-12 mb-4">
						<img src="/photo/item2.webp" alt="Item 2" class="img-fluid">
					</div>
					<div class="col-12 mb-4">
						<img src="/photo/item3.webp" alt="Item 3" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
	</main>







	<div class="container">
		<h2 style="color: red;">Điện thoại nổi bật nhất</h2>
		<br>
	</div>
    <div class="container">
    	<c:forEach var="product" items="${product}">
            <div class="product-card">
                    <a href="/layout/chitietsanpham?id=${product.id}">
            
                <div class="discount">Giảm ${product.sale}%</div>
                <div class="installment">Trả góp 0%</div>
                <img src="/photo/iphone-13.webp" alt="iPhone 13 128GB">
                <div class="product-name">${product.name}</div>
                <div class="price">${product.priceNew}</div>
                <div class="original-price">${product.priceOld}</div>
                <div class="installment-info">Chương trình đổi mới</div>
                <div class="rating">★★★★★</div>
                            </a>
                
            </div>
            </c:forEach>
            
    </div>





	<!-- 	</div> -->
	<%@include file="common/footer.jsp"%>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>