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

.password-container {
	position: relative;
}

.toggle-password {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
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
						<li><a href="/keyboardworld/order" class="title-info">Đơn
								hàng của bạn</a></li>
						<li><a href="/keyboardworld/changepass"
							class="title-info active">Đổi mật khẩu</a></li>
						<li><a href="/keyboardworld/address/index" class="title-info">Sổ
								địa chỉ</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-sm-12 col-xs-12">
				<h1 class="title-head mt-10">đổi mật khẩu</h1>
				<h3 class="title-info text-danger">${message}</h3>
				<form action="/keyboardworld/changepass" method="post">
					<div class="form-floating mb-3 password-container">
						<input type="password" class="form-control" name="currentPass"
							placeholder="Nhập mật khẩu hiện tại" required> <span
							class="toggle-password">👁️</span> <label>Mật khẩu hiện
							tại <span style="color: red;">*</span>
						</label>
					</div>
					<div class="form-floating mb-3 password-container">
						<input type="password" class="form-control" name="newPass"
							placeholder="Nhập mật khẩu mới" required> <span
							class="toggle-password">👁️</span> <label>Mật khẩu mới <span
							style="color: red;">*</span>
						</label>
					</div>
					<div class="form-floating mb-3 password-container">
						<input type="password" class="form-control" name="confirmPass"
							placeholder="Nhập xác nhận mật khẩu" required><span
							class="toggle-password">👁️</span> <label>Xác nhận mật
							khẩu mới <span style="color: red;">*</span>
						</label>
					</div>
					<button type="submit" class="btn btn-primary">Lưu thay đổi</button>
				</form>
			</div>

		</div>
	</div>
</div>
<script>
document.querySelectorAll('.toggle-password').forEach(item => {
	item.addEventListener('click', function () {
		const input = this.previousElementSibling;
		const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
		input.setAttribute('type', type);
		this.textContent = type === 'password' ? '👁️' : '👁️‍🗨️';
	});
});
</script>