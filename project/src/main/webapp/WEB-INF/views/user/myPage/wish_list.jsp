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
<div class="user_index_page">
		<div class="user_index_location">
			<section class="page-section" id="portfolio">
				<div class="container">
					<div class="text-center">
						<h2 class="section-heading text-uppercase">♡♡♡여기는 위시리스트예요♡♡♡</h2>
						<h3 class="section-subheading text-muted">My Wish List</h3>
					</div>
					<div class="row">
					<c:if test="${prdt.size() > 0 }">
						<c:forEach var="prdt" items="${prdt }">
						<div class="col-lg-6 col-sm-6 mb-6">
							<!-- Portfolio item 1-->
							<div class="portfolio-item">
								<a class="portfolio-link" data-bs-toggle="modal"
									href="userPrdtInfo?prdt_id=${prdt.prdt_id }">
									 <img class="img-fluid" src="resources/upload/${prdt.prdt_id }/${prdt.prdt_img}"
										 alt="..." />
								</a>
								<div class="portfolio-caption">
									<div class="portfolio-caption-heading">${prdt.prdt_title }</div>
									<div class="portfolio-caption-subheading text-muted">${prdt.prdt_price }원</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</c:if>
					</div>
				</div>
			</section>
		</div>
	</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>