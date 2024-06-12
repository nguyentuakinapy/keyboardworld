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
				<form action="/keyboardworld/admin/adminlist" method="post"
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
				<div class="btn-group mb-5">
					<a href="/keyboardworld/admin/userlist"
						class="btn btn-outline-dark">Danh sách khách hàng</a> <a
						href="/keyboardworld/admin/adminlist"
						class="btn btn-outline-dark active" aria-current="page">Danh
						sách Admin</a> <a href="/keyboardworld/admin/edituser"
						class="btn btn-outline-dark">Chỉnh sửa người dùng</a>
				</div>

				<!-- Table Admin Start -->
				<div class="table-responsive">
					<table class="table table-bordered" style="width: 100%;">
						<thead>
							<tr class="text-center">
								<th style="width: 200px;">Địa chỉ Email</th>
								<th style="width: 200px;">Họ và tên</th>
								<th style="width: 130px;">Trạng thái</th>
								<th style="width: 240px;">Phân quyền</th>
								<th style="width: 70px;">Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="admin" items="${page.content}">
								<tr>
									<td>${admin.email}</td>
									<td>${admin.fullName}</td>
									<td class="text-center"><c:choose>
											<c:when test="${admin.active == 1}">
												<span class="badge text-bg-primary">Hoạt động</span>
											</c:when>
											<c:otherwise>
												<span class="badge text-bg-danger">Vô hiệu hóa</span>
											</c:otherwise>
										</c:choose></td>
									<td class="text-center check"><input type="radio"
										class="role-checkbox" name="role_${admin.userID}"
										data-userid="${admin.userID}" data-role="Admin"
										${admin.role.roleName == 'Admin' ? 'checked' : ''}>
										Admin <input type="radio" class="role-checkbox"
										name="role_${admin.userID}" data-userid="${admin.userID}"
										data-role="User"
										${admin.role.roleName != 'Admin' ? 'checked' : ''}>
										Khách hàng</td>
									<td class="text-center">
										<div class="actions action-icon">
											<div class="first-actions">
												<i class="bi bi-gear" onclick="toggleActions(this)"></i>
											</div>
											<div class="second-actions">
												<a href="/keyboardworld/admin/edit/${admin.userID}"><i
													class="bi bi-pencil-square text-warning"></i></a> <a
													href="/keyboardworld/admin/adminlist/delete/${admin.userID}"><i
													class="bi bi-trash text-danger"></i></a> <a><i
													class="bi bi-arrow-right-circle right-arrow"
													onclick="toggleActions(this)"></i></a>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="d-flex justify-content-center mt-4">
						<a
							class="btn ${page.number <= 0 ? 'disabled' : ''} pagination-btn"
							aria-disabled="true" href="?page=${page.number - 1}">Trước</a>
						<c:if test="${page.totalPages > 0}">
							<c:forEach var="i" begin="0" end="${page.totalPages - 1}">
								<a class="btn ${i == page.number ? 'btn-secondary' : ''}"
									href="?page=${i}">${i + 1}</a>
							</c:forEach>
						</c:if>
						<a
							class="btn ${page.number == page.totalPages - 1 ? 'disabled' : ''} pagination-btn"
							aria-disabled="true" href="?page=${page.number + 1}">Sau</a>
					</div>
				</div>
				<!-- Table Admin End -->
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
document.addEventListener('DOMContentLoaded', function () {
    const roleCheckboxes = document.querySelectorAll('.role-checkbox');

    roleCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            const userID = parseInt(this.getAttribute('data-userid'));  // Convert to integer
            const role = this.getAttribute('data-role');

            // Thực hiện AJAX call để cập nhật vai trò
            const xhr = new XMLHttpRequest();
            xhr.open('POST', `/keyboardworld/admin/updateRole`, true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        alert('Cập nhật vai trò thành công!');
                        location.reload();
                    } else {
                        alert('Cập nhật vai trò thất bại: ' + xhr.responseText);
                        location.reload();
                    }
                }
            };
            xhr.send(JSON.stringify({
                userID: userID,
                role: role
            }));
        });
    });
});
</script>