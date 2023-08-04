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
<input type="hidden" id="price" value="${prdt.prdt_price }">
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
				<div class="product_amount_box">
					<div>수량</div>
					<div><button onclick="minus()">-</button></div>
					<div><input type="text" id="productAmount" class="productAmount" name="cart_amount" value="0" readonly></div>
					<div><button onclick="plus()">+</button></div>
				</div>
				<div class="product_total_box">
					<div>TOTAL</div>
					<div><input type="text" id="totalPrice" class="totalPrice" name="cart_price" value="0" readonly></div>
				</div>
				<div>담기</div>
				<div>즉시구매</div>
			</div>
		</div>
	</div>
</section>
<script>

	
	
	function plus(){
		var plus = document.getElementById("productAmount").value;
		var price = document.getElementById("price").value;
		
		plus++;
		document.getElementById("productAmount").value = plus;
		document.getElementById("totalPrice").value = plus*price;
	}
	
	function minus(){
		var minus = document.getElementById("productAmount").value;
		var price = document.getElementById("price").value;
		minus--;
		if(minus < 0){
			minus = 0;
		}
		document.getElementById("productAmount").value = minus;
		document.getElementById("totalPrice").value = minus*price;
	}
</script>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>