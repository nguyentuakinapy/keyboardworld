<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KEYBOARD WORLD</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<style>
html, body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.nav-left {
	position: fixed;
	width: 250px;
	height: 100%;
	background-color: white;
	box-shadow: 4px 0 4px rgba(0, 0, 0, 0.1);
	z-index: 1000;
}

header {
	position: fixed;
	background-color: white;
	width: calc(100% - 250px);
	height: 75px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	z-index: 999;
	right: 0;
}

.main-right {
	margin-left: 250px;
	padding-top: 75px;
	background-color: aliceblue;
	min-height: 100vh;
}

.main-body {
	margin: 20px;
	background-color: white;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	padding: 20px;
	box-sizing: border-box;
}

.search input {
	border-radius: 20px 0 0 20px;
	border-right: none;
}

.search button {
	border-radius: 0 20px 20px 0;
}

nav ul {
	list-style: none;
}

nav ul li {
	margin: 15px 0;
}

nav ul li .link {
	text-decoration: none;
	color: rgb(95, 92, 92);
	font-weight: bold;
	display: block;
	padding: 10px;
	transition: background-color 0.3s ease;
}

nav ul li .link:hover, nav ul li .link.active {
	color: rgb(219, 215, 215);
	background-color: #535353;
	border-radius: 5px;
}

table {
	width: 100%;
}

table th, table td {
	text-align: center;
	vertical-align: middle;
}

table th {
	background-color: #f8f9fa;
}

.img {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	border-radius: 4px;
	background-color: #8b9cb1;
	color: #ffffff;
	text-align: center;
	margin-right: 10px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	vertical-align: middle;
}

.drop-menu {
	position: absolute;
	will-change: transform;
	top: 0px;
	left: 0px;
	transform: translate3d(-2px, 30px, 0px);
	min-width: 180px;
}

.form-group {
	margin-bottom: 1rem;
}

.text-xs {
	font-weight: 600;
	font-family: sans-serif;
	color: #4f5f6f;
}

.action-icon {
	display: flex;
	align-items: center;
	justify-content: center;
}

.action-icon i {
	cursor: pointer;
	font-size: 1.2rem;
	margin-right: 10px;
}

.action-icon i:last-child {
	margin-right: 0;
}

.action-icon .second-actions {
	display: none;
}

.table img {
	width: 50px;
}

.right-arrow {
	color: green;
	font-size: 1.5rem;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="nav-left">
		<div class="logo text-center p-2">
			<img src="/images/AkinaKB.png" style="width: 60%;" alt="Logo">
		</div>
		<div class="mt-5">
			<nav class="navbar">
				<ul>
					<li><a class="link" href="/keyboardworld"><i
							class="bi bi-house me-2"></i>TRANG CHỦ</a></li>
					<li><a class="link" href="/keyboardworld/admin/product"><i
							class="bi bi-box-seam me-2"></i>SẢN PHẨM</a></li>
					<li><a class="link" href="khachhang.html"><i
							class="bi bi-people me-2"></i>KHÁCH HÀNG</a></li>
					<li><a class="link" href="hoadon.html"><i
							class="bi bi-receipt me-2"></i>HÓA ĐƠN</a></li>
					<li><a class="link" href="loaisanpham.html"><i
							class="bi bi-tags me-2"></i>LOẠI SẢN PHẨM</a></li>
					<li><a class="link" href="AdminKeyboardWorld.html"><i
							class="bi bi-bar-chart me-2"></i>THỐNG KÊ</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<header>
		<div class="row m-0 justify-content-between align-items-center">
			<div class="col-4 d-flex justify-content-center align-items-center">
				<form class="d-flex search" role="search">
					<input class="form-control" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">
						<i class="bi bi-search"></i>
					</button>
				</form>
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<div id="currentDateTime"></div>
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<nav class="navbar navbar-expand-lg p-0">
					<ul class="navbar-nav d-flex align-items-center">
						<li class="nav-item me-2 "><a href="" class="nav-link"><i
								class="bi bi-bell" style="font-size: large;"></i></a></li>
						<li class="nav-item dropdown" style="border-left: 1px solid;">
							<a href="#"
							class="nav-link dropdown-toggle d-flex align-items-center"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<div class="img"
									style="background-image: url('/images/bridge75bac.png');"></div>
								<span>${user.fullName}</span>
						</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/keyboardworld/account"><i
										class="bi bi-person me-2"></i>Profile</a></li>
								<li><a class="dropdown-item" href="/keyboardworld/logout"><i
										class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>


	<main class="main-right">
		<jsp:include page="${views}"></jsp:include>
	</main>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var navLinks = document.querySelectorAll('.nav-left a');
			var currentPath = window.location.pathname.split('/').pop();

			navLinks.forEach(function(link) {
				if (link.getAttribute('href') === currentPath) {
					link.classList.add('active');
				}
			});
		});
		function updateTime() {
			var now = new Date();
			var days = [ 'Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm',
					'Thứ Sáu', 'Thứ Bảy' ];
			var months = [ 'Tháng Một', 'Tháng Hai', 'Tháng Ba', 'Tháng Tư',
					'Tháng Năm', 'Tháng Sáu', 'Tháng Bảy', 'Tháng Tám',
					'Tháng Chín', 'Tháng Mười', 'Tháng Mười Một',
					'Tháng Mười Hai' ];
			var dayOfWeek = days[now.getDay()];
			var month = months[now.getMonth()];
			var day = now.getDate();
			var year = now.getFullYear();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			var seconds = now.getSeconds();
			document.getElementById('currentDateTime').innerHTML = dayOfWeek
					+ ", " + day + " " + month + " " + year + " - " + hours
					+ ":" + minutes + ":" + seconds;
		}

		setInterval(updateTime, 1000); // Cập nhật thời gian mỗi giây
		updateTime();

		function showFormEdit() {
			document.querySelector('#form1').classList.add('d-none');
			document.querySelector('#form2').classList.remove('d-none');
		}

		function showForm() {
			document.querySelector('#form2').classList.add('d-none');
			document.querySelector('#form1').classList.remove('d-none');
		}

		function toggleActions(icon) {
			var actionIcons = icon.closest('.actions');
			var settingsIcon = actionIcons.querySelector('.first-actions');
			var secondaryActions = actionIcons.querySelector('.second-actions');

			if (settingsIcon.style.display === 'none') {
				settingsIcon.style.display = 'block';
				secondaryActions.style.display = 'none';
			} else {
				settingsIcon.style.display = 'none';
				secondaryActions.style.display = 'flex';
			}
		}
	</script>
</body>

</html>