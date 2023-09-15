<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link rel="stylesheet" href="/resources/css/order_list.css">
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

	credit_id : ${ list.credit_id }<br>
	credit_price : ${ list.credit_price }<br>
	credit_way : ${ list.credit_way }<br>
	order_nm : ${ list.order_nm }<br>
	order_phone_num : ${ list.order_phone_num }<br>
	order_email : ${ list.order_email }<br>
	order_state : ${ list.order_state }<br>
	recipient_nm : ${ list.recipient_nm }<br>
	recipient_phone_num : ${ list.recipient_phone_num }<br>
	recipient_zip_code : ${ list.recipient_zip_code }<br>
	recipient_address : ${ list.recipient_address }<br>
	recipient_address_detail : ${ list.recipient_address_detail }<br>
	recipient_memo : ${ list.recipient_memo }<br>
	credit_date : ${ list.credit_date }<br>
	
	
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>