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
${msg }
<br>
<form action="join.do" method="post">
	<input type="hidden" name="member_login_type" value="0">
	아이디 : <input type="text" name="member_id" placeholder="example@example.com" value="${member.member_id }"><br>
	비밀번호 : <input type="password" name="member_pw" value="${member.member_pw }"><br>
	비밀번호 확인 : <input type="password" name="member_pwCheck" value="${member.member_pwCheck }"><br>
	이름 : <input type="text" name="member_nm" value="${member.member_nm }"><br>
	email : <input type="text" name="member_email" value="${member.member_email }"><br>
	생년월일 : <input type="text" name="member_birth" placeholder="19001010" value="${member.member_birth }"><br>
	휴대폰 : <input type="text" name="member_phone_num" placeholder="01012345678" value="${member.member_phone_num }"><br>
	우편번호 : <input type="text" name="member_zip_code" value="${member.member_zip_code }"><br>
	주소 : <input type="text" name="member_address" value="${member.member_address }"><br>
	상세 주소 : <input type="text" name="member_address_detail" value="${member.member_address_detail }"><br>
	<button type="submit">회원가입</button>
</form>
</body>
</html>