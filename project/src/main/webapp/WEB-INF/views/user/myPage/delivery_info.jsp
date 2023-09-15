<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link rel="stylesheet" href="/resources/css/order_delivery.css">
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

	credit_id : ${ delivery.credit_id }<br>
	credit_price : ${ delivery.credit_price }<br>
	credit_way : ${ delivery.credit_way }<br>
	order_nm : ${ delivery.order_nm }<br>
	order_phone_num : ${ delivery.order_phone_num }<br>
	order_email : ${ delivery.order_email }<br>
	order_state : ${ delivery.order_state }<br>
	recipient_nm : ${ delivery.recipient_nm }<br>
	recipient_phone_num : ${ delivery.recipient_phone_num }<br>
	recipient_zip_code : ${ delivery.recipient_zip_code }<br>
	recipient_address : ${ delivery.recipient_address }<br>
	recipient_address_detail : ${ delivery.recipient_address_detail }<br>
	recipient_memo : ${ delivery.recipient_memo }<br>
	credit_date : ${ delivery.credit_date }<br>
	
	
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>