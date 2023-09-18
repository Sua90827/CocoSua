<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link rel="stylesheet" href="/resources/css/payment_info.css">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
			<c:if test="${ empty product }">
				<tr>
					<td colspan="5">상품을 담아주세요</td>
				</tr>
			</c:if>
		    <tr>
		    	<td><a href="userPrdtInfo?prdt_id=${ product.prdt_id }"><img style="width:40px;" src="/resources/upload/${product.prdt_id }/${product.prdt_img}"></a></td>
		    	<td style="text-align: left;">
		    		<span style="padding-left:10px;">${ product.prdt_title }</span>(name:${ product.prdt_nm } color:${ product.prdt_color })
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtPrice" value="${ product.prdt_price }">원</td>
		    	<td>
		    		<input style="all:unset; width: 30px; text-align:center;" class="prdtNum" type="text" value="${ amount }" onchange="prdtNum();" readonly>
		    	</td>
		    	<td><input style="all:unset; width: 70px; text-align:center;" type="text" readonly class="prdtAllPrice" value="">원</td>
		    </tr>
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
					<td width="950px;">
						<input type="radio" class="creditWay" name="credit_way" value="1" checked>카카오페이
					</td>
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
					<td width="950px;"><input type="text" id="order_nm" value="${ member.member_nm }"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="phone1" value="">-<input type="text" id="phone2" value="">-<input type="text" id="phone3" value=""></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="order_email" value="${ member.member_email }"></td>
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
		
		
			<!-- 기존 배송지 table -->
			<table class="client_info_table table_info" style="display:inline;">
				<tr>
					<td width="150px;">기존배송지</td>
					<td width="950px;">
						<select class="select_info" onchange="selectChange();">
							<option value="0">새로운 배송지 입력</option>
							<option value="1" selected>[기본 배송지] ${ member.member_nm } : ${ member.member_address } ${ member_address_detail }</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>받으시는분</td>
					<td><input type="text" id="recipient_nm" value="${ member.member_nm }"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="reciPhone1" value="">-<input type="text" id="reciPhone2" value="">-<input type="text" id="reciPhone3" value=""></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="zip_code" value="${ member.member_zip_code }" style="width:100px;" readonly><input type="button" onClick="sample6_execDaumPostcode()" value="우편번호"><br>
						<input type="text" id="address" value="${ member.member_address }" style="width:400px;" readonly><br>
						<input type="text" id="address_detail" value="${ member.member_address_detail }" style="width:200px;">
					</td>
				</tr>
				<tr>
					<td>배송메모</td>
					<td>
						<input id="memo" type="text"><br>
					</td>
				</tr>
			</table>
			
			<!-- 새로운 배송지 table -->
			<table class="client_info_table table_info" style="display:none;">
				<tr>
					<td width="150px;">기존배송지</td>
					<td width="950px;">
						<select class="select_info" onchange="selectChange();">
							<option value="0">새로운 배송지 입력</option>
							<option value="1" selected>[기본 배송지] ${ member.member_nm } : ${ member.member_address } ${ member_address_detail }</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>받으시는분</td>
					<td><input type="text" id="new_recipient_nm" class="user_nm" value=""></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="new_reciPhone1" value="">-<input type="text" id="new_reciPhone2" value="">-<input type="text" id="new_reciPhone3" value=""></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="new_zip_code" value="" style="width:100px;" readonly><input type="button" onClick="sample6_execDaumPostcode()" value="우편번호"><br>
						<input type="text" id="new_address" value="" style="width:400px;" readonly><br>
						<input type="text" id="new_address_detail" value="" style="width:200px;">
					</td>
				</tr>
				<tr>
					<td>배송메모</td>
					<td>
						<input id="new_memo" type="text"><br>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div align="center">
			<a onclick="kakaoPay('10000', 'CocoSua-Product', '${sessionScope.user_id}');">주문하기</a>
	</div>
	
	<!-- 기존 배송지 -->
	
	<form action="creditInfo.do" method="post" class="credit_info">
		<input type="hidden" name="user_id" value="${ sessionScope.user_id }">
		<input type="hidden" name="prdt_id" value="" class="prdt_id">
		<input type="hidden" name="prdt_price" value="" class="prdt_price">
		<input type="hidden" name="prdt_amount" value="" class="prdt_amount">
		<input type="hidden" name="credit_price" value="" class="credit_price">
		<input type="hidden" name="credit_way" value="" class="credit_way">
		<input type="hidden" name="order_nm" value="" class="order_nm">
		<input type="hidden" name="order_phone_num" value="" class="order_phone_num">
		<input type="hidden" name="order_email" value="" class="order_email">
		<input type="hidden" name="order_state" value="0" class="order_state">
		<input type="hidden" name="recipient_nm" value="" class="recipient_nm">
		<input type="hidden" name="recipient_phone_num" value="" class="recipient_phone_num">
		<input type="hidden" name="recipient_zip_code" value="" class="recipient_zip_code">
		<input type="hidden" name="recipient_address" value="" class="recipient_address">
		<input type="hidden" name="recipient_address_detail" value="" class="recipient_address_detail">
		<input type="hidden" name="recipient_memo" value="" class="recipient_memo">
	</form>
	
	<!-- 새로운 배송지 -->
	
	<form action="creditInfo.do" method="post" class="credit_info">
		<input type="hidden" name="user_id" value="${ sessionScope.user_id }">
		<input type="hidden" name="prdt_id" value="" class="prdt_id">
		<input type="hidden" name="prdt_price" value="" class="prdt_price">
		<input type="hidden" name="prdt_amount" value="" class="prdt_amount">
		<input type="hidden" name="credit_price" value="" class="credit_price">
		<input type="hidden" name="credit_way" value="" class="credit_way">
		<input type="hidden" name="order_nm" value="" class="order_nm">
		<input type="hidden" name="order_phone_num" value="" class="order_phone_num">
		<input type="hidden" name="order_email" value="" class="order_email">
		<input type="hidden" name="order_state" value="0" class="order_state">
		<input type="hidden" name="recipient_nm" value="" class="recipient_nm">
		<input type="hidden" name="recipient_phone_num" value="" class="recipient_phone_num">
		<input type="hidden" name="recipient_zip_code" value="" class="recipient_zip_code">
		<input type="hidden" name="recipient_address" value="" class="recipient_address">
		<input type="hidden" name="recipient_address_detail" value="" class="recipient_address_detail">
		<input type="hidden" name="recipient_memo" value="" class="recipient_memo">
	</form>
	
	<script src="resources/js/direct_payment_info.js"></script>
	<%@ include file="../../footer/footer.jsp"%>
</body>
</html>