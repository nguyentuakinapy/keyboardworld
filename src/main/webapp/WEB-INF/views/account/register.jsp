<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@charset "UTF-8";

.div-container {
	display: flex;
	justify-content: center;
	margin-top: 5%;
}

.form-container {
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
}

.form-header {
	font-size: 2.2rem;
	margin-bottom: 1.5rem;
	text-align: center;
}

.input-field {
	max-width: 380px;
	width: 100%;
	height: 55px;
	background-color: #f0f0f0;
	margin: 10px 0;
	border-radius: 55px;
	display: grid;
	grid-template-columns: 15% 85%;
	padding: 0 .4rem;
}

.input-field i {
	text-align: center;
	line-height: 55px;
	color: #acacac;
	font-size: 1.1rem;
}

.input-field input {
	background: none;
	outline: none;
	border: none;
	line-height: 1;
	font-weight: 600;
	font-size: 1.1rem;
	color: #333;
}

.btn-account {
	border-radius: 49px;
	height: 49px;
}
</style>
<div class="container">
	<div class="div-container">
		<div class="form-container">
			<h2 class="form-header text-uppercase">Đăng ký</h2>
			<form id="registerForm" class="">
				<div class="mb-3 input-field">
					<i class="bi bi-person-circle"></i> <input type="text"
						id="registerUser" placeholder="Nhập tên tài khoản" required>
				</div>
				<div class="mb-3 input-field">
					<i class="bi bi-envelope-at-fill"></i> <input type="email"
						id="registerEmail" placeholder="Nhập email" required>
				</div>
				<div class="mb-3 input-field">
					<i class="bi bi-person-fill-lock"></i> <input type="password"
						id="registerPass" placeholder="Nhập mật khẩu" required>
				</div>
				<div class="mb-3 input-field">
					<i class="bi bi-shield-fill-check"></i> <input type="password"
						id="registerConfirmPassw" placeholder="Nhập xác nhận mật khẩu"
						required>
				</div>
				<button type="submit" class="btn btn-account btn-dark w-100">Đăng
					ký</button>
				<p class="text-center mt-3">
					<strong>Đã có tài khoản?</strong> <a href="/keyboardworld/login"
						class="text-dark text-decoration-none">Đăng nhập</a>
				</p>
			</form>
		</div>
	</div>
</div>
