<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<title>CocoSua</title>
</head>
<body>
	<c:if test="${empty sessionScope.loginType }">
		<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
	</c:if>
	<c:if
		test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
		<%@ include file="/WEB-INF/views/nav_bar/user_nav.jsp"%>
	</c:if>

	<br>
	<input type="hidden" id="price" value="${prdt.prdt_price }">
	<section class="product_info_page">
		<div class="product_info_location">
			<div class="product_info_box">
				<div class="product_info_imgBox">
					<img class="img-fluid"
						src="resources/upload/${prdt.prdt_id }/${prdt.prdt_img}" alt="..." />
				</div>
			</div>
			<div class="product_info_box">
				<div class="product_infomation_location">
					<div class="product_title_box">${prdt.prdt_title }</div>
					<div class="product_price_box product_box">
						<div>PRICE</div>
						<div>${prdt.prdt_price }</div>
					</div>
					<div class="product_color_box product_box">
						<div>COLOR</div>
						<div>${prdt.color_nm }</div>
					</div>

					<form action="cart.do" method="post" id="cartForm">
						<div class="product_box">
							<input type="hidden" name="user_id"
								value="${sessionScope.user_id }"> <input type="hidden"
								name="prdt_id" value="${prdt.prdt_id }">
							<div class="product_amount_box">
								<div>수량</div>
								<div class="product_amount_div">
									<div>
										<button class="cartAddBtn" type="button" onclick="minus()">-</button>
									</div>
									<div>
										<input type="text" id="productAmount" class="productAmount"
											name="cart_amount" value="1" min="1" readonly>
									</div>
									<div>
										<button class="cartAddBtn" type="button" onclick="plus()">+</button>
									</div>
								</div>
							</div>
						</div>
						<div class="product_total_box product_box">
							<div>TOTAL</div>
							<div>
								<input type="text" id="totalPrice" class="totalPrice"
									name="cart_price" value="${prdt.prdt_price }" readonly>원
							</div>
						</div>
					</form>

					<!-- Button Items -->

					<div id="buttonItemsDiv">
						<a onclick="directPay();" id="directPayBtn" style="width: 47%; display: flex; justify-content: center;">
							<span>즉시구매</span>
						</a>
						<a id="cartAddBtn" onclick="cartAdd()">
							<span><img src="resources/img/cart.png" style="width:30px;"></span>
						</a> 
						<a onclick="wish();" style="width: 20%; display: flex; justify-content: center;" id="heartBtn">
							<c:if test="${ not empty wish  }">
								<span id="heartTxt">♥</span>
							</c:if>
							<c:if test="${ empty wish  }">
								<span id="heartTxt">♡</span>
							</c:if>
						</a>

					</div>

					<!-- Button Items -->
				</div>
			</div>
		</div>
	</section>


	<!-- 즉시구매 Form -->
	<form action="directPaymentInfo" method="post" id="directForm">
		<input type="hidden" value="${ sessionScope.user_id }" name="member_id"> 
		<input type="hidden" value="${prdt.prdt_id }" name="prdt_id"> 
		<input type="hidden" value="" name="amount" id="amount">
	</form>
	<!-- 즉시구매 Form -->

	<!-- insertWish 이미 db에 담겨 있는 상품이라면 deleteWish로!! -->
	<c:if test="${ empty wish }">
		<form action="insertWish" method="post" id="wishForm">
			<input type="hidden" name="user_id" value="${sessionScope.user_id }">
			<input type="hidden" name="prdt_id" value="${prdt.prdt_id }">
		</form>
	</c:if>
	<c:if test="${ not empty wish }">
		<form action="deleteWish" method="post" id="wishForm">
			<input type="hidden" name="user_id" value="${sessionScope.user_id }">
			<input type="hidden" name="prdt_id" value="${prdt.prdt_id }">
		</form>
	</c:if>
	<!-- insertWish 이미 db에 담겨 있는 상품이라면 deleteWish로!! -->
	
	<hr>
	<div>
		리뷰<br>
		<table border='1'>
			<tr>
				<!-- <th>No.</th> -->
				<th>작성자</th><th>제목</th><th>구매상품</th><th>작성일</th><th>조회수</th>
			</tr>
				<c:forEach var = "review" items="${reviews }" >
				<tr>
					<!-- <td>${review.review_no }</td> -->
					<td>${review.user_id }</td>
					<td><a href="review_detail?review_no=${review.review_no }">${review.title }</a></td>
					<td>${review.prdt_title }<br>${review.prdt_nm }<br>${review.prdt_color }</td>
					<td>${review.save_date }</td><td>${review.hit }</td>
				</tr>
				</c:forEach>
		</table>
		<!-- <a href = "">상세페이지</a><a hef = "view_reviews" -->
	</div>

	<script src="/resources/js/product_info.js"></script>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>