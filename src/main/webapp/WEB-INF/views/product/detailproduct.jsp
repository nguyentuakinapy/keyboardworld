<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
	<div class="row mt-5">
		<div class="col-xs-12 col-sm-12 col-lg-6 col-md-6">
			<c:forEach var="pd" items="${productDetails}" varStatus="status">
				<c:if test="${status.first}">
					<img id="product-image" src="/images/${pd.thumbNail}" width="100%">
				</c:if>
			</c:forEach>
		</div>
		<div class="col-xs-12 col-sm-12 col-lg-6 col-md-6">
			<c:set var="categoryUpper"
				value="${product.category.name.toUpperCase()}" />
			<c:set var="nameUpper" value="${product.name.toUpperCase()}" />
			<c:set var="propertyUpper" value="${product.property.toUpperCase()}" />
			<h1 class="product-title">
				<c:out value="${categoryUpper}" />
				<c:out value="${nameUpper}" />
				<c:out value="${propertyUpper}" />
			</h1>
			<p>
				Màu: <i class="fw-bold" id="product-name"> <c:forEach
						varStatus="status" var="detailcolor"
						items="${product.productDetails}">
						<c:if test="${status.first}">
							${detailcolor.color}
						</c:if>
					</c:forEach>
				</i>
			</p>
			<p class="text-uppercase fw-bold">
				Thương hiệu: <b class="text-danger">${product.brand.name}</b>
			</p>
			<p class="price product-price" id="product-price">
				<c:forEach var="detail" items="${product.productDetails}"
					varStatus="status">
					<c:if test="${status.first}"> 
						<fmt:formatNumber value="${detail.price}"></fmt:formatNumber> ₫
					</c:if>
				</c:forEach>
			</p>
			<p>
				<b>Tình trạng: </b> <a class="text-danger text-decoration-none">Hàng
					Đặt Trước</a>
			</p>
			<div class="row align-items-center mb-2">
				<div class="col-auto">
					<label class="col-form-label">Màu sắc:</label>
				</div>
				<div class="col-auto">
					<div class="d-flex flex-wrap">
						<c:forEach var="pd" items="${productDetails}" varStatus="status">
							<c:if test="${status.first}">
								<div class="color-button active" id="${pd.thumbNail}"
									data-image="/images/${pd.thumbNail}" data-price="${pd.price}"
									data-idproduct="${pd.productDetailID}" data-name="${pd.color}">
									<img src="/images/${pd.thumbNail}" alt="A-Silver">${pd.color}
								</div>
							</c:if>
							<c:if test="${!status.first}">
								<div class="color-button" id="${pd.thumbNail}"
									data-image="/images/${pd.thumbNail}" data-price="${pd.price}"
									data-idproduct="${pd.productDetailID}" data-name="${pd.color}">
									<img src="/images/${pd.thumbNail}" alt="A-Silver">${pd.color}
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row align-items-center mb-3">
				<div class="col-auto">
					<label class="col-form-label">Số lượng:</label>
				</div>
				<div class="col-auto">
					<div class="quantity-group form-control d-flex align-items-center">
						<button class="btn-cts" type="button"
							id="button-decrement-detailproduct">-</button>
						<input type="text" class="qty" id="quantity-input-detailproduct"
							value="1" readonly>
						<button class="btn-cts" type="button"
							id="button-increment-detailproduct">+</button>
					</div>
				</div>
			</div>
			<form id="addtocart-form"
				action="/keyboardworld/addtocart/${productDetails[0].productDetailID}"
				method="POST">
				<input type="hidden" name="quantity" id="quantity" value="1">
				<button type="submit" class="btn btn-dark me-2 btn-add-to-card"
					id="btnAddToCart">
					Thêm vào giỏ hàng <i class="bi bi-bag-fill"></i>
				</button>
			</form>

			<div class="modal fade" id="confirmAddtoCartModal" tabindex="-1"
				aria-labelledby="confirmAddtoCartModal" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="confirmAddtoCartModalLabel">THÔNG
								BÁO</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">THÊM VÀO GIỎ HÀNG THÀNH CÔNG!</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Đóng</button>
						</div>
					</div>
				</div>
			</div>
			<div class="module_service">
				<i class="bi bi-shield-check fs-1 me-3"></i> <a href="#"
					class="text-decoration-none text-dark">Chính sách bảo hành</a>
			</div>
			<div class="module_service">
				<i class="bi bi-award fs-1 me-3"></i> <a
					class="text-decoration-none text-dark">Cam kết <b>100%
						chính hãng</b></a>
			</div>
		</div>
	</div>
	<ul class="nav nav-tabs mt-4" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="description-tab"
				data-bs-toggle="tab" data-bs-target="#description" type="button"
				role="tab" aria-controls="description" aria-selected="true">THÔNG
				TIN SẢN PHẨM</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
				data-bs-target="#reviews" type="button" role="tab"
				aria-controls="reviews" aria-selected="false">NHẬN XÉT SẢN
				PHẨM</button>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active p-3" id="description"
			role="tabpanel" aria-labelledby="description-tab">
			<ul class="list-unstyled">
				<li><strong>Tên:</strong> Womier SK65</li>
				<li><strong>Số lượng phím:</strong> 66 keys + 1 knob</li>
				<li><strong>Màu:</strong> E-coating Blue/Beige/Anodized
					Silver/Anodized Black</li>
				<li><strong>Keycap:</strong> Cherry profile double-shot PBT
					keycaps</li>
				<li><strong>Khung:</strong> CNC machined 6063 aluminum</li>
				<li><strong>Kết nối:</strong> Wired/2.4GHz Wireless/Bluetooth</li>
				<li><strong>Switches:</strong> Womier POM pre-lubed linear
					switches</li>
				<li><strong>Backlight LEDs:</strong> Mạch xuôi</li>
				<li><strong>PCB:</strong> RGB, hotswap 5 pin</li>
				<li><strong>Mounting Style:</strong> Gasket mounted</li>
				<li><strong>Dung lượng pin:</strong> 3750 mAh</li>
				<li><strong>Interface:</strong> USB Type-C</li>
				<li><strong>Hệ điều hành:</strong> Windows/macOS/Linux</li>
				<li><strong>Khối lượng:</strong> 1570g</li>
				<li><strong>Kích thước:</strong> 316*113*42 mm</li>
			</ul>
			<h6>Cách thức đặt hàng:</h6>
			<ol>
				<li>Lựa chọn màu sắc và thêm vào giỏ hàng</li>
				<li>Bấm "Thanh toán đơn hàng" và điền thông tin nhận hàng</li>
				<li>Chọn phương thức thanh toán COD</li>
			</ol>
		</div>
		<div class="tab-pane fade p-3" id="reviews" role="tabpanel"
			aria-labelledby="reviews-tab">
			<div class="alert alert-light text-center" role="alert">Hiện
				tại sản phẩm chưa có đánh giá nào, bạn hãy trở thành người đầu tiên
				đánh giá cho sản phẩm này</div>
			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-success" data-bs-toggle="modal"
					data-bs-target="#exampleModal">Gửi đánh giá của bạn</button>
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Đánh
									giá sản phẩm</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="mb-3">
									<input type="text" placeholder="Nhập họ và tên"
										class="form-control">
								</div>
								<div class="mb-3 row">
									<div class="col">
										<input type="email" placeholder="Nhập địa chỉ email"
											class="form-control">
									</div>
									<div class="col">
										<input type="tel" placeholder="Nhập số điện thoại"
											maxlength="15" class="form-control">
									</div>
								</div>
								<div>
									<textarea class="form-control" id="exampleFormControlTextarea1"
										rows="5"
										placeholder="Nhập nội dung đánh giá của bạn về sản phẩm này"></textarea>
								</div>
								<div class="mt-0">
									<input class="form-control" type="file" id="formFileMultiple"
										multiple>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success">Gửi đánh
									giá</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
