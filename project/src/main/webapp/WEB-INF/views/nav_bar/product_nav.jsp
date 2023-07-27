<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="navbar">
	<div class="navbar_location">
		<div class="navbar_bottom_line">
			<div class="navbar_main_menu">
				<div class="navbar_sub sub_left_menu">
					 <div>
						<a href="/search">SEARCH</a>
					</div>
				</div>
				<div class="navbar_sub">
					<div class="sub_center_menu">
						<a href="/admin"><img class="coco_sua_img" src="resources/img/adminImg.png" alt="..."/></a>
					</div>
				</div>
				<div class="navbar_sub sub_right_menu">
					<c:if test="${sessionScope.loginType eq 2}">
						<div>
							<a href="/">MALL</a>			
						</div>
					</c:if>
					<div>
						<a href="/notice">NOTICE</a>
					</div>
					<div>
						<a href="/qna">Q&A</a>
					</div>
					<c:if test="${sessionScope.loginType eq 1 }">
						<div>
							<a href="https://kauth.kakao.com/oauth/logout?client_id=bb7ab199150e947c571829261362a621&logout_redirect_uri=http://localhost:8080/kakao_logout">LOGOUT</a>
						</div>
					</c:if>
					<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 2}">
						<div>
							<a href="/logout">LOGOUT</a>
						</div>
					</c:if>
					<div>
						<a href="/productList">PRODUCT</a>
					</div>
					<c:if test="${sessionScope.loginType eq 1 }">
						<div>
							<a href="https://kauth.kakao.com/oauth/logout?client_id=bb7ab199150e947c571829261362a621&logout_redirect_uri=http://localhost:8080/kakao_logout">LOGOUT</a>
						</div>
					</c:if>
					<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 2}">
						<div>
							<a href="/logout">LOGOUT</a>
						</div>
					</c:if>
				</div>
			</div>
			
		</div>
		<div class="nav_cate_menu">
			<div>
				<a href="/productRegister">Product</a>
			</div> 
			<div>
				<a href="/categoryRegister">Category</a>
			</div> 
		</div>
	</div>
</div>
