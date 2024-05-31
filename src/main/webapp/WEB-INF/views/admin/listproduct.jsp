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
					<th>STT</th>
					<th>Tên sản phẩm</th>
					<th>Trạng thái</th>
					<th>Ảnh</th>
					<th>Ngày nhập</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${products}" varStatus="stt">
					<tr>
						<td>${stt.index + 1}</td>
						<td>${p.name}</td>
						<td>${p.status}</td>
						<td><img src="/images/${p.galleries[0].thumbnail}"
							alt="Ảnh 1" style="width: 25px;"></td>
						<td>${p.date}</td>
						<td class="actions action-icon">
							<div class="first-actions">
								<i class="bi bi-gear" onclick="toggleActions(this)"></i>
							</div>
							<div class="second-actions">
								<a href="/keyboardworld/admin/editproduct"><i
									class="bi bi-pencil-square text-warning me-2"></i></a> <a
									href="/keyboardworld/admin/deleteproduct"><i
									class="bi bi-trash text-danger"></i></a><a class="mx-2"><i
									class="bi bi-arrow-right-circle right-arrow"
									onclick="toggleActions(this)"></i></a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-end">
			<a href="/keyboardworld/admin/newproduct"
				class="btn btn-success text-white" onclick="showFormEdit()"> <i
				class="bi bi-plus-lg me-2"></i>Thêm
			</a>
		</div>
	</div>
</div>