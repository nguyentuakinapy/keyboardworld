<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<main class="banner container main-area" style="margin-top: 15px;">
	<div id="carouselExampleDark" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="2000">
				<img src="/images/fptbanner1.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img src="/images/fptbanner2.png" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container wow fadeIn">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">Sản
			phẩm mới</h2>
		<div class="row borderless product-items">
			<c:forEach var="p" items="${products}">
				<div class="col-lg-3 col-md-6 col-sm-12 col">
					<div class="card card-product border-0 overflow-hidden">
						<div class="image-container">
							<a href="/keyboardworld/detailproduct/${p.productID}"> <c:forEach
									var="detail" items="${p.productDetails}" varStatus="status">
									<c:if test="${status.first}">
										<img class="imagesProduct-hover"
											src="/images/${detail.thumbNail}" alt="">
									</c:if>
								</c:forEach> <img class="imagesProduct"
								src="/images/${p.galleries[0].thumbnail}" alt="">
							</a>
						</div>
						<div class="card-body text-center product-content">
							<span class="product-category fs-6 text-secondary">${p.category.name}</span>
							<h6 class="product-name fw-bolder text-nowrap text-truncate">${p.name}
								${p.property}</h6>
							<div class="price">
								<c:forEach var="detail" items="${p.productDetails}"
									varStatus="status">
									<c:if test="${status.first}">
										<span class="price-new fs-5"> <fmt:formatNumber
												value="${detail.price}"></fmt:formatNumber> ₫
										</span>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<form class="product-btn d-grid gap-2 col-10 mx-auto">
							<input type="hidden" name="quantity" id="quantity" value="1">
							<button type="submit"
								formaction="/keyboardworld/addtocart/${p.productDetails[0].productDetailID}"
								formmethod="post" class="btn btn-outline-dark fw-bold">Thêm
								vào giỏ hàng</button>
						</form>
					</div>
					<hr class="m-0 p-0">
				</div>
			</c:forEach>
		</div>

		<form class="text-center mt-4">
			<button type="submit" formaction="/keyboardworld/product"
				formmethod="post" class="btn-product-all">Xem tất cả. Sản
				phẩm mới!</button>
		</form>
	</div>

	<div class="container wow fadeIn">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">Bàn
			phím</h2>
		<div class="row borderless product-items">
			<c:forEach var="p" items="${keyboards}">
				<div class="col-lg-3 col-md-6 col-sm-12 col">
					<div class="card card-product border-0 overflow-hidden">
						<div class="image-container">
							<a href="/keyboardworld/detailproduct/${p.productID}"> <c:forEach
									var="detail" items="${p.productDetails}" varStatus="status">
									<c:if test="${status.first}">
										<img class="imagesProduct-hover"
											src="/images/${detail.thumbNail}" alt="">
									</c:if>
								</c:forEach> <img class="imagesProduct"
								src="/images/${p.galleries[0].thumbnail}" alt="">
							</a>
						</div>
						<div class="card-body text-center product-content">
							<span class="product-category fs-6 text-secondary">${p.category.name}</span>
							<h6 class="product-name fw-bolder text-nowrap text-truncate">${p.name}
								${p.property}</h6>
							<div class="price">
								<c:forEach var="detail" items="${p.productDetails}"
									varStatus="status">
									<c:if test="${status.first}">
										<span class="price-new fs-5"> <fmt:formatNumber
												value="${detail.price}"></fmt:formatNumber> ₫
										</span>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<form class="product-btn d-grid gap-2 col-10 mx-auto">
							<input type="hidden" name="quantity" id="quantity" value="1">
							<button type="submit"
								formaction="/keyboardworld/addtocart/${p.productDetails[0].productDetailID}"
								formmethod="post" class="btn btn-outline-dark fw-bold">Thêm
								vào giỏ hàng</button>
						</form>
					</div>
					<hr class="m-0 p-0">
				</div>
			</c:forEach>
		</div>

		<form class="text-center mt-4">
			<button type="submit" formaction="/keyboardworld/product/keyboard"
				formmethod="post" class="btn-product-all">Xem tất cả. Bàn
				phim!</button>
		</form>
	</div>

	<div class="container wow fadeIn">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">Chuột</h2>
		<div class="row borderless product-items">
			<c:forEach var="p" items="${mouses}">
				<div class="col-lg-3 col-md-6 col-sm-12 col">
					<div class="card card-product border-0 overflow-hidden">
						<div class="image-container">
							<a href="/keyboardworld/detailproduct/${p.productID}"> <c:forEach
									var="detail" items="${p.productDetails}" varStatus="status">
									<c:if test="${status.first}">
										<img class="imagesProduct-hover"
											src="/images/${detail.thumbNail}" alt="">
									</c:if>
								</c:forEach> <img class="imagesProduct"
								src="/images/${p.galleries[0].thumbnail}" alt="">
							</a>
						</div>
						<div class="card-body text-center product-content">
							<span class="product-category fs-6 text-secondary">${p.category.name}</span>
							<h6 class="product-name fw-bolder text-nowrap text-truncate">${p.name}
								${p.property}</h6>
							<div class="price">
								<c:forEach var="detail" items="${p.productDetails}"
									varStatus="status">
									<c:if test="${status.first}">
										<span class="price-new fs-5"> <fmt:formatNumber
												value="${detail.price}"></fmt:formatNumber> ₫
										</span>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<form class="product-btn d-grid gap-2 col-10 mx-auto">
							<input type="hidden" name="quantity" id="quantity" value="1">
							<button type="submit"
								formaction="/keyboardworld/addtocart/${p.productDetails[0].productDetailID}"
								formmethod="post" class="btn btn-outline-dark fw-bold">Thêm
								vào giỏ hàng</button>
						</form>
					</div>
					<hr class="m-0 p-0">
				</div>
			</c:forEach>
		</div>

		<form class="text-center mt-4">
			<button type="submit" formaction="/keyboardworld/product/mouse"
				formmethod="post" class="btn-product-all">Xem tất cả.
				Chuột!</button>
		</form>
	</div>

	<div class="container wow fadeIn">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">Keycap</h2>
		<div class="row borderless product-items">
			<c:forEach var="p" items="${keycap}">
				<div class="col-lg-3 col-md-6 col-sm-12 col">
					<div class="card card-product border-0 overflow-hidden">
						<div class="image-container">
							<a href="/keyboardworld/detailproduct/${p.productID}"> <c:forEach
									var="detail" items="${p.productDetails}" varStatus="status">
									<c:if test="${status.first}">
										<img class="imagesProduct-hover"
											src="/images/${detail.thumbNail}" alt="">
									</c:if>
								</c:forEach> <img class="imagesProduct"
								src="/images/${p.galleries[0].thumbnail}" alt="">
							</a>
						</div>
						<div class="card-body text-center product-content">
							<span class="product-category fs-6 text-secondary">${p.category.name}</span>
							<h6 class="product-name fw-bolder text-nowrap text-truncate">${p.name}
								${p.property}</h6>
							<div class="price">
								<c:forEach var="detail" items="${p.productDetails}"
									varStatus="status">
									<c:if test="${status.first}">
										<span class="price-new fs-5"> <fmt:formatNumber
												value="${detail.price}"></fmt:formatNumber> ₫
										</span>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<form class="product-btn d-grid gap-2 col-10 mx-auto">
							<input type="hidden" name="quantity" id="quantity" value="1">
							<button type="submit"
								formaction="/keyboardworld/addtocart/${p.productDetails[0].productDetailID}"
								formmethod="post" class="btn btn-outline-dark fw-bold">Thêm
								vào giỏ hàng</button>
						</form>
					</div>
					<hr class="m-0 p-0">
				</div>
			</c:forEach>
		</div>
	</div>

	<form class="text-center mt-4">
		<button type="submit" formaction="/keyboardworld/product/keycap"
			formmethod="post" class="btn-product-all">Xem tất cả.
			Keycap!</button>
	</form>

	<div class="container wow fadeIn">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">Tai
			nghe</h2>
		<div class="row borderless product-items">
			<c:forEach var="p" items="${headphone}">
				<div class="col-lg-3 col-md-6 col-sm-12 col">
					<div class="card card-product border-0 overflow-hidden">
						<div class="image-container">
							<a href="/keyboardworld/detailproduct/${p.productID}"> <c:forEach
									var="detail" items="${p.productDetails}" varStatus="status">
									<c:if test="${status.first}">
										<img class="imagesProduct-hover"
											src="/images/${detail.thumbNail}" alt="">
									</c:if>
								</c:forEach> <img class="imagesProduct"
								src="/images/${p.galleries[0].thumbnail}" alt="">
							</a>
						</div>
						<div class="card-body text-center product-content">
							<span class="product-category fs-6 text-secondary">${p.category.name}</span>
							<h6 class="product-name fw-bolder text-nowrap text-truncate">${p.name}
								${p.property}</h6>
							<div class="price">
								<c:forEach var="detail" items="${p.productDetails}"
									varStatus="status">
									<c:if test="${status.first}">
										<span class="price-new fs-5"> <fmt:formatNumber
												value="${detail.price}"></fmt:formatNumber> ₫
										</span>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<form class="product-btn d-grid gap-2 col-10 mx-auto">
							<input type="hidden" name="quantity" id="quantity" value="1">
							<button type="submit"
								formaction="/keyboardworld/addtocart/${p.productDetails[0].productDetailID}"
								formmethod="post" class="btn btn-outline-dark fw-bold">Thêm
								vào giỏ hàng</button>
						</form>
					</div>
					<hr class="m-0 p-0">
				</div>
			</c:forEach>
		</div>
	</div>
	<form class="text-center mt-4">
		<button type="submit" formaction="/keyboardworld/product/headphone"
			formmethod="post" class="btn-product-all">Xem tất cả. Tai
			nghe!</button>
	</form>
</main>