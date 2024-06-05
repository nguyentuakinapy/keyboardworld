<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="header-area" style="position: sticky; z-index: 1001">
	<!-- Search -->
	<div class="collapse container" id="collapseExampleSearch">
		<form class="d-flex m-auto search"
			action="/keyboardworld/searchproduct" role="search" method="post">
			<input class="form-control me-2 mt-2" name="keywords" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success mt-2" type="submit">Search</button>
		</form>
	</div>
	<!-- Header -->
	<header class="navbar head-shadow pb-0">
		<div class="container row m-auto">
			<!-- Hotline -->
			<div class="contact hotline col text-center" style="font-size: 14px;">
				<span>HOTLINE TƯ VẤN: 0369161095</span>
			</div>
			<!-- Logo -->
			<div class="brand col mb-1">
				<a href="/keyboardworld" class="nav-link loadLink"> <img alt=""
					style="width: 140px" src="/images/AkinaKB.png">
				</a>
			</div>
			<!-- Account Cart Reponsive -->
			<div class="contac col list-account text-start">
				<a href="" class="nav-link" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasTop" aria-controls="offcanvasTop"><i
					class="bi bi-person-lines-fill" style="font-size: 35px;"></i></a>
			</div>
			<div class="offcanvas offcanvas-start" style="width: 250px;"
				tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasTopLabel">ACCOUNT</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="navbar-menu">
					<ul class="menu accout-cart mx-auto mb-0">
						<li class="list-unstyled p-1 d-flex"><a
							class="nav-link hvlink" data-bs-toggle="collapse"
							href="#account-cart" role="button" aria-expanded="false"
							aria-controls="account-cart">TÀI KHOẢN<i
								class="bi bi-chevron-down"></i></a></li>
						<div class="collapse" id="account-cart">
							<div class=" rounded-top">
								<a href="/keyboardworld/login"
									class="nav-link hv-nav-items m-2 ms-4">Đăng nhập</a>
							</div>
							<div class="">
								<a href="/keyboardworld/register"
									class="nav-link hv-nav-items m-2 ms-4">Đăng ký</a>
							</div>
							<div class=" rounded-bottom">
								<a href="/keyboardworld" class="nav-link hv-nav-items m-2 ms-4">Quên
									mật khẩu</a>
							</div>
						</div>
						<li class="list-unstyled p-1 d-flex"><a
							class="nav-link hvlink" href="/keyboardworld/viewcart">GIỎ
								HÀNG <i class="bi bi-bag"></i> <span
								class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
									0 </span>
						</a></li>
						<li class="list-unstyled p-1 d-flex"><a
							href="#collapseExampleSearch" aria-expanded="false"
							aria-controls="collapseExample" class="nav-link ms-2 hvlink"
							data-bs-toggle="collapse"><i class="bi bi-search"></i></a></li>
					</ul>
				</div>
			</div>
			<!-- Logo Reponsive -->
			<div class="logoKeyboard col mb-1">
				<a href="/keyboardworld" class="nav-link"> <img alt=""
					style="width: 140px" src="/images/AkinaKB.png">
				</a>
			</div>
			<!-- Account Cart -->
			<div class="contact col acount-none navbar-menu"
				style="font-size: 14px;">
				<ul class="menu d-flex accout-cart mx-auto mb-0">
					<c:if test="${userS == null}">
						<li class="list-unstyled p-1"><a class="nav-link mx-2 hvlink loadLink"
							href="/keyboardworld/login">TÀI KHOẢN<i class="bi bi-chevron-down"></i></a>
							<div class="account-popup">
								<div class="border rounded-top">
									<a href="/keyboardworld/login"
										class="nav-link hv-nav-items m-2 ms-4 loadLink">Đăng nhập</a>
								</div>
								<div class="border">
									<a href="/keyboardworld/register"
										class="nav-link hv-nav-items m-2 ms-4 loadLink">Đăng ký</a>
								</div>
								<div class="border rounded-bottom">
									<a href="#" class="nav-link hv-nav-items m-2 ms-4 loadLink">Quên mật
										khẩu</a>
								</div>
							</div></li>
					</c:if>

					<c:if test="${userS != null}">
						<c:set var="fullnameUp" value="${userS.fullName.toUpperCase()}" />
						<li class="list-unstyled p-1"><a class="nav-link mx-2 hvlink loadLink"
							href="/keyboardworld/account">TÀI KHOẢN<i class="bi bi-chevron-down"></i></a>
							<div class="account-popup">
								<div class="border rounded-top">
									<a href="/keyboardworld/account"
										class="nav-link hv-nav-items m-2 ms-4 loadLink"><c:out
											value="${fullnameUp}" /></a>
								</div>
								<div class="border">
									<a href="/keyboardworld/logout"
										class="nav-link hv-nav-items m-2 ms-4 loadLink">Đăng xuất</a>
								</div>
								<c:if test="${userS.role.roleName == 'Admin'}">
									<div class="border">
										<a href="/keyboardworld/admin"
											class="nav-link hv-nav-items m-2 ms-4 loadLink">ADMIN</a>
									</div>
								</c:if>
							</div></li>
					</c:if>
					<li class="list-unstyled p-1"><a class="nav-link mx-2 hvlink loadLink" 
						href="/keyboardworld/viewcart">GIỎ HÀNG <i class="bi bi-bag"></i>
							<span
							class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								${listCart.size() } </span>
					</a>
						<div class="shop-cart">
							<div class="form-control">
								<div class="row">
									<div class="col-4">
										<img src="/images/keyboardDetail.jpg" class="w-100" alt="">
									</div>
									<div class="col-8">
										<h6 class="mt-2 fw-bold">Bàn phím cơ ABCXYZ</h6>
										<span>120.000 đ</span>
										<div class="d-flex align-items-center mt-2">
											<button class="btn-cart" type="button" id="button-decrement">-</button>
											<input type="text" class="qty-cart" id="quantity-input"
												value="1" readonly>
											<button class="btn-cart" type="button" id="button-increment">+</button>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-4">
										<img src="/images/keyboardDetail.jpg" class="w-100" alt="">
									</div>
									<div class="col-8">
										<h6 class="mt-2 fw-bold">Bàn phím cơ ABCXYZ</h6>
										<span>120.000 đ</span>
										<div class="d-flex align-items-center mt-2">
											<button class="btn-cart" type="button" id="button-decrement">-</button>
											<input type="text" class="qty-cart" id="quantity-input"
												value="1" readonly>
											<button class="btn-cart" type="button" id="button-increment">+</button>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-4">
										<img src="/images/keyboardDetail.jpg" class="w-100" alt="">
									</div>
									<div class="col-8">
										<h6 class="mt-2 fw-bold">Bàn phím cơ ABCXYZ</h6>
										<span>120.000 đ</span>
										<div class="d-flex align-items-center mt-2">
											<button class="btn-cart" type="button" id="button-decrement">-</button>
											<input type="text" class="qty-cart" id="quantity-input"
												value="1" readonly>
											<button class="btn-cart" type="button" id="button-increment">+</button>
										</div>
									</div>
								</div>
							</div>
							<hr class="p-0 m-0 my-2">
							<div class="row">
								<div class="col">
									<button class="btn btn-outline-success">Thanh toán</button>
								</div>
								<div class="col text-end">
									<a href="/keyboardworld/viewcart" class="btn btn-outline-dark">Giỏ
										hàng</a>
								</div>
							</div>
						</div></li>
					<li class="list-unstyled p-1"><a href="#collapseExampleSearch"
						aria-expanded="false" aria-controls="collapseExample"
						class="nav-link ms-2 hvlink" data-bs-toggle="collapse"><i
							class="bi bi-search"></i></a></li>
				</ul>
			</div>
			<!-- List Product Reponsive -->
			<div class="contac list-product col text-end">
				<a href="" class="nav-link" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i
					class="bi bi-list-ul" style="font-size: 35px;"></i></a>
			</div>
			<div class="offcanvas offcanvas-end scrollable" style="width: 250px;"
				tabindex="-1" id="offcanvasRight"
				aria-labelledby="offcanvasRightLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title fw-bold text-center"
						id="offcanvasRightLabel">DANH MỤC</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="navbar-menu">
					<ul class="menu">
						<li class="list-unstyled p-1 d-flex"><a href="/keyboardworld"
							class="nav-link hvlink nav-head">TRANG CHỦ</a></li>
						<li class="list-unstyled p-1 d-flex"><a
							data-bs-toggle="collapse" href="#keycap" role="button"
							aria-expanded="false" aria-controls="keycap"
							class="nav-link hvlink nav-head">KEYCAP BỘ <i
								class="bi bi-chevron-down"></i></a></li>
						<div class="collapse" id="keycap">
							<div class="rounded-top">
								<a href="#" class="nav-link hv-nav-items m-2 ms-4">Keycap
									Cherry</a>
							</div>
							<div class="">
								<a href="#" class="nav-link hv-nav-items m-2 ms-4">Keycap
									MOA</a>
							</div>
							<div class="">
								<a href="#" class="nav-link hv-nav-items m-2 ms-4">Keycap
									xuyên led</a>
							</div>
							<div class="">
								<a href="#" class="nav-link hv-nav-items m-2 ms-4">Keycap SA</a>
							</div>
							<div class="">
								<a href="#" class="nav-link hv-nav-items m-2 ms-4">Keycap
									XDA</a>
							</div>
							<div class=" rounded-bottom">
								<a href="#" class="nav-link hv-nav-items m-2 ms-4">Keycap
									OEM</a>
							</div>
						</div>
						<li class="list-unstyled p-1 d-flex"><a href="#"
							class="nav-link  hvlink nav-head">BÀN PHÍM CƠ</a></li>
						<li class="list-unstyled p-1 d-flex"><a href="#"
							class="nav-link  hvlink nav-head">TAI NGHE</a></li>
						<li class="list-unstyled p-1 d-flex"><a href="#"
							class="nav-link  hvlink nav-head">CHUỘT</a></li>
						<li class="list-unstyled p-1 d-flex"><a
							class="nav-link  hvlink nav-head" data-bs-toggle="collapse"
							href="#productListHiden" role="button" aria-expanded="false"
							aria-controls="productListHiden">SẢN PHẨM <i
								class="bi bi-chevron-down"></i></a></li>
						<div class="collapse" id="productListHiden">
							<div class="ms-3">
								<a href="" class="nav-link hv-nav-items">KEYCAP BỘ</a>
								<p class="" style="font-size: 14px; color: cadetblue;">
									Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
								</p>
							</div>
							<div class="ms-3">
								<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ</a>
								<p class="" style="font-size: 14px; color: cadetblue;">
									Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
								</p>
							</div>
							<div class="ms-3">
								<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ SILENT</a>
								<p class="" style="font-size: 14px; color: cadetblue;">
									Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
								</p>
							</div>
							<div class="ms-3">
								<a href="" class="nav-link hv-nav-items">KEYCAP BỘ</a>
								<p class="" style="font-size: 14px; color: cadetblue;">
									Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
								</p>
							</div>
							<div class="ms-3">
								<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ</a> <a
									href="" style="font-size: 14px; color: cadetblue;">Silent
									Plateau</a>
								<p class="" style="font-size: 14px; color: cadetblue;">
									Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
								</p>
							</div>
							<div class="ms-3">
								<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ SILENT</a>
								<p class="" style="font-size: 14px; color: cadetblue;">
									Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
								</p>
							</div>
						</div>
						<li class="list-unstyled p-1 d-flex"><a href="#"
							class="nav-link  hvlink nav-head">BÀI VIẾT</a></li>
						<li class="list-unstyled p-1 d-flex"><a href="#"
							class="nav-link  hvlink nav-head">VỀ KICAP <i
								class="bi bi-chevron-down"></i></a>
							<div class="kicap">asdasd</div></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- Duong ke thang -->
	<div class="hr-area">
		<hr class=" m-auto" style="width: 50%; margin: 0px;">
	</div>
	<!-- Nav -->
	<nav class="navbar nav-area navbar-menu"
		style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); font-size: 14px;">
		<ul class="menu d-flex mx-auto mb-0">
			<li class="list-unstyled p-1"><a href="/keyboardworld"
				class="nav-link mx-2 hvlink nav-head loadLink">TRANG CHỦ</a></li>
			<li class="list-unstyled p-1"><a href="#"
				class="nav-link mx-2 hvlink nav-head loadLink">KEYCAP BỘ <i
					class="bi bi-chevron-down"></i></a>
				<div class="category-keycap">
					<div class="border rounded-top">
						<a href="#" class="nav-link hv-nav-items m-2 ms-4 loadLink">Keycap
							Cherry</a>
					</div>
					<div class="border">
						<a href="#" class="nav-link hv-nav-items m-2 ms-4 loadLink">Keycap MOA</a>
					</div>
					<div class="border">
						<a href="#" class="nav-link hv-nav-items m-2 ms-4 loadLink">Keycap
							xuyên led</a>
					</div>
					<div class="border">
						<a href="#" class="nav-link hv-nav-items m-2 ms-4 loadLink">Keycap SA</a>
					</div>
					<div class="border">
						<a href="#" class="nav-link hv-nav-items m-2 ms-4 loadLink">Keycap XDA</a>
					</div>
					<div class="border rounded-bottom">
						<a href="#" class="nav-link hv-nav-items m-2 ms-4 loadLink">Keycap OEM</a>
					</div>
				</div></li>
			<li class="list-unstyled p-1"><a href="#"
				class="nav-link mx-2 hvlink nav-head loadLink">BÀN PHÍM CƠ</a></li>
			<li class="list-unstyled p-1"><a href="#"
				class="nav-link mx-2 hvlink nav-head loadLink">TAI NGHE</a></li>
			<li class="list-unstyled p-1"><a href="#"
				class="nav-link mx-2 hvlink nav-head loadLink">CHUỘT</a></li>
			<li class="list-unstyled p-1"><a href="/keyboardworld/product"
				class="nav-link mx-2 hvlink nav-head loadLink">SẢN PHẨM <i
					class="bi bi-chevron-down"></i></a>
				<div class="category-products p-4">
					<div class="row mt-3">
						<div class="col">
							<a href="" class="nav-link hv-nav-items">KEYCAP BỘ</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
						<div class="col">
							<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
						<div class="col">
							<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ SILENT</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
							<a href="" class="nav-link hv-nav-items">KEYCAP BỘ</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
						<div class="col">
							<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ</a> <a
								href="" style="font-size: 14px; color: cadetblue;">Silent
								Plateau</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
						<div class="col">
							<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ SILENT</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
							<a href="" class="nav-link hv-nav-items">KEYCAP BỘ</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
						<div class="col">
							<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
						<div class="col">
							<a href="" class="nav-link hv-nav-items">BÀN PHÍM CƠ SILENT</a>
							<p class="" style="font-size: 14px; color: cadetblue;">
								Silent Plateau <br> Japan Cloud <br> Keycap Yogurt
							</p>
						</div>
					</div>
				</div></li>
			<li class="list-unstyled p-1"><a href="#"
				class="nav-link mx-3 hvlink nav-head loadLink">BÀI VIẾT</a></li>
			<li class="list-unstyled p-1"><a href="#"
				class="nav-link mx-3 hvlink nav-head loadLink">VỀ KICAP <i
					class="bi bi-chevron-down"></i></a>
				<div class="kicap">asdasd</div></li>
		</ul>
	</nav>
</section>