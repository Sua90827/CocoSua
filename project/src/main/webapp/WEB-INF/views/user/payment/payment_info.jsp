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
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>CocoSua</title>
</head>
<body>
	<c:if test="${ empty sessionScope.loginType }">
		<%@ include file="../../nav_bar/basic_nav.jsp"%>
	</c:if>
	<c:if test="${ sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
		<%@ include file="../../nav_bar/user_nav.jsp"%>
	</c:if>
	<br>
	<div style="width:100%; display:flex; justify-content: center;">
		<div style="width:57%; display:flex;">
		<div>
			<div>
				현재 선택하신 상품 | Your shopping cart item
			</div>
		</div>
		</div>
	</div>
	<div align="center">
		<table class="cart_info_table">
			<tr>
				<th style="padding: 0px 15px;">상품 사진</th>
				<th style="width:750px;">상품명</th>
				<th>판매가</th>
				<th style="padding:0px 10px;">수량</th>
				<th>합계</th>
			</tr>
			<c:if test="${ cart.size() eq 0 }">
				<tr>
					<td colspan="5">상품을 담아주세요</td>
				</tr>
			</c:if>
		    <c:forEach var="list" items="${cart }">
		    <tr>
		    	<td><a href="userPrdtInfo?prdt_id=${ list.prdt_id }"><img style="width:40px;" src="/resources/upload/${list.prdt_id }/${list.prdt_img}"></a></td>
		    	<td style="text-align: left;">
		    		<span style="padding-left:10px;">${ list.prdt_title }</span>(name:${ list.prdt_nm } color:${ list.prdt_color })
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtPrice" value="${ list.prdt_price }">원</td>
		    	<td>
		    		<input style="all:unset; width: 30px; text-align:center;" class="prdtNum" type="text" value="${ list.cart_amount }" onchange="prdtNum();" readonly>
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtAllPrice" value="${ list.cart_price }">원</td>
		    </tr>
		    </c:forEach>
		</table>
	</div>
	<div style="width:100%; display:flex; justify-content: center;">
		<div style="width:57%; display:flex; justify-content:right;">
		<div>
			<div>
				Product Price : <input style="all:unset; width: 60px; text-align:right;" type="text" readonly id="totalPrice">
			</div>
		</div>
		</div>
	</div>
	<div style="width:100%; display:flex; justify-content: center;">
		<div style="width:57%; display:flex;">
		<div>
			<div>
				1 결재수단 | SELECT PAYMENT
			</div>
		</div>
		</div>
	</div>
	<div align="center">
		<div>
			<table class="client_info_table">
				<tr>
					<td width="150px;">결제방식</td>
					<td width="950px;">카카오페이</td>
				</tr>
				<tr>
					<td>총결제금액</td>
					<td><input style="all:unset; width: 60px; color:red;" type="text" readonly id="paymentPrice">원</td>
				</tr>
			</table>
		</div>
	</div>
	<div style="width:100%; display:flex; justify-content: center;">
		<div style="width:57%; display:flex;">
		<div>
			<div>
				2 주문자정보 | INPUT FIELD - CLIENT
			</div>
		</div>
		</div>
	</div>
	<div align="center">
		<div>
			<table class="client_info_table">
				<tr>
					<td width="150px;">주문하시는분</td>
					<td width="950px;"><input type="text" value="${ member.member_nm }"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="phone1" value="">-<input type="text" id="phone2" value="">-<input type="text" id="phone3" value=""></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" value="${ member.member_email }"></td>
				</tr>
			</table>
		</div>
	</div>
	<div style="width:100%; display:flex; justify-content: center;">
		<div style="width:57%; display:flex;">
		<div>
			<div>
				3 배송지정보 | INPUT FIELD - RECIPIENT
			</div>
		</div>
		</div>
	</div>
	<div align="center">
		<div>
		<input type="hidden" id="memberPhone" value="${ member.member_phone_num }">
			<table class="client_info_table">
				<tr>
					<td width="150px;">기존배송지</td>
					<td width="950px;"></td>
				</tr>
				<tr>
					<td>받으시는분</td>
					<td></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td><input type="text" id="reciPhone1" value="">-<input type="text" id="reciPhone2" value="">-<input type="text" id="reciPhone3" value=""></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" readonly><button>우편번호</button><br>
						<input type="text" readonly><br>
						<input type="text">
					</td>
				</tr>
				<tr>
					<td>배송메모</td>
					<td>
						<input type="text"><br>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div align="center">
		<a href="#">주문하기</a>
	</div>
	<script src="resources/js/payment_info.js"></script>
    <c:forEach var="list" items="${cart }">
	    user_id = ${ list.user_id }<br>
	    prdt_id = ${ list.prdt_id }<br>
	    cate_id = ${ list.cate_id }<br>
	    prdt_nm = ${ list.prdt_nm }<br>
	    prdt_img = ${ list.prdt_img }<br>
	    prdt_title = ${ list.prdt_title }<br>
	    prdt_color = ${ list.prdt_color }<br>
	    prdt_price = ${ list.prdt_price }<br>
	    cart_amount = ${ list.cart_amount }<br>
	    cart_price = ${ list.cart_price }<br>
	    
    </c:forEach>
    
   	 	member_id = ${ member.member_id }<br>
	    member_nm = ${ member.member_nm }<br>
	    member_email = ${ member.member_email }<br>
	    member_birth = ${ member.member_birth }<br>
	    member_phone = ${ member.member_phone_num }<br>
	    member_zip_code = ${ member.member_zip_code }<br>
	    member_address = ${ member.member_address } ${ member_address_detail }<br>
	<%@ include file="../../footer/footer.jsp"%>
</body>
</html>