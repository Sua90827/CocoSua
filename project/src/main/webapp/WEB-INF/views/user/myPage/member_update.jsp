<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>CocoSua</title>
</head>
<body>
<c:if test="${ empty sessionScope.loginType }">
	<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
</c:if>

<c:if test="${ not empty msg }">
	<script>
		alert("이미 가입된 아이디입니다.");
	</script>
</c:if>
<div class="register_page">
	<div class="register_location">
		<form method="post" id="f">
			<input type="hidden" id="sample6_extraAddress" readonly="readonly">
			<table class="join_table">
				<tr>
				    <td style="width:30%">
				    	아이디
				    </td>
				    <td style="width:100%">
				    	<div>
				    		<input type="text" id="id" class="id" name="member_id" value="${member.member_id }" onkeydown="id_click();" onblur="id_blur();" placeholder="ID" readonly><br>
							<span id="member_id" style="color: red"></span>
						</div>
					</td>
				</tr>
				<tr>
				    <td>비밀번호</td>
				    <td>
					    <input type="password" id="pw" name="member_pw" value="" onkeydown="pw_click();" onblur="pw_blur();" placeholder="PASSWORD">
						<br><span id="member_pw" style="color: red"></span>
					</td>
				</tr>
				<tr>
				    <td>비밀번호 확인</td>
				    <td>
				    	<input type="password" id="pwCheck" name="member_pwCheck" value="" placeholder="PASSWORDCHECK">
				    </td>
				</tr>
				<tr>
				    <td>이름</td>
				    <td>
				    	<input type="text" id="nm" name="member_nm" value="${member.member_nm }">
				    </td>
				</tr>
				<tr>
				    <td>email</td>
				    <td>
					    <input type="text" id="email" name="member_email"  placeholder="example@example.com" value="${member.member_email }" onkeydown="email_click();" onblur="email_blur();">
					    <br><span id="member_email" style="color: red"></span>
				    </td>
				</tr>
				<tr>
				    <td>생년월일</td>
				    <td>
					    <input type="number" min="10000000" max="99999999" id="birth" name="member_birth" placeholder="19001010" <c:if test="${member.member_birth eq 0 }">value=""</c:if><c:if test="${member.member_birth > 0 }">value="${member.member_birth }"</c:if> onkeydown="birth_click();" onblur="birth_blur();" maxlength='8'>
						<br><span id="member_birth" style="color: red"></span>
					</td>
				</tr>
				<tr>
				    <td>휴대폰</td>
				    <td>
					    <input type="text" id="phone" name="member_phone_num" placeholder="01012345678" value="${member.member_phone_num }" onkeydown="phone_click();" onblur="phone_blur();" maxlength='11'>
						<br><span id="member_phone" style="color: red"></span>
					</td>
				</tr>
				<tr>
				    <td>우편번호</td>
				    <td><input type="text" id="sample6_postcode" name="member_zip_code" value="${member.member_zip_code }" readonly="readonly"> <input type="button" onClick="sample6_execDaumPostcode()" value="우편번호"></td>
				</tr>
				<tr>
				    <td>주소</td>
				    <td><input type="text" id="sample6_address" name="member_address" value="${member.member_address }" readonly="readonly"></td>
				</tr>
				<tr>
				    <td>상세 주소</td>
				    <td><input type="text" id="sample6_detailAddress" name="member_address_detail" value="${member.member_address_detail }"></td>
				</tr>
		    </table>
		    <div class="join_button_location">
			    <input class="join_button join_button_left" type="button" value="수정하기" onclick="check();"> 
			    <input type="button" class="join_button join_button_right" onclick="window.history.back()"value="뒤로가기">
		    </div>
		</form>
	</div>
</div>


<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
<script src="/resources/js/search_road.js"></script>
<script src="/resources/js/update_regex.js"></script>
</body>
</html>