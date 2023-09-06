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
    <c:forEach var="list" items="${cart }">
	    prdt_id : ${ list.prdt_id }<br>
	    cate_id : ${list.cate_id }<br>
	    prdt_nm : ${ list.prdt_nm }<br>
	    prdt_img : ${ list.prdt_img }<br>
	    prdt_title : ${ list.prdt_title }<br>
	    prdt_color : ${ list.prdt_color } <br>
	    prdt_price : ${ list.prdt_price } <br>
	    cart_amount : ${ list.cart_amount }<br>
	    cart_price : ${ list.cart_price }
    </c:forEach>
	<%@ include file="../../footer/footer.jsp"%>
</body>
</html>