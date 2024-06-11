<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
<form class="container mt-2">
	<div class="row">
		<div class="col">
			<h5 class="fw-bold mt-2">Thông tin nhận hàng</h5>
			<div class="form-floating mb-2">
				<select class="form-select" id="category-selection"
					name="category-selection">
					<option value="none" selected>Địa chỉ khác</option>
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
				<input type="text" class="form-control" id="phone" name="phone"
					placeholder="Số điện thoại" required> <label for="phone"
					style="color: gray">Số điện thoại</label>
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
		</div>
		<div class="col">
			<h5 class="fw-bold mt-2">Vận chuyển</h5>
			<div class="form-control" id="checkttgh"
				style="background-color: #A7FCA5;">Vui lòng nhập thông tin
				giao hàng!</div>
			<div class="form-control d-none" id="vanchuyen">
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
						for="flexRadioDefault4">Chuyển khoản</label>
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
								<div class="product-price">
									<fmt:formatNumber value="${c.productDetail.price * c.quantity}"></fmt:formatNumber>
									₫
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<hr>
			<c:forEach var="c" items="${carts}">
				<c:set var="totalPrice"
					value="${totalPrice + c.productDetail.price * c.quantity}" />
			</c:forEach>
			<div class="d-flex justify-content-between">
				<h6 class="ms-2">Tạm tính</h6>
				<h6 class="">
					<fmt:formatNumber value="${totalPrice}"></fmt:formatNumber>
					₫
				</h6>
				<input type="hidden" value="${totalPrice}" id="priceCart">
			</div>
			<div class="d-flex justify-content-between">
				<h6 class="ms-2">Mã giảm giá</h6>
				<h6>${voucher.voucherID != 0 ? voucher.name : 'Không có'}</h6>
				<input type="hidden" value="${voucher.percentDecrease}"
					id="percentDecrease">
			</div>
			<div class="d-flex justify-content-between d-none" id="pdt">
				<h6 class="ms-2">Phí vận chuyển</h6>
				<h6 class="" id="pricedistance">123</h6>
			</div>
			<hr>
			<div class="d-flex justify-content-between">
				<h6 class="fw-bold ms-2">Tổng cộng</h6>
				<c:set var="percentDecrease" value="${voucher.percentDecrease}" />
				<c:set var="discountAmount"
					value="${totalPrice * percentDecrease / 100}" />
				<c:set var="totalPriceAfterDiscount"
					value="${totalPrice - discountAmount}" />
				<h6 class="" id="totalPrice">
					<fmt:formatNumber value="${totalPriceAfterDiscount}"></fmt:formatNumber>
					₫
				</h6>
			</div>
			<div class="d-flex justify-content-between">
				<a class="btn btn-outline-success p-2"
					href="/keyboardworld/viewcart">Quay về giỏ hàng</a>
				<button formaction="/keyboardworld/newcheckout"
					class="btn btn-primary p-2">Đặt hàng</button>
			</div>
		</div>
	</div>
