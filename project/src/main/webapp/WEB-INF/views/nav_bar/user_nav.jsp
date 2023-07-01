<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<div>
		<div>
			<a href="notice">NOTICE</a> | <a href="qna">Q&A</a> | <c:if test="${sessionScope.loginType eq 2}">
	<a href="admin">ADMIN</a> |
</c:if>
			<a href="/">MILLKccoa</a> |
			<c:if test="${sessionScope.loginType eq 1 }"><a href="/kakao_logout">LOGOUT</a></c:if>
			<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 2}"><a href="/logout">LOGOUT</a></c:if> | <a href="/edit">EDIT</a> | <a href="/cart">CART</a> | <a href="/guide">GUIDE</a> | <a href="/mypages">MY PAGES</a><br>
		</div>
		<div>
			<a href="/search">SEARCH</a>
		</div>
	</div>
	<div>
		<a href="#">NEW</a> | <a href="#">Dress</a> | <a href="#">Outer</a> | 
		<a href="#">Blouse</a> | <a href="#">Tee</a> | <a href="#">Knit</a> | <a href="#">Bottom</a> | 
		<a href="#">Shoes</a> | <a href="#">Bag</a>| <a href="#">Acc</a> | <a href="#">Cruise</a> | 
		<a href="#">Sale</a> | <a href="#">Only you</a> | <a href="#">Celebrity</a>
	</div>
</div>