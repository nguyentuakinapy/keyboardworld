<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-body">
	<h3 class="text-center text-primary fw-bold mt-3">CHI TIẾT SẢN
		PHẨM ${product.name}</h3>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>STT</th>
				<th>Màu</th>
				<th>Ảnh</th>
				<th>Số lượng</th>
				<th>Giá</th>
				<th>Hành động</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pd" items="${details}" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${pd.color}</td>
					<td>
						<div class="img"
							style="background-image: url('/images/${pd.thumbNail}');"></div>
						<span>${pd.thumbNail}</span>
					</td>
					<td>${pd.quantity}</td>
					<td>${pd.price}</td>
					<td><a href=""><i class="bi bi-trash text-danger"></i></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="d-flex justify-content-end">
		<a href="/keyboardworld/admin/newproduct"
			class="btn btn-success text-white me-2"> <i class="bi bi-plus-lg me-2"></i>Thêm
		</a> <a class="btn btn-secondary" style="width: 10%;"
			href="/keyboardworld/admin/product">Quay lại</a>
	</div>
</div>