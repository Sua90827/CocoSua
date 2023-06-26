<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/styles.css">
<title>suamall</title>
</head>
<body>
<c:if test="${empty sessionScope.loginType }">
	<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
</c:if>
<br>
<form action="join.do" method="post">
	<input type="hidden" name="member_login_type" value="0">
	아이디 : <input type="text" name="member_id" placeholder="example@example.com">
	비밀번호 : <input type="password" name="member_pw">
	이름 : <input type="text" name="member_nm" >
	email : <input type="text" name="member_email">
	생년월일 : <input type="text" name="member_birth" placeholder="19001010">
	휴대폰 : <input type="text" name="member_phone_num" placeholder="01012345678">
	우편번호 : <input type="text" name="member_zip_code">
	주소 : <input type="text" name="member_address">
	상세 주소 : <input type="text" name="member_address_detail">
	<button type="submit">회원가입</button>
</form>
</body>
</html>