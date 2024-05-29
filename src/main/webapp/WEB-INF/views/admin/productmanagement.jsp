<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="main-body">
	<div id="form1">
		<h3 class="text-center text-primary fw-bold mt-3">QUẢN LÝ SẢN
			PHẨM</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tên sản phẩm</th>
					<th>Giá</th>
					<th>Ảnh</th>
					<th>Ngày nhập</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Sản phẩm 1</td>
					<td>100,000 VND</td>
					<td><img src="img1.jpg" alt="Ảnh 1" style="width: 50px;"></td>
					<td>01/01/2023</td>
					<td class="actions action-icon">
						<div class="first-actions">
							<i class="bi bi-gear" onclick="toggleActions(this)"></i>
						</div>
						<div class="second-actions">
							<i class="bi bi-pencil-square text-warning me-2"
								onclick="showFormEdit()"></i> <i class="bi bi-trash text-danger"></i>
							<i class="bi bi-arrow-right-circle right-arrow"
								onclick="toggleActions(this)"></i>
						</div>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Sản phẩm 2</td>
					<td>200,000 VND</td>
					<td><img src="img2.jpg" alt="Ảnh 2" style="width: 50px;"></td>
					<td>02/02/2023</td>
				</tr>
			</tbody>
		</table>
		<div class="d-flex justify-content-end">
			<button class="btn btn-success text-white" onclick="showFormEdit()">
				<i class="bi bi-plus-lg me-2"></i>Thêm
			</button>
		</div>
	</div>

	<!-- Start Form Editor -->
	<div id="form2" class="d-none">
		<h3 class="text-center text-primary fw-bold mt-3">Chỉnh sửa sản
			phẩm</h3>
		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Tên sản phẩm: </label>
				<div class="col-sm-10">
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Thuộc tính: </label>
				<div class="col-sm-10">
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Thông tin sản phẩm: </label>
				<div class="col-sm-10">
					<textarea rows="5" class="form-control"></textarea>
				</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Hãng: </label>
				<div class="col-sm-10">
					<select class="form-select">
						<option selected>Chọn hãng sản phẩm</option>
						<option value="#">Cửa hàng ABC</option>
						<option value="#">Cửa hàng XYZ</option>
						<option value="#">Cửa hàng 123</option>
					</select>
				</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Loại: </label>
				<div class="col-sm-10">
					<select class="form-select">
						<option selected>Chọn loại sản phẩm</option>
						<option value="#">Chuột</option>
						<option value="#">Bàn phím</option>
						<option value="#">Tai nghe</option>
					</select>
				</div>
			</div>
		</div>
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

		<div class="mb-3 d-flex justify-content-end">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModal" style="width: 10%;">Thêm màu</button>
			<button class="btn btn-success mx-2" style="width: 10%;">Lưu</button>
			<button class="btn btn-secondary" onclick="showForm()"
				style="width: 10%;">Quay lại</button>
		</div>

		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 700px;">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Đánh giá
							sản phẩm</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<div class="row g-3 align-items-center">
								<label class="col-sm-2 text-xs">Màu: </label>
								<div class="col-sm-10">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="mb-3">
							<div class="row g-3 align-items-center">
								<label class="col-sm-2 text-xs">Ảnh: </label>
								<div class="col-sm-10">
									<input type="file" class="form-control">
								</div>
							</div>
						</div>
						<div class="mb-3">
							<div class="row g-3 align-items-center">
								<label class="col-sm-2 text-xs">Số lượng: </label>
								<div class="col-sm-10">
									<input type="number" class="form-control">
								</div>
							</div>
						</div>
						<div class="mb-3">
							<div class="row g-3 align-items-center">
								<label class="col-sm-2 text-xs">Giá: </label>
								<div class="col-sm-10">
									<input type="number" class="form-control">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success">Thêm màu</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>