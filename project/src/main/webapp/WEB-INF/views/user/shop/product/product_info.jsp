<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<title>CocoSua</title>
</head>
<body>
<c:if test="${empty sessionScope.loginType }">
	<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
</c:if>
<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
	<%@ include file="/WEB-INF/views/nav_bar/user_nav.jsp"%>
</c:if>

<br>

<section class="product_info_page">
	<div class="product_info_location">
		<div class="product_info_box">
			<div class="product_info_imgBox">
				<img class="img-fluid" src="resources/upload/${prdt.prdt_id }/${prdt.prdt_img}" alt="..." />
			</div>
		</div>
		<div class="product_info_box">
			<div>
				<div>
					${prdt.prdt_title }
				</div>
				<div>
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