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
<link rel="stylesheet" href="/resources/css/cart_info.css">
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
	
	<div style="width:100%; display:flex; justify-content: center;">
		<div style="width:57%; display:flex; justify-content:right;">
		<div style="width:30%; border: solid 1px rgba(0, 0, 0, 0.1);">
			<table>
				<tr>
					<th style="text-align: left; width:50%; background-color:white; color: black;">-total quantity</th>
					<td><input style="all:unset; width:100%; text-align:right; border-left: solid 1px rgba(0, 0, 0, 1);" readonly type="text" id="totalNum" value=""></td>
				</tr>
				<tr>
					<th style="text-align: left; width:50%; background-color:white; color: black;">-total price</th>
					<td><input style="all:unset; width:100%; text-align:right; border-left: solid 1px rgba(0, 0, 0, 1);" readonly type="text" id="totalPrice" value=""></td>
				</tr>
			</table>
		</div>
		</div>
	</div>
	
	<div align="center">
		<table class="cart_info_table">
			<tr>
				<th style="padding: 0px 15px;">image</th>
				<th style="width:630px;">product</th>
				<th>price</th>
				<th style="padding:0px 10px;">quantity</th>
				<th>total price</th>
				<th colspan="2" style="width:100px;"></th>
			</tr>
		    <c:forEach var="list" items="${cart }">
		    <tr>
		    	<td><a href="userPrdtInfo?prdt_id=${ list.prdt_id }"><img style="width:40px;" src="/resources/upload/${list.prdt_id }/${list.prdt_img}"></a></td>
		    	<td style="text-align: left;">
		    		<span style="padding-left:10px;">${ list.prdt_title }</span><br>
		    		<span style="padding-left:10px;">(name:${ list.prdt_nm } color:${ list.prdt_color })</span>
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtPrice" value="${ list.prdt_price }">원</td>
		    	<td><input style="width: 50px; text-align:center;" class="prdtNum" type="text" value="${ list.cart_amount }" onchange="prdtNum('<%=cnt%>');">개</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtAllPrice" value="${ list.cart_price }">원</td>
		    	<td><a href="cartUpdate?prdt_id=${ list.prdt_id }">수정</a></td>
		    	<td><a href="cartDelete?prdt_id=${ list.prdt_id }">삭제</a></td>
		    	<% cnt++; %>
		    </tr>
		    </c:forEach>
		</table>
	</div>
	<div style="width:100%; display:flex; justify-content: center;">
		<div style="width:57%; display:flex; justify-content:right;">
		<div>
			<div>
				total price : <input style="all:unset; width: 60px; text-align:right;" type="text" readonly id="totalPrice2">
			</div>
			<div style="text-align: right;">
				<a href="paymentInfo">주문하기</a>
			</div>
		</div>
		</div>
	</div>
	<script src="/resources/js/cart_info.js"></script>
	<%@ include file="../../footer/footer.jsp"%>
</body>
</html>