<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="mb-4">
				<h4 class="header-title"
					style="border-bottom: 1px solid #6e768e; padding-bottom: 16px">Chỉnh
					Sửa Sản Phẩm</h4>
			</div>
		</div>
	</div>
	<form:form action="/keyboardworld/admin/editproduct" method="post"
		modelAttribute="product" enctype="multipart/form-data">
		<form:hidden path="productID"></form:hidden>
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
					<form:select path="brand.brandID" class="form-select"
						id="brandSelect">
						<c:forEach items="${brands}" var="brand">
							<option value="${brand.brandID}"
								<c:if test="${brand.brandID eq product.brand.brandID}">selected</c:if>>${brand.name}</option>
						</c:forEach>
						<option value="newBrand">Thêm hãng mới</option>
					</form:select>
				</div>
			</div>
		</div>

		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Loại: </label>
				<div class="col-sm-10">
					<select name="category.categoryID" class="form-select"
						id="categorySelect">
						<c:forEach items="${categories}" var="category">
							<option value="${category.categoryID}"
								<c:if test="${category.categoryID eq product.category.categoryID}">selected</c:if>>${category.name}</option>
						</c:forEach>
						<option value="newCategory">Thêm loại mới</option>
					</select>
				</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="row g-3 align-items-center">
				<label class="col-sm-2 text-xs">Hình ảnh: </label>
				<div class="col-sm-5">
					<input name="gallery" type="file" class="form-control" />
				</div>
				<div class="col-sm-5">
					<input value="${nameGallery}" readonly type="text"
						class="form-control" />
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
		<c:if test="${details == null}">
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="width: 700px;">
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
										<input name="color" type="text" class="form-control" />
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
										<input name="quantity" type="number" class="form-control" />
									</div>
								</div>
							</div>
							<div class="mb-3">
								<div class="row g-3 align-items-center">
									<label class="col-sm-2 text-xs">Giá: </label>
									<div class="col-sm-10">
										<input name="price" type="number" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit"
								formaction="/keyboardworld/admin/newproductdetail"
								class="btn btn-success">Thêm màu</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</form:form>
	<table class="table table-bordered" style="width: 100%;">
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

			<c:if test="${details == null}">
				<c:forEach var="pd" items="${productDetails}" varStatus="status">
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
						<td class="text-center"><a
							href="/keyboardworld/admin/removelistproductdetail/${status.index}"><i
								class="bi bi-trash text-danger"></i></a></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${details != null}">
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
						<td class="text-center"><a
							href="/keyboardworld/admin/removeproductdetail/${pd.productDetailID}"><i
								class="bi bi-trash text-danger"></i></a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<!-- End List Color -->
	<c:if test="${details != null}">
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<form:form class="modal-content" enctype="multipart/form-data"
					action="/keyboardworld/admin/addproductdetail"
					style="width: 700px;" modelAttribute="detail">
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
									<input type="file" name="thumbnailadd" class="form-control">
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
	</c:if>

	<!-- Start Modal Add Category -->
	<div class="modal fade" id="addCategoryModal" tabindex="-1"
		aria-labelledby="addCategoryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form class="modal-content" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="addCategoryModalLabel">Thêm loại
						sản phẩm</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<div class="row g-3 align-items-center">
							<label class="col-sm-12 text-xs">Tên loại: </label>
							<div class="col-sm-12">
								<input name="name" type="text" class="form-control">
							</div>
						</div>
					</div>
					<input type="hidden" id="currentUrlCategory" name="currentUrl"
						value="">
				</div>
				<div class="modal-footer">
					<button type="submit" formaction="/keyboardworld/admin/addcategory"
						class="btn btn-success">Lưu</button>
				</div>
			</form>
		</div>
	</div>
	<!-- End Modal Add Category -->

	<!-- Start Modal Add Brand -->
	<div class="modal fade" id="addBrandModal" tabindex="-1"
		aria-labelledby="addBrandModalLabel" aria-hidden="true">
		<form class="modal-dialog" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addCategoryModalLabel">Thêm hãng
						mới</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
							<div class="form-floating mb-3">
								<select class="form-select" name="city" id="city">
									<option value="" selected>Chọn tỉnh/thành</option>
								</select> <label for="city">Tỉnh/thành <span style="color: red;">*</span></label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<select class="form-select" name="district" id="district">
									<option value="" selected>Chọn quận/huyện</option>
								</select> <label for="district">Quận/huyện <span
									style="color: red;">*</span></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="form-floating mb-3">
								<select class="form-select" name="ward" id="ward">
									<option value="" selected>Chọn phường/xã</option>
								</select> <label for="ward">Phường/xã <span style="color: red;">*</span></label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="addRessDetail"
									placeholder="Nhập địa chỉ của bạn" required> <label>Địa
									chỉ chi tiết <span style="color: red;">*</span>
								</label>
							</div>
						</div>
					</div>
					<div class="form-floating mb-3">
						<input type="tel" class="form-control" name="phone"
							placeholder="Nhập số điện thọai của bạn" required> <label>Số
							điện thoại <span style="color: red;">*</span>
						</label>
					</div>
					<div class="form-floating mb-3">
						<input type="email" class="form-control" name="email"
							placeholder="Nhập email của bạn" required> <label>Email
							<span style="color: red;">*</span>
						</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="name"
							placeholder="Nhập tên" required> <label>Tên hãng
							<span style="color: red;">*</span>
						</label>
					</div>
					<input type="hidden" id="currentUrlBrand" name="currentUrl"
						value="">
				</div>
				<div class="modal-footer">
					<button type="submit" formaction="/keyboardworld/admin/addbrand"
						class="btn btn-success">Lưu</button>
				</div>
			</div>
		</form>
	</div>
	<!-- End Modal Add Brand -->
