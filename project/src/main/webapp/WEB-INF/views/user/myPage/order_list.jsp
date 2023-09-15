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
<c:forEach var="list" items="${orderList }">
<hr>
	credit_id : ${ list.credit_id }<br>
	user_id : ${ list.user_id }<br>
	credit_price : ${ list.credit_price }<br>
	credit_way : ${ list.credit_way }<br>
	order_nm : ${ list.order_nm }<br>
	order_phone_num : ${ list.order_phone_num }<br>
	order_email : ${ list.order_email }<br>
	order_state : ${ list.order_state }<br>
		<table border="1">
			<tr>
				<th>IMG</th>
				<th>TITLE</th>
				<th>PRICE</th>
				<th>AMOUNT</th>
				<th>ALLPRICE</th>
			</tr>
	<c:forEach var="product" items="${ list.productOrderDTO }">
			<tr>
		    	<td><a href="userPrdtInfo?prdt_id=${ product.prdt_id }"><img style="width:40px;" src="/resources/upload/${product.prdt_id }/${product.prdt_img}"></a></td>
		    	<td style="text-align: left;">
		    		<span style="padding-left:10px;">${ product.prdt_title }</span><br>
		    		<span style="padding-left:10px;">(name:${ product.prdt_nm } color:${ product.prdt_color })</span>
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtPrice" value="${ product.prdt_price }">원</td>
		    	<td>
		    		<input style="all:unset; width: 30px; text-align:center;" class="prdtNum" type="text" value="${ product.prdt_amount }" readonly>
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtAllPrice" value="">원</td>
		    </tr>
	</c:forEach>
		</table>
	recipient_nm : ${ list.recipient_nm }<br>
	recipient_phone_num : ${ list.recipient_phone_num }<br>
	recipient_zip_code : ${ list.recipient_zip_code }<br>
	recipient_address : ${ list.recipient_address }<br>
	recipient_address_detail : ${ list.recipient_address_detail }<br>
	recipient_memo : ${ list.recipient_memo }<br>
	credit_date : ${ list.credit_date }<br>
	<hr>
</c:forEach>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>