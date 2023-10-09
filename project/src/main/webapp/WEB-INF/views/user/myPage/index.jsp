<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link rel="stylesheet" href="/resources/css/myPage.css">
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
<input type="hidden" value="${ member.member_phone_num }" id="memberPhone">
<div align="center">
	<div style="width: 600px; display: flex; justify-content:space-between;">
		
		<div style="width:25%">
			<a class="itemsList" href="orderList">Order List</a>
		</div>
		
		
		<div style="width:25%">
			<a class="itemsList" href="memberModifyInfo">Modify Info</a>
		</div>
		
		<c:if test="${ sessionScope.loginType eq 1 }">
			<div style="width:25%">
				<a class="itemsList" onclick="kakaoMemberDelete('${sessionScope.user_id}');">Unregister</a>
			</div>
		</c:if>
				
		<c:if test="${ sessionScope.loginType eq 0 || sessionScope.loginType eq 2 }">
			<div style="width:25%"> 
				<a class="itemsList" href="memberDeleteInfo">Unregister</a>
			</div>
		</c:if> 
		
		<div style="width:25%">
			<a class="itemsList wishList" href="wishList">Wish List</a>
		</div>
		
	</div>
</div>
<div style="height:50px;">
</div>
<div align="center">
	<div style="width:600px; text-align: left;">
		<span style="font-weight:bold;">${member.member_nm }</span> <span style="color:gray; font-weight:bold;">님 환영합니다.</span>
	</div>
	<table>
		<tr>
			<c:if test="${sessionScope.loginType ne 1}">
				<th style="width:100px;">Id</th>
				<td style="width: 150px;">${ member.member_id }</td>
				<th style="width:100px;">Email</th>
				<td style="width: 250px;">${ member.member_email }</td>
			</c:if>
			<c:if test="${ sessionScope.loginType eq 1 }">
				<th style="width:100px;">Email</th>
				<td colspan="3" style="width: 500px;">${ member.member_email }</td>
			</c:if>

		</tr>
		<tr>
			<th>Birthday</th>
			<td>${ member.member_birth }</td>
			<th>Phone</th>
			<td><span id="userPhone"></span></td>
		</tr>
		<tr>
			<th>Address</th>
			<td colspan="3">${ member.member_address } ${ member.member_address_detail }</td>
		</tr>
	</table>
	
</div>
<script src="resources/js/mypage_index.js"></script>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>

</body>
</html>