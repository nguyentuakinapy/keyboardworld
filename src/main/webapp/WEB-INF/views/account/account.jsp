<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

<!
DOCTYPE html> <html lang ="en "> <head> <meta charset ="UTF-8 "> <meta name
	 ="viewport " content ="width =device-width, initial-scale =1.0 "> <title>Document
	 </title> <link href ="https: //cdn.jsdelivr.net /npm /bootstrap @5.3.3
	/dist /css /bootstrap.min.css " rel ="stylesheet "> <script src ="https:
	//cdn.jsdelivr.net /npm /bootstrap @5.3.3 /dist /js /bootstrap.bundle.min.js
	 "> </script> <link rel ="stylesheet " href ="https: //cdn.jsdelivr.net
	/npm /bootstrap-icons @1.11.3 /font /bootstrap-icons.css "> <link href
	 ="https: //fonts.googleapis.com /css2 ?family =Roboto:wght @400 ;700 
	 &display
	 =swap " rel ="stylesheet "> <style>.page_account {
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

.dis {
	cursor: not-allowed;
}
</style>

<div class="page_account mt-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-xs-12 col-sm-12">
				<div class="block-account">
					<h1 class="title-head mt-10">Trang tài khoản</h1>
					<p>
						Xin chào, <span>${userS.fullName}</span> !
					</p>
					<ul>
						<li><a href="/keyboardworld/account"
							class="title-info active">Thông tin tài khoản</a></li>
						<li><a href="/keyboardworld/order" class="title-info">Đơn
								hàng của bạn</a></li>
						<li><a href="/keyboardworld/changepass" class="title-info">Đổi
								mật khẩu</a></li>
						<li><a href="/keyboardworld/address/index" class="title-info">Sổ
								địa chỉ</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-sm-12 col-xs-12">
				<h1 class="title-head mt-10">Thông tin tài khoản</h1>
				<h3 class="title-info text-danger">${message}</h3>
				<form action="/keyboardworld/account" method="post">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="fullName"
							value="${userS.fullName}" required/> <label>Họ và tên <span
							style="color: red;">*</span>
						</label>
					</div>
					<div class="form-floating mb-3">
						<input type="email" class="form-control dis" name="email" value="${userS.email}" disabled />
						<label>Email <span style="color: red;">*</span></label>
					</div>
					<button type="submit" class="btn btn-primary">Lưu thay đổi</button>
				</form>
			</div>
		</div>
	</div>
</div>