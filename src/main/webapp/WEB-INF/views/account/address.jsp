<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<form action="#">
	<div class="page_account">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-xs-12 col-sm-12">
					<div class="block-account">
						<h1 class="title-head mt-10">Trang tài khoản</h1>
						<p>
							Xin chào, <span>Nguyễn Phi Hùng</span> !
						</p>
						<ul>
							<li><a href="/keyboardworld/account"
								class="title-info active">Thông tin tài khoản</a></li>
							<li><a href="/keyboardworld/order" class="title-info">Đơn
									hàng của bạn</a></li>
							<li><a href="/keyboardworld/changepass" class="title-info">Đổi
									mật khẩu</a></li>
							<li><a href="/keyboardworld/address" class="title-info">Sổ
									địa chỉ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9 col-sm-12 col-xs-12">
					<h1 class="title-head mt-10">Thông tin giao hàng</h1>
					<div class="form-floating mb-3">
						<select class="form-select" id="city">
							<option value="" selected>Chọn tỉnh/thành</option>
						</select> <label for="city">Tỉnh/thành <span style="color: red;">*</span></label>
					</div>
					<div class="form-floating mb-3">
						<select class="form-select" id="district">
							<option value="" selected>Chọn quận/huyện</option>
						</select> <label for="district">Quận/huyện <span
							style="color: red;">*</span></label>
					</div>
					<div class="form-floating mb-3">
						<select class="form-select" id="ward">
							<option value="" selected>Chọn phường/xã</option>
						</select> <label for="ward">Phường/xã <span style="color: red;">*</span></label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control"
							placeholder="Nhập địa chỉ của bạn" value=""> <label>Địa
							chỉ chi tiết <span style="color: red;">*</span>
						</label>
					</div>
					<div class="form-floating mb-3">
						<input type="tel" class="form-control"
							placeholder="Nhập số điện thọai của bạn" value=""> <label>Số
							điện thoại <span style="color: red;">*</span>
						</label>
					</div>
					<div class="btn-class">
						<button class="btn btn-outline-success mb-3">Thêm</button>
						<button class="btn btn-outline-warning mb-3">Sửa</button>
						<button class="btn btn-outline-danger mb-3">Xóa</button>
					</div>
					<table class="table table-stripped table-bordered text-center">
						<tr class="table-primary">
							<th>STT</th>
							<th>Tỉnh/thành</th>
							<th>Quận/huyện</th>
							<th>Phường/xã</th>
							<th>Địa chỉ chi tiết</th>
							<th>Thao tác</th>
						</tr>
						<tr>
							<td>1</td>
							<td>Ninh Thuận</td>
							<td>Thuận Nam</td>
							<td>Phước Diêm</td>
							<td>Lạc Tân 3</td>
							<td><a href="#" class="action">Chọn</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</form>
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
                citis.options[citis.options.length] = new Option(x.Name, x.Id);
            }
            citis.onchange = function () {
                district.length = 1;
                ward.length = 1;
                if (this.value != "") {
                    const result = data.filter(n => n.Id === this.value);

                    for (const k of result[0].Districts) {
                        district.options[district.options.length] = new Option(k.Name, k.Id);
                    }
                }
            };
            district.onchange = function () {
                ward.length = 1;
                const dataCity = data.filter((n) => n.Id === citis.value);
                if (this.value != "") {
                    const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                    for (const w of dataWards) {
                        wards.options[wards.options.length] = new Option(w.Name, w.Id);
                    }
                }
            };
        }
</script>