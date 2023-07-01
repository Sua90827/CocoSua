<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/cocoSuaIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="resources/css/styles.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>CocoSua</title>
</head>
<body>
<c:if test="${empty sessionScope.loginType }">
	<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
</c:if>
<br>
${msg }
<span id="msg" style="color: red"></span><br>
<br>
<form action="join.do" method="post" id="f">
	<input type="hidden" name="member_login_type" value="0">
	아이디 : <input type="text" id="id" name="member_id" value="${member.member_id }" onkeydown="id_click();" onblur="id_blur();">
	<span id="member_id" style="color: red"></span><br>
	비밀번호 : <input type="password" id="pw" name="member_pw" value="${member.member_pw }" onkeydown="pw_click();" onblur="pw_blur();">
	<span id="member_pw" style="color: red"></span><br>
	비밀번호 확인 : <input type="password" id="pwCheck" name="member_pwCheck" value="${member.member_pwCheck }"><br>
	이름 : <input type="text" id="nm" name="member_nm" value="${member.member_nm }"><br>
	email : <input type="text" id="email" name="member_email"  placeholder="example@example.com" value="${member.member_email }" onkeydown="email_click();" onblur="email_blur();">
	<span id="member_email" style="color: red"></span><br>
	생년월일 : <input type="number" min="10000000" max="99999999" id="birth" name="member_birth" placeholder="19001010" <c:if test="${member.member_birth eq 0 }">value=""</c:if><c:if test="${member.member_birth > 0 }">value="${member.member_birth }"</c:if> onkeydown="birth_click();" onblur="birth_blur();">
	<span id="member_birth" style="color: red"></span><br>
	휴대폰 : <input type="text" id="phone" name="member_phone_num" placeholder="01012345678" value="${member.member_phone_num }" onkeydown="phone_click();" onblur="phone_blur();">
	<span id="member_phone" style="color: red"></span><br>
	우편번호 : <input type="text" id="sample6_postcode" name="member_zip_code" value="${member.member_zip_code }" readonly="readonly"> <input type="button" onClick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	주소 : <input type="text" id="sample6_address" name="member_address" value="${member.member_address }" readonly="readonly"><br>
	상세 주소 : <input type="text" id="sample6_detailAddress" name="member_address_detail" value="${member.member_address_detail }"><br>
	<input type="hidden" id="sample6_extraAddress" readonly="readonly">
	<input type="button" value="회원가입" onclick="check();">
</form>
<script src="resources/js/register_regex.js"></script>
<script src="resources/js/search_road.js"></script>
</body>
</html>