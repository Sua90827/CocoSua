<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="navbar">
	<div class="navbar_location">
		<div class="navbar_bottom_line">
			<div class="navbar_main_menu">
				<div class="navbar_sub sub_left_menu">
				<div>
					<a href="notice">NOTICE</a>
				</div>
				<div>
					<a href="qna">Q&A</a>
				</div>
				<c:if test="${sessionScope.loginType eq 2}">
					<div>
						<a href="admin">ADMIN</a>			
					</div>
				</c:if>
					 
				</div>
				<div class="navbar_sub">
					<a href="/"><img class="coco_sua_img" src="resources/img/cocoSuaIcon.png" alt="..."/></a>
				</div>
				<div class="navbar_sub sub_right_menu">
					<div>
						<a href="/login">LOGIN</a>
					</div>
					<div>
						<a href="/join">JOIN</a>
					</div>
					<div>
						<a href="/edit">EDIT</a>
					</div>
					<div>
						<a href="/cart">CART</a>
					</div>
					<div>
						<a href="/guide">GUIDE</a>
					</div>
					<div>
						<a href="/mypages">MY PAGES</a>
					</div>
				</div>
			</div>
			<div class="nav_searce_bar">
				<a href="/search">SEARCH</a>
			</div>
		</div>
		<div class="nav_cate_menu">
			<div>
				<a href="#">NEW</a>
			</div> 
			<div>
				<a href="#">Dress</a>
			</div> 
			<div>
				<a href="#">Outer</a>
			</div>
			<div>
				<a href="#">Blouse</a>
			</div>
			<div> 
				<a href="#">Tee</a>
			</div> 
			<div>
				<a href="#">Knit</a>
			</div>
			<div>
				<a href="#">Bottom</a>
			</div>
			<div>
				<a href="#">Shoes</a>
			</div>
			<div>
				<a href="#">Bag</a>
			</div>
			<div>
				<a href="#">Acc</a>
			</div>
			<div>
				<a href="#">Cruise</a>
			</div>
			<div>
				<a href="#">Sale</a>
			</div>
			<div>
				<a href="#">Only you</a>
			</div>
			<div>
				<a href="#">Celebrity</a>
			</div>
		</div>
	</div>
</div>