</div>
<script>
	document.getElementById('categorySelect').addEventListener(
			'change',
			function() {
				if (this.value === 'newCategory') {
					var myModal = new bootstrap.Modal(document
							.getElementById('addCategoryModal'));
					myModal.show();
				}
			});

	document.getElementById('brandSelect').addEventListener(
			'change',
			function() {
				if (this.value === 'newBrand') {
					var myModal = new bootstrap.Modal(document
							.getElementById('addBrandModal'));
					myModal.show();
				}
			});

	document.addEventListener("DOMContentLoaded", function() {
	    var addBrandModal = document.getElementById('addBrandModal');
	    var addCategoryModal = document.getElementById('addCategoryModal');
	    var currentUrlFieldBrand = document.getElementById('currentUrlBrand');
	    var currentUrlFieldCategory = document.getElementById('currentUrlCategory');

	    // Sự kiện khi modal Add Brand được mở
	    addBrandModal.addEventListener('shown.bs.modal', function () {
	        currentUrlFieldBrand.value = window.location.href;
	    });

	    // Sự kiện khi modal Add Category được mở
	    addCategoryModal.addEventListener('shown.bs.modal', function () {
	        currentUrlFieldCategory.value = window.location.href;
	    });
	});
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
var citis = document.getElementById("city");
var districts = document.getElementById("district");
var wards = document.getElementById("ward");
var Parameter = {
    url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
    method: "GET",
    responseType: "application/json",
};
var promise = axios(Parameter);
promise.then(function (result) {
    renderCity(result.data);
});

function renderCity(data) {
    for (const x of data) {
        citis.options[citis.options.length] = new Option(x.Name, x.Name); // Sử dụng x.Name cho cả text và value
    }
    citis.onchange = function () {
        districts.length = 1;
        wards.length = 1;
        if (this.value != "") {
            const result = data.filter(n => n.Name === this.value); // So sánh với Name thay vì Id

            for (const k of result[0].Districts) {
                districts.options[districts.options.length] = new Option(k.Name, k.Name); // Sử dụng k.Name cho cả text và value
            }
        }
    };
    districts.onchange = function () {
        wards.length = 1;
        const dataCity = data.filter((n) => n.Name === citis.value); // So sánh với Name thay vì Id
        if (this.value != "") {
            const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards; // So sánh với Name thay vì Id

            for (const w of dataWards) {
                wards.options[wards.options.length] = new Option(w.Name, w.Name); // Sử dụng w.Name cho cả text và value
            }
        }
    };
}
</script>