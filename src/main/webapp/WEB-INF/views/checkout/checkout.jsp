<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style>
html, body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.scrollable-content {
	max-height: 200px;
	overflow-y: auto;
	overflow-x: hidden;
}

.product-list {
	margin: 10px;
}

.product-item {
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}

.product-item:last-child {
	border-bottom: none;
}

.product-img {
	max-width: 100%;
}

.product-title {
	font-size: 1em;
	font-weight: bold;
}

.product-details {
	color: #888;
	font-size: 0.8em;
}

.product-price {
	color: #d9534f;
	font-size: 1em;
	text-align: right;
}

.product-rank {
	font-size: 1.5em;
	font-weight: bold;
	color: #0275d8;
}
</style>
<div class="container mt-2">
	<div class="row">
		<div class="col">
			<h5 class="fw-bold mt-2">Thông tin nhận hàng</h5>
			<div class="form-floating mb-2">
				<select class="form-select" id="category-selection"
					name="category-selection">
					<option value="" selected>Địa chỉ khác</option>
					<c:forEach var="address" items="${addresses}">
						<option value="${address.addRessID}">${address.addRessDetail}</option>
					</c:forEach>
				</select> <label for="selectedAddressId">Số địa chỉ</label>
			</div>
			<div class="form-floating mb-2">
				<input type="text" class="form-control" id="fullName"
					name="fullName" value="${userS.fullName}" placeholder="Họ và tên"
					required> <label for="name" style="color: gray">Họ
					và tên</label>
			</div>
			<div class="form-floating mb-2">
				<input type="tel" class="form-control" id="phone" name="phone"
					value="" placeholder="Số điện thoại" required> <label
					for="phone" style="color: gray">Số điện thoại</label>
			</div>
			<div class="form-floating mb-2">
				<select class="form-control" id="city" name="city" required>
					<option value="" selected>Chọn tỉnh thành</option>
				</select> <label for="city">Tỉnh thành</label>
			</div>
			<div class="form-floating mb-2">
				<select class="form-control" id="district" name="district" required>
					<option value="" selected>Chọn quận huyện</option>
				</select> <label for="district">Quận huyện</label>
			</div>
			<div class="form-floating mb-2">
				<select class="form-control" id="ward" name="ward" required>
					<option value="" selected>Chọn phường xã</option>
				</select> <label for="ward">Phường xã</label>
			</div>
			<div class="form-floating mb-2">
				<input type="text" class="form-control" id="detailaddress"
					name="detailaddress" placeholder="Địa chỉ cụ thể" required>
				<label for="detailaddress" style="color: gray">Địa chỉ cụ
					thể</label>
			</div>
			<div class="form-floating mb-2">
				<textarea class="form-control" id="note" name="note"
					placeholder="Ghi chú (tùy chọn)" style="height: 100px;"></textarea>
				<label for="note" style="color: gray">Ghi chú (tùy chọn)</label>
			</div>
		</div>
		<div class="col">
			<h5 class="fw-bold mt-2">Vận chuyển</h5>
			<div class="form-control">
				<div class="form-check mt-2">
					<input class="form-check-input" checked type="radio"
						name="vanchuyen" id="flexRadioDefault1"> <label
						class="form-check-label" for="flexRadioDefault1"> Giao
						hàng tận nhà </label>
				</div>
				<hr>
				<div class="form-check mb-2">
					<input class="form-check-input" type="radio" name="vanchuyen"
						id="flexRadioDefault2"> <label class="form-check-label"
						for="flexRadioDefault2"> Lấy tại cửa hàng </label>
				</div>
			</div>
			<h5 class="fw-bold mt-3">Thanh toán</h5>
			<div class="form-control mt-2">
				<div class="form-check mt-2">
					<input class="form-check-input" type="radio" name="thanhtoan"
						id="flexRadioDefault3" checked> <label
						class="form-check-label" for="flexRadioDefault3">Thanh
						toán khi nhận hàng</label>
				</div>
				<hr>
				<div class="form-check mb-2">
					<input class="form-check-input" type="radio" name="thanhtoan"
						id="flexRadioDefault4"> <label class="form-check-label"
						for="flexRadioDefault4">Chuyển khoảng</label>
				</div>
			</div>
		</div>
		<div class="col form-control">
			<h5 class="fw-bold">Đơn hàng (N sản phẩm)</h5>
			<hr>
			<div class="scrollable-content">
				<c:forEach var="c" items="${carts}">
					<div class="row product-item">
						<div class="col-3">
							<img src="/images/${c.productDetail.thumbNail}"
								class="product-img ms-3" alt="Product 1">
						</div>
						<div class="col-9">
							<div class="product-title me-2">${c.productDetail.product.category.name}
								${c.productDetail.product.name}
								${c.productDetail.product.property}</div>
							<div class="product-details me-2">Màu:
								${c.productDetail.color}</div>
							<div class="d-flex justify-content-between me-3">
								<em class="product-details">Số lượng: <b>${c.quantity}</b>
								</em>
								<div class="product-price">${c.productDetail.price * c.quantity}</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<hr>
			<div class="form-floating mb-2 mx-2">
				<select class="form-control" id="voucher" name="voucher" required>
					<option value="" selected>Chọn Mã giảm giá</option>
					<c:forEach var="v" items="${vouchers}">
						<option value="${v.voucherID}">${v.name}</option>
					</c:forEach>
				</select> <label for="voucher">Mã giảm giá</label>
			</div>
			<hr>
			<c:forEach var="c" items="${carts}">
				<c:set var="totalPrice"
					value="${totalPrice + c.productDetail.price * c.quantity}" />
			</c:forEach>
			<div class="d-flex justify-content-between">
				<h6 class="ms-2">Tạm tính</h6>
				<h6 class="">${totalPrice}</h6>
			</div>
			<div class="d-flex justify-content-between">
				<h6 class="ms-2">Phí vận chuyển</h6>
				<h6 class="">123</h6>
			</div>
			<hr>
			<div class="d-flex justify-content-between">
				<h6 class="fw-bold ms-2">Tổng cộng</h6>
				<h6 class="">123</h6>
			</div>
			<div class="d-flex justify-content-between">
				<button class="btn btn-outline-success p-2">Quay về giỏ
					hàng</button>
				<button class="btn btn-primary p-2">Đặt hàng</button>
			</div>

		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
        var citis = document.getElementById("city");
        var districts = document.getElementById("district");
        var wards = document.getElementById("ward");
        var Parameter = {
            url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
            method: "GET",
            responseType: "application/json",
        };
        var promise = axios(Parameter);
        promise.then(function (result) {
            renderCity(result.data);
        });

        function renderCity(data) {
            for (const x of data) {
                citis.options[citis.options.length] = new Option(x.Name, x.Id);
            }
            citis.onchange = function () {
                districts.length = 1;
                wards.length = 1;
                if (this.value != "") {
                    const result = data.filter(n => n.Id === this.value);
                    for (const k of result[0].Districts) {
                        districts.options[districts.options.length] = new Option(k.Name, k.Id);
                    }
                }
            };
            districts.onchange = function () {
                wards.length = 1;
                const dataCity = data.filter((n) => n.Id === citis.value);
                if (this.value != "") {
                    const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;
                    for (const w of dataWards) {
                        wards.options[wards.options.length] = new Option(w.Name, w.Id);
                    }
                }
            };
        }
        $('#category-selection').change(function() {
            var selectedValue = $(this).val();
            if (selectedValue) {
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json',
                    url: '${pageContext.request.contextPath}/keyboardworld/getaddress',
                    data: JSON.stringify({ id: selectedValue }), // Gửi đối tượng JSON
                    success: function(data) {
                        console.log(data); // Log dữ liệu phản hồi
                        $('#phone').val(data.phone); // Hiển thị dữ liệu nhận được lên input
                        
                        // Xóa tất cả các tùy chọn hiện có trong select city, district và ward
                        $('#city').empty();
                        $('#district').empty();
                        $('#ward').empty();
                        
                        // Thêm các tùy chọn cho select city
                        var cityOption = $('<option>').text(data.city).attr('value', data.city);
                        $('#city').append(cityOption);
                        
                        // Thêm các tùy chọn cho select district
                        var districtOption = $('<option>').text(data.district).attr('value', data.district);
                        $('#district').append(districtOption);
                        
                        // Thêm các tùy chọn cho select ward
                        var wardOption = $('<option>').text(data.ward).attr('value', data.ward);
                        $('#ward').append(wardOption);
                        
                        // Đặt giá trị cho detail address
                        $('#detailaddress').val(data.addRessDetail);
                    },
                    error: function(xhr, status, error) {
                        console.error("Lỗi xảy ra: " + status + " " + error);
                    }
                });
            } else {
            	window.location.href = window.location.href;
            }
        });


        
        
    </script>