</form>
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
		        citis.options[citis.options.length] = new Option(x.Name, x.Name); // Sử dụng x.Name cho cả text và value
		    }
		    citis.onchange = function () {
		        districts.length = 1;
		        wards.length = 1;
		        if (this.value != "") {
		            const result = data.filter(n => n.Name === this.value); // So sánh với Name thay vì Id
		
		            for (const k of result[0].Districts) {
		                districts.options[districts.options.length] = new Option(k.Name, k.Name); // Sử dụng k.Name cho cả text và value
		            }
		        }
		    };
		    districts.onchange = function () {
		        wards.length = 1;
		        const dataCity = data.filter((n) => n.Name === citis.value); // So sánh với Name thay vì Id
		        if (this.value != "") {
		            const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards; // So sánh với Name thay vì Id
		
		            for (const w of dataWards) {
		                wards.options[wards.options.length] = new Option(w.Name, w.Name); // Sử dụng w.Name cho cả text và value
		            }
		        }
		    };
		}
		$(document).ready(function() {
		    $('#category-selection').change(function() {
		        var selectedValue = $(this).val();
		        sltv = selectedValue;
		        if (selectedValue === 'none') {
		            location.reload();
		        } else {
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
		                    var distance = data.distance;
		                    var priceCart = parseFloat($('#priceCart').val());

		                    var totalPrice;
		                    
		                    var percentDecrease = parseFloat($('#percentDecrease').val());
		                     
		                     var discountAmount = priceCart * percentDecrease / 100;
		                     var totalPriceAfterDiscount = priceCart - discountAmount;
		                     
		                     
		                    if (distance <= 30) {
		                        $('#pricedistance').text(formatVND(16000));
		                        totalPrice = totalPriceAfterDiscount + 16000;
		                    } else {
		                        $('#pricedistance').text(formatVND(80 * data.distance));
		                        totalPrice = totalPriceAfterDiscount + (80 * data.distance);
		                    }
		                    var pdt = document.getElementById('pdt');
		                     // Loại bỏ lớp 'd-none' từ phần tử pdt (nếu có)
		                     pdt.classList.remove('d-none');
		                     // Thêm lớp 'd-block' cho phần tử pdt
		                     pdt.classList.add('d-block');
						
		                     
		                     $('#phone').prop('readonly', true);
		                     $('#city').prop('readonly', true);
		                     $('#district').prop('readonly', true);
		                     $('#ward').prop('readonly', true);
		                     $('#detailaddress').prop('readonly', true);
		                     
		                     var vanchuyen = document.getElementById('vanchuyen');
		                     vanchuyen.classList.remove('d-none');
		                     vanchuyen.classList.add('d-block');
		                     
		                     var checkttgh = document.getElementById('checkttgh');
		                     checkttgh.classList.add('d-none');
		                     
		                    
		                  
		                    $('#totalPrice').text(formatVND(totalPrice));
		                },
		                error: function(xhr, status, error) {
		                    console.error("Lỗi xảy ra: " + status + " " + error);
		                }
		            });
		        }
		    });
		});

       
        
        function validateForm() {
            const city = document.getElementById('city').value;
            const district = document.getElementById('district').value;
            const ward = document.getElementById('ward').value;
            const detailaddress = document.getElementById('detailaddress').value;
            const phone = document.getElementById('phone').value;
            
            
            if (city && district && ward && detailaddress && phone) {
                showLoading();
                setTimeout(function() {
    				hideLoading();
    			}, 1000);
  
                var districtCity = district + ", " + city;
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json',
                    url: '${pageContext.request.contextPath}/keyboardworld/getdistance',
                    data: districtCity, 
                    success: function(data) {
                        console.log(data); 
                        var priceCart = parseFloat($('#priceCart').val());
                       
                        var price;
                        
                        var percentDecrease = parseFloat($('#percentDecrease').val());
	                     
	                     var discountAmount = priceCart * percentDecrease / 100;
	                     var totalPriceAfterDiscount = priceCart - discountAmount;
                        
	                    if (data <= 30) {
	                    	 $('#pricedistance').text(formatVND(16000));
	                    	 price = totalPriceAfterDiscount + 16000;
	                    } else {
	                        $('#pricedistance').text(formatVND(80 * data));
	                        price = totalPriceAfterDiscount + (80 * data);
	                    }
	                    var pdt = document.getElementById('pdt');
	                    $('#totalPrice').text(formatVND(totalPrice));
	                     // Loại bỏ lớp 'd-none' từ phần tử pdt (nếu có)
	                     pdt.classList.remove('d-none');
	                     
	                     
	                     

	                     // Thêm lớp 'd-block' cho phần tử pdt
	                     pdt.classList.add('d-block');
		                 $('#totalPrice').text(formatVND(price));
		                 
		                 var vanchuyen = document.getElementById('vanchuyen');
	                     vanchuyen.classList.remove('d-none');
	                     vanchuyen.classList.add('d-block');
	                     
	                     var checkttgh = document.getElementById('checkttgh');
	                     checkttgh.classList.add('d-none');
                    },
                    error: function(xhr, status, error) {
                        console.error("Lỗi xảy ra: " + status + " " + error);
                    }
                });
            }


        }

        document.addEventListener('DOMContentLoaded', (event) => {
            document.getElementById('detailaddress').addEventListener('input', validateForm);
            document.getElementById('phone').addEventListener('input', validateForm);
            document.getElementById('city').addEventListener('change', validateForm);
            document.getElementById('district').addEventListener('change', validateForm);
            document.getElementById('ward').addEventListener('change', validateForm);
        });
        function formatVND(amount) {
            const roundedAmount = Math.round(amount / 1000) * 1000;
            return roundedAmount.toLocaleString('vi-VN') + ' ₫';
        }
        function format(amount) {
            const roundedAmount = Math.round(amount / 1000) * 1000;
            return roundedAmount.toLocaleString('vi-VN');
        }
    </script>


