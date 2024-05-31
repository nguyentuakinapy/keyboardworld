<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
</style>

<div class="page_account">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-xs-12 col-sm-12">
				<div class="block-account">
					<h1 class="title-head mt-10">Trang tài khoản</h1>
					<p>
						Xin chào, <span>Nguyễn Phi Hùng</span> !
					</p>
					<ul>
						<li><a href="/keyboardworld/account"
							class="title-info active">Thông tin tài khoản</a></li>
						<li><a href="/keyboardworld/order" class="title-info">Đơn
								hàng của bạn</a></li>
						<li><a href="/keyboardworld/changepass" class="title-info">Đổi
								mật khẩu</a></li>
						<li><a href="/keyboardworld/address" class="title-info">Sổ
								địa chỉ</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-sm-12 col-xs-12">
				<h1 class="title-head mt-10">Đơn hàng của bạn</h1>
				<table class="table table-stripped table-bordered text-center">
					<tr class="table-primary">
						<th>Mã chi tiết</th>
						<th>Ngày</th>
						<th>Giá trị</th>
						<th>Tình trạng</th>
						<th>Thao tác</th>
					</tr>
					<tr>
						<td>CT1</td>
						<td>31/05/2004</td>
						<td>1,000,000đ</td>
						<td>Đã hoàn thành</td>
						<td><a href="#" class="action">Xem</a></td>
					</tr>
				</table>
			</div>

		</div>
	</div>
</div>