<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container" style="margin-top: 15px;">
	<img alt="" class="w-100" 
		src="/images/akinaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-01.png">
</div>
<div class="container wow bounceInUp">
	<div class="row ">
		<div class="col-3 mt-3">
			<article>
				<div class="list-group borderless">
					<div class="">
						<h5>Loại</h5>
						<ul class="list-group borderless">
							<c:forEach var="category" items="${categories}">
								<li class="list-group-item"><input
									name="category-selection" class="form-check-input me-1"
									type="checkbox" value="${category.categoryID}"
									id="firstCheckbox"> <label class="form-check-label"
									for="firstCheckbox">${category.name}</label>
							</c:forEach>
						</ul>
						<hr>
					</div>
					<div class="">
						<h5>Thuộc tính</h5>
						<div class="list-group-item p-1">
							<div class="btn-group w-10 borderless list-group-item-action">
								<button class="btn w-100 text-start" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseExample2"
									aria-expanded="false" aria-controls="collapseExample2">
									Kiểu</button>
								<button type="button"
									class="btn dropdown-toggle dropdown-toggle-split"
									data-bs-toggle="collapse" data-bs-target="#collapseExample2"
									aria-expanded="false" aria-controls="collapseExample2">
									<span class="visually-hidden">Toggle Dropdown</span>
								</button>
							</div>
							<div class="collapse" id="collapseExample2">

								<ul class="p-0">
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="cơ" id="firstCheckbox"> <label
										class="form-check-label" for="firstCheckbox">Bàn phím
											cơ</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="gaming" id="secondCheckbox"> <label
										class="form-check-label" for="secondCheckbox">Gaming</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="có dây" id="thirdCheckbox"> <label
										class="form-check-label" for="thirdCheckbox">Có dây</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="không dây" id="thirdCheckbox">
										<label class="form-check-label" for="thirdCheckbox">Không
											dây</label></li>
								</ul>

							</div>
						</div>
						<div class="list-group-item p-1">
							<div class="btn-group w-10 borderless list-group-item-action">
								<button class="btn w-100 text-start" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseExample7"
									aria-expanded="false" aria-controls="collapseExample7">
									Màu sắc</button>
								<button type="button"
									class="btn dropdown-toggle dropdown-toggle-split"
									data-bs-toggle="collapse" data-bs-target="#collapseExample7"
									aria-expanded="false" aria-controls="collapseExample7">
									<span class="visually-hidden">Toggle Dropdown</span>
								</button>
							</div>
							<div class="collapse" id="collapseExample7">

								<ul class="p-0">
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="đỏ" id="firstCheckbox"> <label
										class="form-check-label" for="firstCheckbox">Đỏ</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="cam" id="secondCheckbox"> <label
										class="form-check-label" for="secondCheckbox">Cam</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="vàng" id="thirdCheckbox"> <label
										class="form-check-label" for="thirdCheckbox">Vàng</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="xanh lá" id="thirdCheckbox"> <label
										class="form-check-label" for="thirdCheckbox">Xanh lá
											cây</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="xanh biển" id="thirdCheckbox">
										<label class="form-check-label" for="thirdCheckbox">Xanh
											nước biển</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="tím" id="thirdCheckbox"> <label
										class="form-check-label" for="thirdCheckbox">Tím</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="đen" id="thirdCheckbox"> <label
										class="form-check-label" for="thirdCheckbox">Đen</label></li>
									<li class="list-group-item"><input
										name="category-selection" class="form-check-input me-1"
										type="checkbox" value="trắng" id="thirdCheckbox"> <label
										class="form-check-label" for="thirdCheckbox">Trắng</label></li>
								</ul>

							</div>
						</div>
						<hr>
					</div>
					<div class="">
						<h5>Thương hiệu</h5>
						<ul class="list-group borderless">
							<c:forEach var="brand" items="${brands}">
								<li class="list-group-item"><input
									name="category-selection" class="form-check-input me-1"
									type="checkbox" value="" id="firstCheckbox"> <label
									class="form-check-label" for="firstCheckbox">${brand.name}</label>
							</c:forEach>
						</ul>
						<hr>
					</div>
					<div class="">
						<h5>Giá sản phẩm</h5>
						<ul class="list-group borderless">
							<li class="list-group-item"><input
								class="form-check-input me-1" type="checkbox" value=""
								id="firstCheckbox"> <label class="form-check-label"
								for="firstCheckbox">Giá dưới 100.000đ</label></li>
							<li class="list-group-item"><input
								class="form-check-input me-1" type="checkbox" value=""
								id="secondCheckbox"> <label class="form-check-label"
								for="secondCheckbox">100.000đ - 200.000đ</label></li>
							<li class="list-group-item"><input
								class="form-check-input me-1" type="checkbox" value=""
								id="thirdCheckbox"> <label class="form-check-label"
								for="thirdCheckbox">200.000đ - 300.000đ</label></li>
							<li class="list-group-item"><input
								class="form-check-input me-1" type="checkbox" value=""
								id="firstCheckbox"> <label class="form-check-label"
								for="firstCheckbox">300.000đ - 500.000đ</label></li>
							<li class="list-group-item"><input
								class="form-check-input me-1" type="checkbox" value=""
								id="secondCheckbox"> <label class="form-check-label"
								for="secondCheckbox">500.000đ - 1.000.000đ</label></li>
							<li class="list-group-item"><input
								class="form-check-input me-1" type="checkbox" value=""
								id="thirdCheckbox"> <label class="form-check-label"
								for="thirdCheckbox">Giá trên 1.000.000</label></li>
						</ul>
					</div>
				</div>
			</article>
		</div>
		<div class="col-9 mt-3">
			<aside>
				<div class="">
					<ul
						class="list-group list-group-horizontal borderless d-flex justify-content-center align-items-center">
						<li class="list-group-item borderless"><label
							class="form-check-label" for="firstRadio">Xếp theo:</label></li>
						<li class="list-group-item borderless"><input
							class="form-check-input me-1" type="radio" name="listGroupRadio"
							value="" id="firstRadio" checked> <label
							class="form-check-label" for="firstRadio">Tên A-Z</label></li>
						<li class="list-group-item borderless"><input
							class="form-check-input me-1" type="radio" name="listGroupRadio"
							value="" id="secondRadio"> <label
							class="form-check-label" for="secondRadio">Tên Z-A</label></li>
						<li class="list-group-item borderless"><input
							class="form-check-input me-1" type="radio" name="listGroupRadio"
							value="" id="thirdRadio"> <label class="form-check-label"
							for="thirdRadio">Hàng mới</label></li>
						<li class="list-group-item borderless"><input
							class="form-check-input me-1" type="radio" name="listGroupRadio"
							value="" id="fourthRadio"> <label
							class="form-check-label" for="fourthRadio">Giá thấp đến
								cao</label></li>
						<li class="list-group-item borderless"><input
							class="form-check-input me-1" type="radio" name="listGroupRadio"
							value="" id="fifthRadio"> <label class="form-check-label"
							for="fifthRadio">Giá cao xuống thấp</label></li>
					</ul>
				</div>



				<div class="mt-3">
					<div class="container wow bounceInUp">
						<div class="row borderless" id="product-list">
							<c:forEach var="p" items="${products.content}">
								<div class="col-lg-4 col-md-6 col-sm-12 col mt-2">
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
																value="${detail.price}" type="currency"
																currencySymbol="VND"></fmt:formatNumber></span>
													</c:if>
												</c:forEach>
											</div>
										</div>
										<form class="product-btn d-grid gap-2 col-10 mx-auto"
											action="/keyboardworld/addtocart/${p.productDetails[0].productDetailID}">
											<input type="hidden" name="quantity" id="quantity" value="1">
											<button type="submit" formmethod="post"
												class="btn btn-outline-dark fw-bold">Thêm vào giỏ
												hàng</button>
										</form>
									</div>
									<hr class="m-0 p-0">
								</div>
							</c:forEach>
							<div class="justify-content-center d-flex mt-3">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<li class="page-item"><a class="page-link"
											href="/keyboardworld/product?p=0" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
										</a></li>
										<c:forEach var="i" begin="0" end="${products.totalPages-1}">
											<li class="page-item ${products.number == i ? 'active' : ''}"><a
												class="page-link" href="/keyboardworld/product?p=${i}">${i + 1}</a></li>
										</c:forEach>
										<li class="page-item"><a class="page-link"
											href="/keyboardworld/product?p=${products.totalPages-1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</aside>
		</div>
	</div>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('input[name="category-selection"]').click(filterProducts);
	});

	function filterProducts() {
		var selectedCategories = [];
		$('input[name="category-selection"]:checked').each(function() {
			selectedCategories.push($(this).val());
		});
		if (selectedCategories.length === 0) {
			window.location.href = '${pageContext.request.contextPath}/keyboardworld/product';
		}
		$
				.ajax({
					type : 'POST',
					contentType : 'application/json',
					url : '${pageContext.request.contextPath}/keyboardworld/filterProducts',
					data : JSON.stringify(selectedCategories),
					success : function(data) {
						console.log(data); // Log dữ liệu phản hồi
						$('#product-list').html(data);
					},
					error : function(xhr, status, error) {
						console.error("Lỗi xảy ra: " + status + " " + error);
					}
				});
	}
	
</script>
