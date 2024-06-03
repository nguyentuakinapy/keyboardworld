<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<h3 class="mt-5 text-center fw-bold">
		GIỎ HÀNG <span>(${listCarts.size() } sản phẩm)</span>
	</h3>
	<div class="row">
		<article class="col-9">
			<div class="card" style="box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);">
				<c:forEach var="c" items="${listCarts}">
					<div class="cart-item">
						<div class="m-3" style="border-radius: 2px;">
							<img src="/images/${c.productDetail.thumbNail}"
								alt="CRUSH80 - Bàn phím cơ TKL khung nhôm CNC cao cấp - Silver no led"
								style="max-width: 100px; border-radius: 10px;">
						</div>
						<div class="item-details"
							style="display: flex; flex-direction: column; flex: 1;">
							<div class="item-info"
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
								<h5 style="margin: 0;">${c.productDetail.product.category.name}
									${c.productDetail.product.name}
									${c.productDetail.product.property}</h5>
							</div>
							<div class="item-actions me-3 mt-3">
								<div class="row align-items-center mb-3">
									<div class="col-auto">
										<label class="col-form-label">Màu: <b>${c.productDetail.color }</b>
										</label>
									</div>
									<div class="col-auto">
										<label class="col-form-label">Số lượng:</label>
									</div>
									<div class="col-auto">
										<div class="form-control d-flex align-items-center">
											<button class="btn-cart" type="button" id="button-decrement">-</button>
											<input type="text" class="qty-cart" id="quantity-input"
												value="${c.quantity }" readonly>
											<button class="btn-cart" type="button" id="button-increment">+</button>
										</div>
									</div>
									<div class="col-auto">
										<label class="col-form-label">Giá:
											${c.productDetail.price * c.quantity} </label>
									</div>
								</div>
							</div>

						</div>
						<a href="/keyboardworld/deletecart/${c.cartID}"
							class="btn btn-outline-danger me-5 mt-4">Xóa</a>
					</div>
					<c:set var="totalPrice"
						value="${totalPrice + c.productDetail.price * c.quantity}" />
				</c:forEach>
			</div>
		</article>


		<aside class="col-3">
			<div class="card"
				style="display: flex; flex-direction: column; text-align: center; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);">
				<div class="d-flex m-4" style="justify-content: space-between;">

					<p style="margin: 0;">Tạm tính:</p>
					<span class="fw-bold">${totalPrice }₫</span>
				</div>
				<hr class="w-100 m-0 p-0">
				<div class="d-flex m-4" style="justify-content: space-between;">
					<p style="margin: 0;">Thành tiền:</p>
					<span>${totalPrice }₫</span>
				</div>
				<hr class="w-100 m-0 p-0">
				<div class="mx-4 my-2">
					<button class="checkout-btn"
						style="background-color: black; color: white; width: 100%; padding: 10px 0; border: none;">THANH
						TOÁN NGAY</button>
				</div>
				<div class="mx-4 my-2">
					<a href="/keyboardworld/product" class="btn btn-white"
						style="width: 100%; padding: 10px 0; border: none;">TIẾP TỤC
						MUA HÀNG</a>
				</div>
			</div>
		</aside>
	</div>
</div>