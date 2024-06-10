<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="mb-4">
				<h4 class="header-title"
					style="border-bottom: 1px solid #6e768e; padding-bottom: 16px">Chi
					Tiết Sản Phẩm - ${product.name}</h4>
			</div>
		</div>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr class="text-center">
				<th style="width: 70px">STT</th>
				<th>Màu</th>
				<th style="width: 400px;">Ảnh</th>
				<th>Số lượng</th>
				<th>Giá</th>
				<th style="width: 120px">Hành động</th>
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
					<td class="text-center"><a href=""><i class="bi bi-trash text-danger"></i></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="d-flex justify-content-end">
		<a href="/keyboardworld/admin/newproduct" style="width: 10%;"
			class="btn btn-success text-white me-2"> <i
			class="bi bi-plus-lg me-2"></i>Thêm
		</a> <a class="btn btn-secondary" style="width: 10%;"
			href="/keyboardworld/admin/product"><i class="bi bi-backspace-reverse me-2"></i>Quay lại</a>
	</div>
</div>