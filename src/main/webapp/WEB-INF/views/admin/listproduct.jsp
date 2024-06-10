<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="d-flex justify-content-between align-items-center mb-4"
				style="border-bottom: 1px solid #6e768e; padding-bottom: 16px;">
				<h4 class="header-title">Quản Lý Sản Phẩm</h4>
				<form action="/keyboardworld/admin/product" method="post"
					class="d-flex" role="search">
					<input class="form-control form-control-sm" type="search"
						name="keywords" value="${keywords}" placeholder="Tìm theo tên sản phẩm"
						aria-label="Search">
					<button class="btn btn-outline-dark btn-sm"><i class="bi bi-search"></i></button>
				</form>
				<div class="btn-custom">
					<a class="btn btn-secondary" href="/keyboardworld/admin/newproduct"
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
				<div class="table-responsive">
					<table class="table table-bordered"
						style="width: 100%;">
						<thead>
							<tr class="text-center">
								<th style="width: 400px;">Tên sản phẩm</th>
								<th style="width: 120px;">Trạng thái</th>
								<th style="width: 130px;">Ngày cập nhật</th>
								<th style="width: 240px;">Thuộc tính</th>
								<th style="width: 120px;">Loại</th>
								<th style="width: 120px;">Cửa hàng</th>
								<th style="width: 100px;">Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${page.content}">
								<tr>
									<td class="text-truncate"><a
										href="/keyboardworld/detailproduct/${p.productID}"
										style="text-decoration: none; color: black">${p.name}</a></td>
									<td class="text-truncate">${p.status == 1 ? 'Còn hàng' : 'Hết hàng'}</td>
									<td class="text-truncate"><fmt:formatDate
											pattern="dd-MM-yyyy" value="${p.date}"></fmt:formatDate></td>
									<td class="text-truncate">${p.property}</td>
									<td class="text-truncate">${p.category.name}</td>
									<td class="text-truncate">${p.brand.name}</td>
									<td>
										<div class="actions action-icon">
											<div class="first-actions">
												<i class="bi bi-gear" onclick="toggleActions(this)"></i>
											</div>
											<div class="second-actions">
												<a href="/keyboardworld/admin/editproduct/${p.productID}"><i
													class="bi bi-pencil-square text-warning"></i></a> <a
													href="/keyboardworld/admin/detailproduct/${p.productID}"><i
													class="bi bi-ticket-detailed"></i></a> <a><i
													class="bi bi-arrow-right-circle right-arrow"
													onclick="toggleActions(this)"></i></a>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
							<!-- Các dòng khác -->
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