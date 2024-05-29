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
		<h2 class="text-center my-5" style="letter-spacing: 2px;">SẢN
			PHẨM MỚI</h2>
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
										<span class="price-new fs-5"><fmt:formatNumber
												value="${detail.price}" type="currency" currencySymbol="VND"></fmt:formatNumber></span>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="product-btn d-grid gap-2 col-10 mx-auto">
							<button type="button" data-bs-toggle="modal"
								data-bs-target="#exampleModal"
								class="btn btn-outline-dark fw-bold">Thêm vào giỏ hàng</button>
						</div>
					</div>
					<hr class="m-0 p-0">
				</div>
			</c:forEach>
			<hr>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Thêm vào giỏ hàng</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
		</div>

		<div class="text-center mt-4">
			<button type="submit" class="btn-product-all">Xem tất cả.
				Sản phẩm mới!</button>
		</div>
	</div>
	<!-- BÀN PHÍM CƠ CUSTOM -->
	<div class="container wow fadeIn">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">SẢN
			PHẨM MỚI</h2>
		<div class="row borderless product-items">
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
		</div>

		<div class="text-center mt-4">
			<button type="submit" class="btn-product-all">Xem tất cả.
				Sản phẩm mới!</button>
		</div>
	</div>
	<!-- BỘ SƯU TẬP KEYCAP CHERRY -->
	<div class="container wow fadeIn">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">SẢN
			PHẨM MỚI</h2>
		<div class="row borderless product-items">
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
		</div>

		<div class="text-center mt-4">
			<button type="submit" class="btn-product-all">Xem tất cả.
				Sản phẩm mới!</button>
		</div>
	</div>
	<!--  -->
	<div class="">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">BỘ SƯU
			TẬP KEYCAP CHERRY</h2>
		<img src="keyboard.jpg" style="width: 100%; height: 400px;" alt="">
	</div>
	<!-- SWITCH CHO BÀN PHÍM CƠ -->
	<div class="container wow fadeIn">
		<h2 class="text-center my-5" style="letter-spacing: 2px;">SẢN
			PHẨM MỚI</h2>
		<div class="row borderless product-items">
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col">
				<div class="card card-product border-0 overflow-hidden">
					<div class="image-container">
						<a href="/keyboardworld/detailproduct"> <img
							class="imagesProduct-hover"
							src="https://th.bing.com/th/id/R.ce0e66ee5062df77c55f5fbf465f4a63?rik=GyTrFFwqZKBIpQ&riu=http%3a%2f%2fapi.thinkview.vn%2fuploads%2feditor%2fcusmtom-phim-co-thinkview-01.jpg&ehk=iozk209jkzL9xdX1f2t%2f0cgUnIbV%2bVFM8TS1eN5CoFs%3d&risl=&pid=ImgRaw&r=0"
							alt=""> <img class="imagesProduct"
							src="https://th.bing.com/th/id/R.95abef24f8160cb5a812d7a18f030de2?rik=UYB%2bD3moHCtEDQ&pid=ImgRaw&r=0"
							alt="">
						</a>
					</div>
					<div class="card-body text-center product-content">
						<span class="product-category fs-6 text-secondary">Ban phim</span>
						<h3 class="product-name fs-4 fw-bolder">Ban phim akko</h3>
						<div class="price">
							<span class="price-new fs-5">1.000.000VND</span>
							<!-- <del class="price-old fs-5">1.500.000VND</del> -->
						</div>
					</div>
					<div class="product-btn d-grid gap-2 col-10 mx-auto">
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							class="btn btn-outline-dark fw-bold">Add to cart</button>
					</div>
				</div>
				<hr class="m-0 p-0">
			</div>
		</div>

		<div class="text-center mt-4">
			<button type="submit" class="btn-product-all">Xem tất cả.
				Sản phẩm mới!</button>
		</div>
	</div>
</main>