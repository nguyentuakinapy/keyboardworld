<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="d"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kicap Checkout</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
}

.checkout-form, .order-summary {
	background: white;
	padding: 20px;
	margin: 20px 0;
	border-radius: 5px;
}

.checkout-form h2, .order-summary h2 {
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.radio-group {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.radio-group label {
	display: block;
}

.radio-group input {
	margin-right: 5px;
}

.payment-methods {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.payment-methods label {
	display: flex;
	align-items: center;
	gap: 5px;
}

.order-summary {
	text-align: left;
}

.order-summary .item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.order-summary .total {
	font-size: 1.5em;
	font-weight: bold;
}

.order-summary button {
	padding: 10px 20px;
	background: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<article class="col-md-7 col-sm-12">
				<div class="checkout-form">
					<h2>Thông tin nhận hàng</h2>
					<form action="/keyboardworld/placeorder">
						<div class="form-floating mb-3">
							<select class="form-select" id="address" name="address">
								<option value="">Địa chỉ khác</option>
							</select> <label for="address">Số địa chỉ</label>
						</div>
						<div class="form-floating mb-3">
							<input type="email" class="form-control" id="email"
								placeholder="Email" required> <label for="email"
								style="color: gray">Email</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="name"
								placeholder="Họ và tên" required> <label for="name"
								style="color: gray">Họ và tên</label>
						</div>
						<div class="form-floating mb-3">
							<input type="tel" class="form-control" id="phone"
								placeholder="Số điện thoại" required> <label for="phone"
								style="color: gray">Số điện thoại</label>
						</div>
						<div class="form-floating mb-3">
							<select class="form-control" id="city" required>
								<option value="" selected>Chọn tỉnh thành</option>
							</select> <label for="city">Tỉnh thành</label>
						</div>
						<div class="form-floating mb-3">
							<select class="form-control" id="district" required>
								<option value="" selected>Chọn quận huyện</option>
							</select> <label for="district">Quận huyện</label>
						</div>
						<div class="form-floating mb-3">
							<select class="form-control" id="ward" required>
								<option value="" selected>Chọn phường xã</option>
							</select> <label for="ward">Phường xã</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="AddressDetail"
								placeholder="Địa chỉ cụ thể" required> <label
								for="AddressDetail" style="color: gray">Địa chỉ cụ thể</label>
						</div>
						<div class="form-floating mb-3">
							<textarea class="form-control" id="note"
								placeholder="Ghi chú (tùy chọn)" style="height: 100px;"></textarea>
							<label for="note" style="color: gray">Ghi chú (tùy chọn)</label>
						</div>
						<div class="form-group">
							<label>Vận chuyển</label>
							<div class="btn-group-toggle" data-toggle="buttons"
								style="width: 100%; display: flex; flex-direction: column; gap: 1px;">
								<label class="btn btn-outline-primary active" style=" width: 100%;display: flex; justify-content: space-between; text-align: center;"
									> Giao hàng tận nơi <span>30000.0₫</span></label> <label
									class="btn btn-outline-primary" style=" width: 100%;display: flex; justify-content: space-between; text-align: center;">
									Nhận tại cửa hàng <span>Miễn phí</span></label>
							</div>
							<script>
                            document.querySelectorAll('.btn-group-toggle .btn').forEach(btn => {
                                btn.addEventListener('click', function () {
                                    document.querySelectorAll('.btn-group-toggle .btn').forEach(btn => btn.classList.remove('active'));
                                    this.classList.add('active');
                                });
                            });
                        </script>
						</div>
						<button type="submit" class="btn btn-primary">Đặt hàng</button>
					</form>
				</div>
			</article>
			<aside class="col-md-5 col-sm-12">
				<div class="order-summary">
					<h2>
						Đơn hàng <span>(${listCarts.size() } sản phẩm)</span>
					</h2>
					<hr>
					<div class="items">
						<div>
							<c:forEach var="c" items="${listCarts}">
								<div class="row">
									<div class="cart-item">
										<div class="m-3" style="border-radius: 2px;">
											<img src="/images/${c.productDetail.thumbNail}"
												style="max-width: 50px; border-radius: 10px;">
										</div>
										<div class="row"
											style="display: flex; justify-content: space-between; text-align: left;">
											<div class="row">
												<span>${c.productDetail.product.category.name}
													${c.productDetail.product.property}
													${c.productDetail.product.name} </span>

											</div>

											<div class="item-actions me-3 mt-3">
												<span class="mb-3">Màu: <b>${c.productDetail.color }</b>
												</span> <span class="mb-3">Số lượng: <b>${c.quantity }</b>
												</span> <span class="mb-3"> ${c.productDetail.price * c.quantity}₫
												</span>

											</div>
										</div>
									</div>
								</div>
								<c:set var="totalPrice"
									value="${totalPrice + c.productDetail.price * c.quantity}" />
								<c:set var="totalPriceFinal" value="${totalPrice + 30000}" />
							</c:forEach>
						</div>


					</div>
					<div class="item">
						<span>Tạm tính</span> <span>${totalPrice }₫</span>
					</div>
					<div class="item">
						<span>Phí vận chuyển</span> <span>30000.0₫</span>
					</div>
					<div class="item">
						<span>Giảm giá</span> <span>0₫</span>
					</div>
					<hr>
					<div class="total"
						style="display: flex; justify-content: space-between; text-align: center;">
						<span>Tổng cộng</span> <span>${totalPriceFinal }₫</span>
					</div>
					<div class="form-group"
						style="display: flex; justify-content: space-between; text-align: center;">
						<input type="text" id="voucher" style="margin-right: 10%;"
							placeholder="Nhập mã giảm giá">
						<div class="text-nowrap">
							<button
								style="padding: 10px 20px; background: #007bff; color: #fff; border: none; border-radius: 5px; cursor: pointer;">Áp
								dụng</button>
						</div>
					</div>
					<div class=""
						style="display: flex; justify-content: space-between; text-align: center;">
						<a href="/keyboardworld/viewcart"> <i
							class="previous-link__arrow">❮</i> <span>quay về giỏ hàng</span></a>
						<button type="submit" class="btn btn-primary">Đặt hàng</button>

					</div>

				</div>
			</aside>
		</div>
	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
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
    district.length = 1;
    ward.length = 1;
    if(this.value != ""){
      const result = data.filter(n => n.Id === this.value);

      for (const k of result[0].Districts) {
        district.options[district.options.length] = new Option(k.Name, k.Id);
      }
    }
  };
  district.onchange = function () {
    ward.length = 1;
    const dataCity = data.filter((n) => n.Id === citis.value);
    if (this.value != "") {
      const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

      for (const w of dataWards) {
        wards.options[wards.options.length] = new Option(w.Name, w.Id);
      }
    }
  };
}
    </script>
</body>
</html>