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
<link rel="stylesheet" href="/resources/css/payment_info.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
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
	<br>
	<br>

	<div style="width: 100%; display: flex; justify-content: center;">
		<div style="width: 36%; display: flex;">
			<div>
				<div>주문자정보 | INPUT FIELD - CLIENT</div>
			</div>
		</div>
	</div>
	<div align="center">
		<div>
			<table class="client_info_table">
				<tr>
					<td width="150px;">주문하시는분</td>
					<td width="550px;">${ delivery.order_nm }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${ delivery.order_phone_num }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${ delivery.order_email }</td>
				</tr>
			</table>
		</div>
	</div>
	<div style="width: 100%; display: flex; justify-content: center;">
		<div style="width: 36%; display: flex;">
			<div>
				<div>배송지정보 | INPUT FIELD - RECIPIENT</div>
			</div>
		</div>
	</div>
	<div align="center">
		<div>
			<!-- 기존 배송지 table -->
			<table class="client_info_table table_info" style="display: inline;">
				<tr>
					<td width="150px;">받으시는분</td>
					<td width="550px;">${ delivery.recipient_nm }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${ delivery.recipient_phone_num }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						(${ delivery.recipient_zip_code }) ${ delivery.recipient_address } ${ delivery.recipient_address_detail }
					</td>
				</tr>
				<tr>
					<td>배송메모</td>
					<td>${ delivery.recipient_memo }</td>
				</tr>
			</table>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>