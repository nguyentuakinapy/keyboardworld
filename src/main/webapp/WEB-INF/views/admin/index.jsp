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
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<style>
body {
	overflow-x: hidden;
}

#wrapper {
	height: 100%;
	overflow: hidden;
	width: 100%;
	margin: 0 auto;
}

.navbar-custom {
	padding: 0 10px 0 0;
	height: 70px;
	background: #f5f5f5;
	margin-top: -16px;
}

.navbar-custom .topnav-menu li {
	float: left;
}

.navbar-custom .topnav-menu .nav-link {
	min-width: 32px;
	display: block;
	line-height: 70px;
	text-align: center;
	max-height: 70px;
}

.nav-user {
	padding: 0 12px !important;
}

.profile-dropdown {
	min-width: 170px;
}

.notification-list .noti-title {
	padding: 15px 20px;
}

.profile-dropdown i {
	margin-right: 5px;
}

.navbar-custom .button-menu-mobile {
	border: none;
	color: rgba(98, 103, 115, .7);
	display: inline-block;
	height: 70px;
	line-height: 70x;
	width: 60px;
	background-color: transparent;
	font-size: 24px;
}

.left-side-menu {
	width: 181px;
	background: #fff;
	bottom: 166px;
	position: absolute;
	-webkit-transition: all .2s ease-out;
	transition: all .2s ease-out;
	top: 70px;
}

.metismenu {
	padding: 0;
}

#sidebar-menu .menu-title {
	padding: 10px 20px;
	letter-spacing: .05em;
	pointer-events: none;
	font-size: .6875rem;
	text-transform: uppercase;
	font-weight: 600;
}

.metismenu li {
	list-style: none;
}

#sidebar-menu ul li a {
	color: black;
	display: block;
	padding: 12px 20px;
	margin: 2px 0;
	position: relative;
	-webkit-transition: all .4s;
	transition: all .4s;
	font-size: 16px;
	text-decoration: none;
}

#sidebar-menu ul li a i {
	display: inline-block;
	line-height: 1.0625rem;
	margin: 0 10px 0 3px;
	text-align: center;
	width: 20px;
	font-size: 18px;
}

.content-page {
	margin-left: 181px;
	border-left: 7px solid #f5f5f5;
}

.content-page .content {
	padding: 20px 15px 80px 15px;
	position: relative;
}

.header-title {
	font-size: 16px;
	transform: translateY(20%);
}

.table-responsive {
	overflow-x: hidden;
}

table {
	table-layout: fixed;
	width: 100%;
}

td.text-truncate {
	max-width: 240px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.action-icon {
	display: flex;
	align-items: center;
	justify-content: center;
	padding-right: 30px;
	font-size: 13px;
	width: 120px;
}

.action-icon i {
	cursor: pointer;
	font-size: 1.2rem;
}

.action-icon i:last-child {
	margin-right: 5px;
}

.action-icon .second-actions {
	display: none;
}

.right-arrow {
	color: green;
	font-size: 1.5rem;
	cursor: pointer;
}

.navbar-custom .currentDateTime {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	margin-top: 25px;
}

#sidebar-menu>ul>li>a:hover {
	color: #458bc4;
	text-decoration: none;
	background-color: #f5f5f5
}

.left-side-menu.collapsed {
	width: 60px;
	overflow: hidden;
	transition: all .2s ease-out;
}

.content-page.collapsed {
	margin-left: 60px;
	transition: all .2s ease-out;
}

.left-side-menu.collapsed .menu-title, .left-side-menu.collapsed .metismenu li a span
	{
	display: none;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="navbar-custom">
			<ul class="list-unstyled topnav-menu float-end mb-0">
				<li class="dropdown notification-list"><a href="#"
					type="button" class="nav-link dropdown-toggle nav-user"
					data-bs-toggle="dropdown" aria-expanded="false"> <span
						class="pro-user-name ms-1">${userS.fullName}</span>
				</a>
					<div class="dropdown-menu dropdown-menu-end profile-dropdown">
						<div class="dropdown-header noti-title">
							<h6 class="m-0">Xin chào!</h6>
						</div>
						<a href="/keyboardworld/account" class="dropdown-item notify-item">
							<i class="bi bi-person"></i> <span>Tài khoản</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="/keyboardworld/logout" class="dropdown-item notify-item">
							<i class="bi bi-box-arrow-right"></i> <span>Đăng xuất</span>
						</a>
					</div></li>
			</ul>
			<div class="currentDateTime" id="currentDateTime"></div>
			<ul class="list-unstyled topnav-menu topnav-menu-start">
				<li><button class="button-menu-mobile">
						<i class="bi bi-list"></i>
					</button></li>
			</ul>
		</div>
		<!--End TopBar-->
		<!-- =========Left Sidebar Start======== -->
		<div class="left-side-menu">
			<div class="text-center p-2">
				<img src="/images/AkinaKB.png" alt="Logo" width="60%">
			</div>
			<div id="sidebar-menu">
				<ul class="metismenu" id="side-menu">
					<li class="menu-title">Điều hướng</li>
					<li><a href="/keyboardworld"> <i class="bi bi-house"></i>
							<span>Trang Chủ</span>
					</a></li>
					<li><a href="/keyboardworld/admin/product"> <i
							class="bi bi-boxes"></i> <span>Sản Phẩm</span>
					</a></li>
					<li><a href="/keyboardworld/admin/userlist"><i
							class="bi bi-people"></i><span>Người Dùng</span> </a></li>
					<li><a href="/keyboardworld/admin/orderall"> <i class="bi bi-receipt"></i> <span>Hóa
								Đơn</span>
					</a></li>
					<li><a href="/keyboardworld/admin/orderall"> <i class="bi bi-receipt"></i> <span>Mã giảm giá</span>
					</a></li>
					<li><a href="#"> <i class="bi bi-graph-up-arrow"></i> <span>Thống
								Kê</span>
					</a></li>
				</ul>
			</div>
			<!--End Sidebar-->
			<div class="clearfix"></div>
		</div>
		<!-- Left Sidebar End -->
		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<div class="content">
				<main>
					<jsp:include page="${views}"></jsp:include>
				</main>
				<!-- End Content -->
			</div>
			<!-- End Container -->
		</div>
		<!-- End Content Page -->
	</div>
	<script>
		function updateTime() {
			var now = new Date();
			var days = [ 'Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm',
					'Thứ Sáu', 'Thứ Bảy' ];
			var months = [ 'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
					'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
					'Tháng 10', 'Tháng 11', 'Tháng 12' ];
			var dayOfWeek = days[now.getDay()];
			var month = months[now.getMonth()];
			var day = now.getDate();
			var year = now.getFullYear();
			var hours = now.getHours().toString().padStart(2, '0');
			var minutes = now.getMinutes().toString().padStart(2, '0');
			var seconds = now.getSeconds().toString().padStart(2, '0');
			document.getElementById('currentDateTime').innerHTML = dayOfWeek
					+ ", Ngày " + day + " " + month + " Năm " + year + " - "
					+ hours + " Giờ " + minutes + " Phút " + seconds + " Giây ";
		}

		setInterval(updateTime, 1000); // Cập nhật thời gian mỗi giây
		updateTime();

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

		document.querySelector('.button-menu-mobile').addEventListener(
				'click',
				function() {
					document.querySelector('.left-side-menu').classList
							.toggle('collapsed');
					document.querySelector('.content-page').classList
							.toggle('collapsed');
				});
	</script>
</body>

</html>