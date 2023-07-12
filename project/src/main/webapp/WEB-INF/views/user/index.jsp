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
	<%@ include file="../nav_bar/basic_nav.jsp"%>
</c:if>
<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
	<%@ include file="../nav_bar/user_nav.jsp"%>
</c:if>
<br>

<div class="user_main_page">
	<div class="user_main_location">
		<c:if test="${prdt.size() > 0 }">
			<c:forEach var="prdt" items="${prdt }">
				<div>
					<div>
						<img src="resources/upload/${prdt.prdt_id }/${prdt.prdt_img}" alt="..." />
					</div>
					<div>
						${prdt.prdt_title }
					</div>
					<div>
						${prdt.prdt_price }
					</div>
				</div>			
			</c:forEach>
		</c:if>
		<c:if test="${empty prdt }">
			<div>
				등록된 사진이 없습니다.		
			</div>
		</c:if>
	</div>
</div>
<%@ include file="../footer/footer.jsp"%>
</body>
</html>