document.querySelectorAll('.color-button').forEach(button => {
    button.addEventListener('click', () => {
        document.querySelectorAll('.color-button').forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');
        showLoading();
		setTimeout(function() {
			hideLoading();
		}, 200);
        const newImage = button.getAttribute('data-image');
        const newPrice = parseFloat(button.getAttribute('data-price'));
        const newName = button.getAttribute('data-name');
        const productDetailID = button.getAttribute('data-idproduct');
        document.getElementById('product-image').src = newImage;
        document.getElementById('product-price').innerText = newPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
        document.getElementById('product-name').innerText = newName;

        // Update form action
        document.getElementById('addtocart-form').action = '/keyboardworld/addtocart/' + productDetailID;
    });
});

document.getElementById('button-decrement-detailproduct').addEventListener('click', function() {
    var quantityInput = document.getElementById('quantity-input-detailproduct');
    var currentValue = parseInt(quantityInput.value);
    if (currentValue > 1) {
        quantityInput.value = currentValue - 1;
        document.getElementById('quantity').value = quantityInput.value; // Update hidden input
    }
});

document.getElementById('button-increment-detailproduct').addEventListener('click', function() {
    var quantityInput = document.getElementById('quantity-input-detailproduct');
    var currentValue = parseInt(quantityInput.value);
    quantityInput.value = currentValue + 1;
    document.getElementById('quantity').value = quantityInput.value; // Update hidden input
});

document.getElementById("btnAddToCart").addEventListener("click", function (event) {
	$.ajax({
	    type: 'POST',
	    contentType: 'application/json',
	    url: '${pageContext.request.contextPath}/keyboardworld/checkUser',
	    dataType: 'json',
	    data: JSON.stringify({}), // Dữ liệu gửi đi, trong trường hợp này không cần gửi bất kỳ dữ liệu nào
	    success: function(response) {
	        console.log("Phản hồi từ máy chủ:", response);
	        if (response === true) {
	            console.log("Người dùng tồn tại.");
	        } else {
	            // Xử lý khi bên máy chủ trả về false
	            console.log("Người dùng không tồn tại.");
	            window.location.href = '/keyboardworld/login';
	        }
	    },
	    error: function(xhr, status, error) {
	        console.error("Lỗi xảy ra: " + status + " " + error);
	    }
	});


	
    var form = document.getElementById("addtocart-form");
    var quantity = document.getElementById('quantity');
    $('#confirmAddtoCartModal').modal('show'); // Hiển thị modal
    event.preventDefault(); // Ngăn chặn hành vi mặc định của sự kiện click

    $('#confirmAddtoCartModal').on('hidden.bs.modal', function (e) {
       window.location.href = form.action + '?quantity=' +quantity.value;
    });
});

  
</script>
