
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="d-flex justify-content-between align-items-center mb-4"
				style="border-bottom: 1px solid #6e768e; padding-bottom: 16px;">
				<h4 class="header-title">Quản Lý Hóa Đơn</h4>
				<form action="/keyboardworld/admin/userlist" method="post"
					class="d-flex" role="search">
					<input class="form-control form-control-sm" type="search"
						name="keywords" value="${keywords}" placeholder="Tìm theo tên"
						aria-label="Search">
					<button class="btn btn-outline-dark btn-sm">
						<i class="bi bi-search"></i>
					</button>
				</form>
				<div class="btn-custom">
					<a class="btn btn-secondary" style="padding: 2.7px 20px;">Xuất
						File Excel</a>
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
						class="btn btn-outline-dark active" aria-current="page">Danh
						sách hóa đơn</a> <a href="/keyboardworld/admin/orderall"
						class="btn btn-outline-dark">Danh sách hóa đơn chưa xác nhận</a> <a
						href="/keyboardworld/admin/edituser" class="btn btn-outline-dark">Danh
						sách hóa đơn đã xác nhận</a> <a href="/keyboardworld/admin/edituser"
						class="btn btn-outline-dark">Danh sách hóa đơn đã hủy</a>
				</div>

				<div class="table-responsive">
					<table class="table table-bordered" style="width: 100%;">
						<thead>
							<tr class="text-center">
								<th style="width: 75px;">Mã hóa đơn</th>
								<th style="width: 130px;">Họ và tên</th>
								<th style="width: 80px;">Ngày mua</th>
								<th style="width: 100px;">Tổng tiền</th>
								<th style="width: 200px;">Địa chỉ</th>
								<th style="width: 100px;">Trạng thái</th>
								<th style="width: 80px;">Số điện thoại</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="o" items="${orders}">
								<tr class="text-center">
									<td>#${o.orderID}</td>
									<td>${o.user.fullName}</td>
									<td><fmt:formatDate value="${o.date}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
									<td><fmt:formatNumber type="number"
											value="${o.totalPrice}" pattern="###,###,###đ"></fmt:formatNumber></td>
									<td class="text-truncate">${o.addRess}</td>
									<td><select class="form-select status-select"
										name="status-order" data-orderid="${o.orderID}">
											<option ${o.status == 0 ? 'selected' : ''} data-value="0"
												value="0">Đang chờ</option>
											<option ${o.status == 1 ? 'selected' : ''} data-value="1"
												value="1">Đã hủy</option>
											<option ${o.status == 2 ? 'selected' : ''} data-value="2"
												value="2">Đã hoàn thành</option>
									</select></td>
									<td>${o.phone}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<%-- <div class="d-flex justify-content-center mt-4">
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
					</div> --%>
				</div>
			</div>
			<!-- Table Customer End -->
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
    const statusSelect = document.querySelectorAll('.status-select');

    statusSelect.forEach(select => {
    	select.addEventListener('change', function () {
            const orderID = parseInt(this.getAttribute('data-orderid'));  // Convert to integer
            const test = this.value;
            // Thực hiện AJAX call để cập nhật vai trò
            const xhr = new XMLHttpRequest();
            xhr.open('POST', `/keyboardworld/admin/updateStatus`, true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        alert('Cập nhật trạng thái thành công!');
                        location.reload();
                    } else {
                        alert('Cập nhật trạng thái thất bại: ' + xhr.responseText);
                        location.reload();
                    }
                }
            };
            xhr.send(JSON.stringify({
                orderID: orderID,
                test: test
            }));
        });
    });
});
</script>