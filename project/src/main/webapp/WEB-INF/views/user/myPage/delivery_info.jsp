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
	<%-- <br> credit_id : ${ delivery.credit_id }
	<br> credit_price : ${ delivery.credit_price }
	<br> credit_way : ${ delivery.credit_way }
	<br> order_nm : ${ delivery.order_nm }
	<br> order_phone_num : ${ delivery.order_phone_num }
	<br> order_email : ${ delivery.order_email }
	<br> order_state : ${ delivery.order_state }
	<br> recipient_nm : ${ delivery.recipient_nm }
	<br> recipient_phone_num : ${ delivery.recipient_phone_num }
	<br> recipient_zip_code : ${ delivery.recipient_zip_code }
	<br> recipient_address : ${ delivery.recipient_address }
	<br> recipient_address_detail : ${ delivery.recipient_address_detail }
	<br> recipient_memo : ${ delivery.recipient_memo }
	<br> credit_date : ${ delivery.credit_date } --%>

	<div style="width: 100%; display: flex; justify-content: center;">
		<div style="width: 57%; display: flex;">
			<div>
				<div>2 주문자정보 | INPUT FIELD - CLIENT</div>
			</div>
		</div>
	</div>
	<div align="center">
		<div>
			<table class="client_info_table">
				<tr>
					<td width="150px;">주문하시는분</td>
					<td width="950px;">${ delivery.order_nm }</td>
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
		<div style="width: 57%; display: flex;">
			<div>
				<div>3 배송지정보 | INPUT FIELD - RECIPIENT</div>
			</div>
		</div>
	</div>
	<div align="center">
		<div>
			<!-- 기존 배송지 table -->
			<table class="client_info_table table_info" style="display: inline;">
				<tr>
					<td>받으시는분</td>
					<td>${ delivery.recipient_nm }</td>
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