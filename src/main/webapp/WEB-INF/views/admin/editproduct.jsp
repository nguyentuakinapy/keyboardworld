<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-body">
	<form:form action="/keyboardworld/admin/editproduct" method="post"
		modelAttribute="product">
		<h3 class="text-center text-primary fw-bold mt-3">Chỉnh sửa sản
			phẩm</h3>
		<div class="col-sm-10">
			<form:hidden path="productID" class="form-control" />
		</div>
		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Tên sản phẩm: </label>
				<div class="col-sm-10">
					<form:input path="name" type="text" class="form-control" />
				</div>
			</div>
		</div>

		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Thuộc tính: </label>
				<div class="col-sm-10">
					<form:input path="property" type="text" class="form-control" />
				</div>
			</div>
		</div>

		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Thông tin sản phẩm: </label>
				<div class="col-sm-10">
					<form:textarea path="generalInfo" rows="5" class="form-control" />
				</div>
			</div>
		</div>

		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Hãng: </label>
				<div class="col-sm-10">
					<form:select path="brand.brandID" class="form-select">
						<c:forEach items="${brands}" var="brand">
							<option value="${brand.brandID}"
								<c:if test="${brand.brandID eq product.brand.brandID}">selected</c:if>>${brand.name}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
		</div>

		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Loại: </label>
				<div class="col-sm-10">
					<form:select path="category.categoryID" class="form-select">
						<c:forEach items="${categories}" var="category">
							<option value="${category.categoryID}"
								<c:if test="${category.categoryID eq product.category.categoryID}">selected</c:if>>${category.name}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Hình ảnh: </label>
				<div class="col-sm-9">
					<input name="gallery" type="file" class="form-control" />
				</div>
				<div class="col-sm-1">
					<img alt="" style="width: 50%"
						src="/images/bridge75trangdacbiet.png">
				</div>
			</div>
		</div>

		<div class="mb-3 d-flex justify-content-end">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModal" style="width: 10%;">Thêm màu
			</button>
			<button class="btn btn-success mx-2" style="width: 10%;"
				formaction="/keyboardworld/admin/save">Lưu</button>
			<button class="btn btn-secondary" style="width: 10%;"
				formaction="/keyboardworld/admin/product">Quay lại</button>
		</div>
	</form:form>
	<!-- Start List Color -->
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Màu</th>
				<th>Ảnh</th>
				<th>Số lượng</th>
				<th>Giá</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Đỏ</td>
				<td>
					<div class="img" style="background-image: url('A-Black.webp');"></div>
					<span>sp1.png</span>
				</td>
				<td>10</td>
				<td>100,000 VND</td>
			</tr>
		</tbody>
	</table>
	<!-- End List Color -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form:form class="modal-content"
				action="/keyboardworld/admin/newproductdetail" style="width: 700px;"
				modelAttribute="detail">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Thêm màu</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<div class="row g-3 align-items-center">
							<label class="col-sm-2 text-xs">Màu: </label>
							<div class="col-sm-10">
								<form:input path="color" type="text" class="form-control" />
							</div>
						</div>
					</div>
					<div class="mb-3">
						<div class="row g-3 align-items-center">
							<label class="col-sm-2 text-xs">Ảnh: </label>
							<div class="col-sm-10">
								<input type="file" name="thumbnail" class="form-control">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<div class="row g-3 align-items-center">
							<label class="col-sm-2 text-xs">Số lượng: </label>
							<div class="col-sm-10">
								<form:input path="quantity" type="number" class="form-control" />
							</div>
						</div>
					</div>
					<div class="mb-3">
						<div class="row g-3 align-items-center">
							<label class="col-sm-2 text-xs">Giá: </label>
							<div class="col-sm-10">
								<form:input path="price" type="number" class="form-control" />
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">Thêm màu</button>
				</div>
			</form:form>
		</div>
	</div>
</div>
