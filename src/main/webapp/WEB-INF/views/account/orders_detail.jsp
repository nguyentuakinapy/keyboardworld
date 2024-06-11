<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
.page_account {
	margin-bottom: 30px;
	padding: 20px 0;
}

.mt-10 {
	margin-top: 10px !important;
}

.block-account p {
	font-weight: 700;
	font-size: 14px;
	line-height: 16px;
	margin-bottom: 28px;
	color: #212B25;
	position: relative;
}

.block-account ul {
	padding: 0;
	margin: 0;
	list-style: none inside;
}

.title-info {
	font-weight: 400;
	font-size: 14px;
	color: #333;
	margin-bottom: 10px;
	display: block;
}

a {
	line-height: 25px;
	text-decoration: none;
	background: transparent;
}

.title-head {
	font-size: 19px;
	line-height: 22px;
	font-weight: 400;
	color: #212B25;
	text-transform: uppercase;
	margin-bottom: 27px;
}

.active {
	color: #c9d6df;
}

.action {
	color: #212B25;
}

.UDaMW3 {
	font-size: 19px;
	font-weight: 600;
	text-transform: uppercase;
	text-decoration: none;
}
</style>

<div class="page_account">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-xs-12 col-sm-12">
				<div class="block-account">
					<h1 class="title-head mt-10">Trang tài khoản</h1>
					<p>
						Xin chào, <span>${userS.fullName}</span> !
					</p>
					<ul>
						<li><a href="/keyboardworld/account" class="title-info">Thông
								tin tài khoản</a></li>
						<li><a href="/keyboardworld/orders" class="title-info active">Đơn
								hàng của bạn</a></li>
						<li><a href="/keyboardworld/changepass" class="title-info">Đổi
								mật khẩu</a></li>
						<li><a href="/keyboardworld/address/index" class="title-info">Sổ
								địa chỉ</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-sm-12 col-xs-12">
				<h1 class="title-head mt-10">Đơn hàng chi tiết</h1>
				<c:forEach var="item" items="${list}">
					<div class="card mb-5">
						<div class="card-header UDaMW3">
							<a
								href="/keyboardworld/detailproduct/${item.productDetail.product.productID}"
								class="text-dark">${item.productDetail.product.name}</a>
						</div>
						<div class="card-body row">
							<div class="col-xs-12 col-sm-6 col-lg-6 col-md-6">
								<a
									href="/keyboardworld/detailproduct/${item.productDetail.product.productID}"><img
									src="/images/${item.productDetail.thumbNail}"
									alt="${item.productDetail.color}" width="40%"></a>
							</div>
							<div class="col-xs-12 col-sm-6 col-lg-6 col-md-6 m-auto">
								<p class="card-text fw-bold">Màu:
									${item.productDetail.color}</p>
								<p class="card-text fw-bold">Số lượng: X${item.quantity}</p>
								<p class="card-text fw-bold">
									Đơn giá:
									<fmt:formatNumber value="${item.productDetail.price}"
										type="number" pattern="###,###,###đ"></fmt:formatNumber>
								</p>
							</div>
						</div>
						<div class="card-footer d-flex justify-content-end fw-bold">
							Thành tiền:
							<fmt:formatNumber
								value="${item.productDetail.price * item.quantity}"
								type="number" pattern="###,###,###đ"></fmt:formatNumber>
						</div>
					</div>
				</c:forEach>
				<div class="block-account">
					<h2 class="title-head">Địa chỉ thanh toán</h2>
					<ul>
						<li>${order.addRess}</li>
						<li><b>Họ và tên:</b> ${order.user.fullName}</li>
						<li><b>Email:</b> ${order.user.email}</li>
						<li><b>Số điện thoại:</b> ${order.phone}</li>
					</ul>
				</div>
				<!-- </table> -->
			</div>
		</div>
	</div>
</div>