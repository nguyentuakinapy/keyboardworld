<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="d-flex justify-content-between align-items-center mb-4"
				style="border-bottom: 1px solid #6e768e; padding-bottom: 16px;">
				<h4 class="header-title">Quản Lý Người Dùng</h4>
				<form action="/keyboardworld/admin/product" method="post"
					class="d-flex" role="search">
					<input class="form-control form-control-sm" type="search"
						name="keywords" value="${keywords}" placeholder="Tìm theo tên"
						aria-label="Search">
					<button class="btn btn-outline-dark btn-sm">
						<i class="bi bi-search"></i>
					</button>
				</form>
				<div class="btn-custom">
					<a class="btn btn-secondary" href="/keyboardworld/admin/edituser"
						style="padding: 2.7px 50px;">Thêm</a> <a class="btn btn-secondary"
						style="padding: 2.7px 20px;">Xuất File Excel</a>
				</div>
			</div>
		</div>
	</div>
	<!-- End Row -->
	<div class="row">
		<div class="col-12">
			<div class="mt-0">
				<div class="btn-group mb-0">
					<a href="/keyboardworld/admin/userlist"
						class="btn btn-outline-dark">Danh sách khách hàng</a> <a
						href="/keyboardworld/admin/adminlist" class="btn btn-outline-dark">Danh
						sách Admin</a> <a href="/keyboardworld/admin/edituser"
						class="btn btn-outline-dark active" aria-current="page">Chỉnh
						sửa người dùng</a>
				</div>
				<c:if test="${item != null}">
					<!-- Table Editor Start -->
					<form action="/keyboardworld/admin/updateUser" method="post"
						enctype="multipart/form-data">
						<div class="container mt-5">
							<input type="hidden" value="${item.email}" name="email">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="fullName"
									placeholder="Nhập tên" value="${item.fullName}"> <label>Họ
									và tên</label>
							</div>
							<div class="form-floating">
								<input type="password" class="form-control" name="password"
									placeholder="Nhập mật khẩu" value="${item.password}" readonly>
								<label>Mật khẩu</label>
							</div>
							<div class="row">
								<div class="mt-4 col-3">
									<c:if test="${item != null}">
										<img id="selectedImage" src="/images/${item.image}"
											alt="Image.png" class="rounded-circle"
											style="width: 200px; height: 200px; object-fit: cover;" />
									</c:if>
									<c:if test="${item == null}">
										<img id="selectedImage" src="/images/defaultAvatar.jpg"
											alt="Image.png" class="rounded-circle"
											style="width: 200px; height: 200px; object-fit: cover;" />
									</c:if>
								</div>
								<div class="col-9" style="transform: translateY(50%);">
									<div data-mdb-ripple-init class="btn btn-primary btn-rounded">
										<label class="form-label text-white m-1" for="customFile1">Choose
											file</label> <input type="file" class="form-control d-none"
											name="avatar" id="customFile1"
											onchange="displaySelectedImage(event, 'selectedImage')" />
									</div>
								</div>
							</div>
							<select class="form-select mt-3" name="active"
								style="padding: 1rem .75rem !important">
								<option ${item.active == 1 ? 'selected' : ''} value="1">Hoạt
									động</option>
								<option ${item.active == 0 ? 'selected' : ''} value="0">Vô
									hiệu hóa</option>
							</select>
							<div class="mt-3">
								<button type="submit" class="btn btn-warning">
									<i class="bi bi-pencil-square"></i> Sửa
								</button>
								<a href="/keyboardworld/admin/userlist/delete/${item.userID}"
									class="btn btn-danger"> <i class="bi bi-trash"></i> Xóa
								</a> <a href="/keyboardworld/admin/userlist" class="btn btn-info">
									<i class="bi bi-arrow-clockwise"></i> Reset
								</a>
							</div>
						</div>
					</form>
					<!-- Table Editor End -->
				</c:if>
				<c:if test="${item == null}">
					<!-- Table Editor Start -->
					<form action="/keyboardworld/admin/createUser" method="post"
						enctype="multipart/form-data">
						<div class="container mt-5">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="email"
									placeholder="Nhập email"> <label>Địa chỉ email</label>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="fullName"
									placeholder="Nhập tên"> <label>Họ và tên</label>
							</div>
							<div class="form-floating">
								<input type="password" class="form-control" name="password"
									placeholder="Nhập mật khẩu"> <label>Mật khẩu</label>
							</div>
							<div class="row">
								<div class="mt-4 col-3">
									<img id="selectedImage" src="/images/defaultAvatar.jpg"
										alt="Image.png" class="rounded-circle"
										style="width: 200px; height: 200px; object-fit: cover;" />
								</div>
								<div class="col-9" style="transform: translateY(50%);">
									<div data-mdb-ripple-init class="btn btn-primary btn-rounded">
										<label class="form-label text-white m-1" for="customFile1">Choose
											file</label> <input type="file" class="form-control d-none"
											name="avatar" id="customFile1"
											onchange="displaySelectedImage(event, 'selectedImage')" />
									</div>
								</div>
							</div>
							<select class="form-select mt-3" name="active"
								style="padding: 1rem .75rem !important">
								<option selected value="1">Hoạt động</option>
								<option value="0">Vô hiệu hóa</option>
							</select>
							<div class="mt-3">
								<button type="submit" class="btn btn-success">
									<i class="bi bi-person-plus-fill"></i> Thêm
								</button>
								<a href="/keyboardworld/admin/userlist" class="btn btn-info">
									<i class="bi bi-arrow-clockwise"></i> Reset
								</a>
							</div>
						</div>
					</form>
					<!-- Table Editor End -->
				</c:if>
			</div>

		</div>
	</div>
	<!-- End Row -->
</div>

<style>
.pagination-btn {
	border: none;
	border-radius: 0;
}
</style>

<script>
	function displaySelectedImage(event, elementId) {
		const selectedImage = document.getElementById(elementId);
		const fileInput = event.target;

		if (fileInput.files && fileInput.files[0]) {
			const reader = new FileReader();

			reader.onload = function(e) {
				selectedImage.src = e.target.result;
			};

			reader.readAsDataURL(fileInput.files[0]);
		}
	}
</script>