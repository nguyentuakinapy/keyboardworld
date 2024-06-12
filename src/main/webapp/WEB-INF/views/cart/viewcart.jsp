<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<form class="container" method="get">

	<c:if test="${listCarts.size() == 0}">
		<div class="text-center">
			<img alt="" style="width: 30%; margin: 60px 0px 26px 0px"
				src="/images/shoppingnone.png"><br> <a
				href="/keyboardworld/product"
				class="btn btn-outline-dark my-2 fw-bold">Tiếp tục mua hàng</a>
		</div>
	</c:if>

	<c:if test="${listCarts.size() != 0}">
		<h3 class="mt-5 text-center fw-bold">
			<s:message code="cart.head"></s:message>
			<span>(${listCarts.size()})</span>
		</h3>
		<div class="row">
			<article class="col-9">
				<div class="card"
					style="box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);">
					<div class="cart-item">
						<div class="form-check ms-4 me-2">
							<input type="checkbox" id="selectAll"
								class="form-check-input checkcart border border-danger">
						</div>
						<div class="mt-2 ms-4">
							<h6 class="fw-bold ">
								<s:message code="cart.image"></s:message>
							</h6>
						</div>
						<div class="item-details mt-2 ms-5"
							style="display: flex; flex-direction: column; flex: 1;">
							<h6 class="fw-bold">
								<s:message code="cart.productdetailname"></s:message>
							</h6>
						</div>
						<div style="margin-right: 35px">
							<a href="/keyboardworld/viewcart/deleteall"
								class="nav-link fw-bold text-danger"><s:message
									code="cart.deleteall"></s:message></a>
						</div>
					</div>
					<c:forEach var="c" items="${listCarts}">
						<div class="cart-item">
							<div class="form-check ms-4">
								<input type="checkbox" name="selectedItems" value="${c.cartID}"
									class="form-check-input checkcart border-primary" id="cart-${c.cartID}">
							</div>
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
											<label class="col-form-label"><s:message
													code="cart.color"></s:message> <b>${c.productDetail.color}</b>
											</label>
										</div>
										<div class="col-auto">
											<label class="col-form-label"><s:message
													code="cart.quantity"></s:message></label>
										</div>
										<div class="col-auto">
											<div class="form-control d-flex align-items-center">
												<form action="/keyboardworld/updatecart" method="post">
													<input type="hidden" name="cartID" value="${c.cartID}">
													<input type="hidden" name="quantity"
														value="${c.quantity - 1}">
													<button type="submit" class="btn-cart">-</button>
												</form>
												<input type="text" class="qty-cart" value="${c.quantity}"
													readonly>
												<form action="/keyboardworld/updatecart" method="post">
													<input type="hidden" name="cartID" value="${c.cartID}">
													<input type="hidden" name="quantity"
														value="${c.quantity + 1}">
													<button type="submit" class="btn-cart">+</button>
												</form>
											</div>
										</div>
										<div class="col-auto">
											<label class="col-form-label"><s:message
													code="cart.price"></s:message> <fmt:formatNumber
													value="${c.productDetail.price * c.quantity}"></fmt:formatNumber>
												₫ </label>
										</div>
									</div>
								</div>

							</div>
							<a href="/keyboardworld/deletecart/${c.cartID}"
								class="btn btn-outline-danger me-5 mt-4"><i
								class="bi bi-trash3"></i></a>
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

						<p style="margin: 0;">
							<s:message code="cart.provisional"></s:message>
						</p>
						<span class="fw-bold"> <fmt:formatNumber
								value="${totalPrice }"></fmt:formatNumber> ₫
						</span>
					</div>
					<hr class="w-100 m-0 p-0">
					<div class="d-flex m-4" style="justify-content: space-between;">
						<p style="margin: 0;">
							<s:message code="cart.totalprice"></s:message>
						</p>
						<span><fmt:formatNumber value="${totalPrice }"></fmt:formatNumber>
							₫</span>
					</div>
					<hr class="w-100 m-0 p-0">
					<div class="mx-4 my-2">
						<button class="checkout-btn loadButton"
							formaction="/keyboardworld/checkout" formmethod="get"
							id="myButton"
							style="background-color: black; color: white; width: 100%; padding: 10px 0; border: none;"
							disabled>
							<s:message code="cart.buynow"></s:message>
						</button>
					</div>
					<div class="mx-4 my-2">
						<a href="/keyboardworld/product" class="btn btn-white"
							style="width: 100%; padding: 10px 0; border: none;"><s:message
								code="cart.continueshopping"></s:message></a>
					</div>
					<div class="form-floating m-2">
						<select class="form-control" id="voucher" name="voucher" required>
							<option value="1" selected>Chọn Mã giảm giá</option>
							<c:forEach var="v" items="${vouchers}">
								<c:if test="${v.voucherID != 1}">
									<option value="${v.voucherID}">${v.name}</option>
								</c:if>
							</c:forEach>
						</select> <label for="voucher">Mã giảm giá</label>
					</div>
				</div>
			</aside>
		</div>
	</c:if>

</form>
<script>
document.addEventListener('DOMContentLoaded', (event) => {
    const checkboxes = document.getElementsByClassName('checkcart');
    const button = document.getElementById('myButton');
    const updateButtonState = () => {
        for (let checkbox of checkboxes) {
            if (checkbox.checked) {
                button.disabled = false;
                return;
            }
        }
        button.disabled = true;
    };

    for (let checkbox of checkboxes) {
        checkbox.addEventListener('change', updateButtonState);
    }

    const selectAllCheckbox = document.getElementById("selectAll");

    selectAllCheckbox.addEventListener("change", function() {
        for (let checkbox of checkboxes) {
            checkbox.checked = this.checked;
        }
        updateButtonState();
    });
});

document.addEventListener("DOMContentLoaded", function() {
    var selectAllCheckbox = document.getElementById("selectAll");
    var checkboxes = document.getElementsByClassName("checkcart");

    selectAllCheckbox.addEventListener("change", function() {
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = selectAllCheckbox.checked;
        }
    });
});

</script>