<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>CocoSua</title>
</head>
<body>
<%@ include file="/WEB-INF/views/nav_bar/product_nav.jsp"%>
<br>

<section class="product_info_page">
	<div class="product_info_location">
		<div class="product_info_box">
			<div class="product_info_imgBox">
				<img class="img-fluid" src="resources/upload/${prdt.prdt_id }/${prdt.prdt_img}" alt="..." />
			</div>
		</div>
		<div class="product_info_box">
			<div class="product_infomation_location">
				<div class="product_title_box">
					${prdt.prdt_title }
				</div>
				<div class="product_price_box">
					<div>PRICE</div>
					<div>${prdt.prdt_price }</div>
				</div>
				<div class="product_color_box">
					<div>COLOR</div>
					<div>${prdt.color_nm }</div>
				</div>
				<div class="product_total_box">
					<div>TOTAL</div>
					<div>0</div>
				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>