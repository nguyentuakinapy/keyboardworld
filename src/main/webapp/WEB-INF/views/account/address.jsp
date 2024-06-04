<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.page_account {
	margin-bottom: 30px;
	padding: 20px 0;
}

.mt-10 {
	margin-top: 10px !important;
}

.block-account p {
	font-weight: 700;
	font-size: 14px;
	line-height: 16px;
	margin-bottom: 28px;
	color: #212B25;
	position: relative;
}

.block-account ul {
	padding: 0;
	margin: 0;
	list-style: none inside;
}

.title-info {
	font-weight: 400;
	font-size: 14px;
	color: #333;
	margin-bottom: 10px;
	display: block;
}

a {
	line-height: 25px;
	text-decoration: none;
	background: transparent;
}

.title-head {
	font-size: 19px;
	line-height: 22px;
	font-weight: 400;
	color: #212B25;
	text-transform: uppercase;
	margin-bottom: 27px;
}

.active {
	color: #c9d6df;
}

.btn-class button {
	width: 15%;
	color: black;
}
</style>

<div class="page_account mt-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-xs-12 col-sm-12">
				<div class="block-account">
					<h1 class="title-head mt-10">Trang tài khoản</h1>
					<p>
						Xin chào, <span>${userS.fullName}</span> !
					</p>
					<ul>
						<li><a href="/keyboardworld/account" class="title-info">Thông
								tin tài khoản</a></li>
						<li><a href="/keyboardworld/order" class="title-info">Đơn
								hàng của bạn</a></li>
						<li><a href="/keyboardworld/changepass" class="title-info">Đổi
								mật khẩu</a></li>
						<li><a href="/keyboardworld/address/index"
							class="title-info active">Sổ địa chỉ</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-sm-12 col-xs-12">
				<h1 class="title-head mt-10">Thông tin giao hàng</h1>
				<h3 class="title-info text-danger">${message}</h3>
				<form action="/keyboardworld/address/index" method="post">
					<div class="form-floating mb-3">
						<select class="form-select" name="city" id="city">
							<c:if test="${address.city != null}">
								<option value="${address.city}" selected>${address.city}</option>
							</c:if>
							<c:if test="${address.city == null}">
								<option value="" selected>Chọn tỉnh/thành</option>
							</c:if>
						</select> <label for="city">Tỉnh/thành <span style="color: red;">*</span></label>
					</div>
					<div class="form-floating mb-3">
						<select class="form-select" name="district" id="district">
							<c:if test="${address.district != null}">
								<option value="${address.district}" selected>${address.district}</option>
							</c:if>
							<c:if test="${address.district == null}">
								<option value="" selected>Chọn quận/huyện</option>
							</c:if>
						</select> <label for="district">Quận/huyện <span
							style="color: red;">*</span></label>
					</div>
					<div class="form-floating mb-3">
						<select class="form-select" name="ward" id="ward">
							<c:if test="${address.ward != null}">
								<option value="${address.ward}" selected>${address.ward}</option>
							</c:if>
							<c:if test="${address.ward == null}">
								<option value="" selected>Chọn phường/xã</option>
							</c:if>
						</select> <label for="ward">Phường/xã <span style="color: red;">*</span></label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="addRessDetail"
							placeholder="Nhập địa chỉ của bạn"
							value="${address.addRessDetail}"> <label>Địa chỉ
							chi tiết <span style="color: red;">*</span>
						</label>
					</div>
					<div class="form-floating mb-3">
						<input type="tel" class="form-control" name="phone"
							placeholder="Nhập số điện thọai của bạn" value="${address.phone}">
						<label>Số điện thoại <span style="color: red;">*</span>
						</label>
					</div>
					<div class="btn-class">
						<button formaction="/keyboardworld/address/create"
							class="btn btn-outline-success mb-3">Thêm</button>
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#confirmDeleteModal"
							class="btn btn-outline-danger mb-3">Xóa</button>
						<button formaction="/keyboardworld/address/index"
							class="btn btn-outline-dark mb-3">Reset</button>
					</div>
				</form>
				<table class="table table-stripped table-bordered text-center">
					<tr class="table-primary">
						<th>STT</th>
						<th>Địa chỉ chi tiết</th>
						<th>Phường/xã</th>
						<th>Quận/huyện</th>
						<th>Tỉnh/thành</th>
						<th>Thao tác</th>
					</tr>
					<c:forEach var="items" items="${items}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${items.addRessDetail}</td>
							<td>${items.ward}</td>
							<td>${items.district}</td>
							<td>${items.city}</td>
							<td><a href="/keyboardworld/address/edit/${items.addRessID}"
								class="action">Chọn</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
	aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận
					xóa</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">Bạn có chắc chắn muốn xóa địa chỉ này
				không?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Hủy</button>
				<a href="/keyboardworld/address/delete/${address.addRessID}"
					class="btn btn-danger">Xóa</a>
			</div>
		</div>
	</div>
</div>
<script>
        document.querySelectorAll('.btn-group-toggle .btn').forEach(btn => {
            btn.addEventListener('click', function () {
                document.querySelectorAll('.btn-group-toggle .btn').forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
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