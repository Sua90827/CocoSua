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
					<a href="/"><img class="coco_sua_img"
						src="/resources/img/userImg.png" alt="..." /></a>
				</div>
				<div class="navbar_sub sub_right_menu">
					<c:if test="${sessionScope.loginType eq 2}">
						<div>
							<a href="/admin">ADMIN</a>
						</div>
					</c:if>
					<div>
						<a href="/qna">Q&A</a>
					</div>
						<div>
							<a href="/cart?user_id=${ sessionScope.user_id }">CART</a>
						</div>
						<div>
							<a href="/mypages">MY PAGES</a>
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
			<div class="nav_searce_bar">
				
			</div>
		</div>
		<div class="nav_cate_menu">
			<c:forEach var="menu" items="${cate }">
				<div>
					<a href="product_section?cate_id=${menu.cate_id }">${menu.cate_nm }</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>