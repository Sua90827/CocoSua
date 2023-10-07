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
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
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
<div align="center">
<% 
	int cnt = 0;
	int index = 0;
%>
<c:forEach var="list" items="${orderList }">
	<c:set var="cnt" value="0" />
	<!-- 
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
	-->
	<div style="width: 900px; display:flex;"><div style="width:50%; text-align:left;">${ list.credit_date }</div>
<%-- 	<div style="width:50%; text-align:right;"><button type="button" class="deliveryBtn" onclick="deliveryBtn('<%= cnt %>');">배송정보</button></div> --%>
	</div>
		<table class="order_list_table">
			<tr>
				<th style="width:60px;">IMG</th>
				<th style="width:500px;">TITLE</th>
				<th style="width:120px;">PRICE</th>
				<th style="width:100px;">AMOUNT</th>
				<th style="width:120px;">ALLPRICE</th>
				<th style="width:120px;"></th>
			</tr>
	<c:forEach var="product" items="${ list.productOrderDTO }">
			<tr>
		    	<td><a href="userPrdtInfo?prdt_id=${ product.prdt_id }"><img style="width:40px;" src="/resources/upload/${product.prdt_id }/${product.prdt_img}"></a></td>
		    	<td style="text-align: left;">
		    		<span style="padding-left:10px;">${ product.prdt_title }</span>
		    		<span style="padding-left:10px;">(name:${ product.prdt_nm } color:${ product.prdt_color })</span>
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtPrice" value="${ product.prdt_price }">원</td>
		    	<td>
		    		<input style="all:unset; width: 30px; text-align:center;" class="prdtNum" type="text" value="${ product.prdt_amount }" readonly> 개
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtAllPrice" value="">원</td>
		    	<c:if test="${ product.review_check eq 0 }"><td><a href="writingReview?user_id=${user_id }&prdt_title=${ product.prdt_title }&prdt_nm=${ product.prdt_nm }&prdt_id=${ product.prdt_id }&prdt_color=${ product.prdt_color }&index=<%=index++%>&credit_id=${list.credit_id}">Review</a></td></c:if>
		    	<c:if test="${ product.review_check eq 1 }"><td>Review 완료<%index++; %></td></c:if>.
		    	
		    </tr>
	</c:forEach>
		</table>
		<div style="width:48%; text-align:left;">
			<a onclick="deliveryInfoBlock('<%= cnt %>')" class="deliveryInfoView" style="display:flex; cursor: pointer;">▶ 배송정보</a>
			<a onclick="deliveryInfoNone('<%= cnt %>')" class="deliveryInfoNonView" style="display:none; cursor: pointer;">▼ 배송정보</a>
		</div>
		<div style="width: 48%; text-align:left; display:none;" class="deleveryInfoDiv">
		<hr>
			<div style="width: 100%;">
				<div style="width: 100%; display: flex;">
					<div>
						<div style="padding-left: 10px;"><b>주문자정보 | INPUT FIELD - CLIENT</b></div>
					</div>
				</div>
			</div>
			<div>
				<div>
					<table class="client_info_table">
						<tr>
							<th width="150px;"><b>주문하시는분</b></th>
							<td width="950px;">${ list.order_nm }</td>
						</tr>
						<tr>
							<th><b>전화번호</b></th>
							<td>${ list.order_phone_num }</td>
						</tr>
						<tr>
							<th><b>이메일</b></th>
							<td>${ list.order_email }</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="width: 100%;">
				<div style="width: 100%; display: flex;">
					<div>
						<div style="padding-left: 10px;"><b>배송지정보 | INPUT FIELD - RECIPIENT</b></div>
					</div>
				</div>
			</div>
			<div>
				<div>
					<!-- 기존 배송지 table -->
					<table class="client_info_table" style="display: inline;">
						<tr>
							<th width="150px;"><b>받으시는분</b></th>
							<td width="950px;">${ list.recipient_nm }</td>
						</tr>
						<tr>
							<th><b>전화번호</b></th>
							<td>${ list.recipient_phone_num }</td>
						</tr>
						<tr>
							<th><b>주소</b></th>
							<td>
								(${ list.recipient_zip_code }) ${ list.recipient_address } ${ list.recipient_address_detail }
							</td>
						</tr>
						<tr>
							<th><b>배송메모</b></th>
							<td>${ list.recipient_memo }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<br><br>
		
		<form action="delivery.do" method="post" class="deliveryForm">
			<input type="hidden" name="credit_id" value="${ list.credit_id }">
			<input type="hidden" name="credit_price" value="${ list.credit_price }">
			<input type="hidden" name="credit_way" value="${ list.credit_way }">
			<input type="hidden" name="order_nm" value="${ list.order_nm }">
			<input type="hidden" name="order_phone_num" value="${ list.order_phone_num }">
			<input type="hidden" name="order_email" value="${ list.order_email }">
			<input type="hidden" name="order_state" value="${ list.order_state }">
			<input type="hidden" name="recipient_nm" value="${ list.recipient_nm }">
			<input type="hidden" name="recipient_phone_num" value="${ list.recipient_phone_num }">
			<input type="hidden" name="recipient_zip_code" value="${ list.recipient_zip_code }">
			<input type="hidden" name="recipient_address" value="${ list.recipient_address }">
			<input type="hidden" name="recipient_address_detail" value="${ list.recipient_address_detail }">
			<input type="hidden" name="recipient_memo" value="${ list.recipient_memo }">
			<input type="hidden" name="credit_date" value="${ list.credit_date }">
		</form>
		<% 
			cnt++;
			index = 0;
		%>
		
</c:forEach>
</div>

<script src="resources/js/order_list.js"></script>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>