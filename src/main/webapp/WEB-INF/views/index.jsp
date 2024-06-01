<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KEYBOARD WORLD</title>
<link rel="icon" type="image/x-icon" href="/images/AkinaKB.png">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/style/index.css">
<link rel="stylesheet" href="/style/detailproduct.css">
<link rel="stylesheet" href="/style/product.css">
<link rel="stylesheet" href="/style/cart.css">
<style>
html, body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.text-truncate {
	white-space: nowrap; /* Ngăn không cho văn bản xuống dòng */
	overflow: hidden; /* Ẩn phần vượt quá */
	text-overflow: ellipsis;
	/* Hiển thị dấu ba chấm (...) khi văn bản vượt quá */
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp"></jsp:include>
	<jsp:include page="${views}"></jsp:include>
	<jsp:include page="/WEB-INF/views/home/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/js/detailproduct.js"></script>
<script type="text/javascript" src="/js/account.js"></script>
<script
	src="
    https://cdn.jsdelivr.net/npm/wowjs@1.1.3/dist/wow.min.js
    "></script>
<link
	href="
    https://cdn.jsdelivr.net/npm/wowjs@1.1.3/css/libs/animate.min.css
    "
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	new WOW().init();
</script>
</html>
