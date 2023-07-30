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
	<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
</c:if>
<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
	<%@ include file="/WEB-INF/views/nav_bar/user_nav.jsp"%>
</c:if>

<br>

<div>
	<div>
		<div>
			<div>
				<img class="img-fluid" src="resources/upload/${prdt.prdt_id }/${prdt.prdt_img}" alt="..." />
			</div>
		</div>
		<div>
			<div>
				${prdt.prdt_nm }
			</div>
			<div>
				${prdt.prdt_title }
			</div>
			<div>
				${prdt.prdt_content }
			</div>
			<div>
				${prdt.prdt_color }<br>
				${prdt.prdt_price }<br>
				${prdt.prdt_content }<br>
				${prdt.color_nm }<br>
				${prdt.cate_nm }<br>
			</div>
		</div>
	</div>
</div>

${prdt.prdt_amount }<br>

<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>