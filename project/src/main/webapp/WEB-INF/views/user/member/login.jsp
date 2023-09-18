<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>CocoSua</title>
</head>
<body>
	<c:if test="${empty sessionScope.loginType }">
		<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
	</c:if>
	<div class="login_page">
		<div class="login_location">
			<div id="msg"> ${msg }</div>
			<div class="member_login_text">
				<div class="login_text_div">Member Login</div>
			</div>
				<form action="/login.do" method="post">
					<div class="login_form">
						<div class="login_input">
							<input type="text" name="member_id" value="${member.member_id }" placeholder="ID"><br>
							<input type="password" name="member_pw" value="${member.member_pw }" placeholder="PASSWORD"><br>
						</div>
						<div>
							<button type="submit" class="login_button">LOGIN</button>			
						</div>
					</div>
				</form>
			<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=bb7ab199150e947c571829261362a621&redirect_uri=http://localhost:8080/login/kakao&response_type=code">
				<img src="resources/img/kakao_short.png"/>
			</a>		
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>