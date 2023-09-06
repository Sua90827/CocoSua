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
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>CocoSua</title>
</head>
<body>
	<c:if test="${empty sessionScope.loginType }">
		<%@ include file="../../nav_bar/basic_nav.jsp"%>
	</c:if>
	<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
		<%@ include file="../../nav_bar/user_nav.jsp"%>
	</c:if>
	<br>
	<% int cnt = 0; %>
	
	<div align="center">
		<table border="1">
			<tr>
				<th>Product</th>
				<th>Name</th>
				<th>Title</th>
				<th>Color</th>
				<th>Price</th>
				<th>Amount</th>
				<th>Total price</th>
				<th colspan="2"></th>
			</tr>
		    <c:forEach var="list" items="${cart }">
		    <tr>
		    	<td><img style="width:60px;" src="/resources/upload/${list.prdt_id }/${list.prdt_img}"></td>
		    	<td>${ list.prdt_nm }</td>
		    	<td>${ list.prdt_title }</td>
		    	<td>${ list.prdt_color }</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtPrice" value="${ list.prdt_price }">원</td>
		    	<td><input style="width: 50px; text-align:center;" class="prdtNum" type="text" value="${ list.cart_amount }" onchange="prdtNum('<%=cnt%>');">개</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtAllPrice" value="${ list.cart_price }">원</td>
		    	<td><a href="cartUpdate?prdt_id=${ list.prdt_id }">수정</a></td>
		    	<td><a href="cartDelete?prdt_id=${ list.prdt_id }">삭제</a></td>
		    	<% cnt++; %>
		    </tr>
		    </c:forEach>
			<tr>
				<td colspan="5"></td>
				<td>총<input style="all:unset; width: 50px; text-align:center;" readonly type="text" id="totalNum" value="">개</td>
				<td>총<input style="all:unset; width: 70px; text-align:center;" readonly type="text" id="totalPrice" value="">원</td>
				<td colspan="2"></td>
			</tr>
		</table>
	</div>
	
	<script>
		let price;
		let allPrice;
		let number;
		let numCheck = /^[0-9]+$/;
		let totalNum = 0;
		let totalPrice = 0;
		window.onload = () => {
			let numberAll = document.querySelectorAll(".prdtNum");
			let priceAll = document.querySelectorAll(".prdtAllPrice");
			price = document.querySelectorAll(".prdtPrice");
			let totalNumId = document.getElementById("totalNum");
			let totalPriceId = document.getElementById("totalPrice");
			
			for(var i = 0; i < priceAll.length; i++){
				totalPrice += Number(priceAll[i].value);
				totalNum += Number(numberAll[i].value);
			}
			totalNumId.value = totalNum;
			totalPriceId.value = totalPrice;
		}
		
		const prdtNum = (cnt) => {
			console.log(cnt);
			let count = Number(cnt);
			let numberAll = document.querySelectorAll(".prdtNum");
			number = numberAll[count].value;
			if(!numCheck.test(number)){
				alert("1이상의 숫자만 입력해주세요.");
				location.reload();
				return;
			}
			
			if(number < 1){
				alert("1이상의 숫자만 입력해주세요.");
				location.reload();
				return;
			}
			
			allPrice = document.querySelectorAll(".prdtAllPrice");
			allPrice[count].value = number * price[count].value;
			let totalNumId = document.getElementById("totalNum");
			let totalPriceId = document.getElementById("totalPrice");
			totalNum = 0;
			totalPrice = 0;
			for(var i = 0; i < allPrice.length; i++){
				totalNum += Number(numberAll[i].value);
				totalPrice += Number(allPrice[i].value);
			}
			
			totalNumId.value = totalNum;
			totalPriceId.value = totalPrice;
			return;
		}
	</script>
	<%@ include file="../../footer/footer.jsp"%>
</body>
</html>