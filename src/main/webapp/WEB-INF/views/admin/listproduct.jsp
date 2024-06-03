<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="main-body">
	<div id="form1">
		<h3 class="text-center text-primary fw-bold mt-3">QUẢN LÝ SẢN
			PHẨM</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="30">STT</th>
					<th>Tên sản phẩm</th>
					<th width="120">Trạng thái</th>
					<th width="150">Ngày cập nhật</th>
					<th>Thuộc tính</th>
					<th>Ảnh</th>
					<th width="120">Loại</th>
					<th width="120">Cửa hàng</th>
					<th width="120">Hành động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${products}" varStatus="stt">
					<tr>
						<td>${stt.index + 1}</td>
						<td>${p.name}</td>
						<td>${p.status == 1 ? 'Còn hàng' : 'Hết hàng'}</td>
						<td>${p.date}</td>
						<td>${p.property}</td>
						<td><img src="/images/${p.galleries[0].thumbnail}"
							alt="Ảnh 1" style="width: 25px;"></td>
						<td>${p.category.name}</td>
						<td>${p.brand.name}</td>
						<td>
							<div class="actions action-icon">
								<div class="first-actions">
									<i class="bi bi-gear" onclick="toggleActions(this)"></i>
								</div>
								<div class="second-actions">
									<a href="/keyboardworld/admin/editproduct/${p.productID}"><i
										class="bi bi-pencil-square text-warning me-2"></i></a> <a
										href="/keyboardworld/admin/detailproduct/${p.productID}"><i
										class="bi bi-ticket-detailed"></i></a><a class="mx-2"><i
										class="bi bi-arrow-right-circle right-arrow"
										onclick="toggleActions(this)"></i></a>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-end">
			<a href="/keyboardworld/admin/newproduct"
				class="btn btn-success text-white"> <i
				class="bi bi-plus-lg me-2"></i>Thêm
			</a>
		</div>
	</div>
</div>