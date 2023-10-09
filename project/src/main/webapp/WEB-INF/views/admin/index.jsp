<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/cocoIcon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="resources/css/styles.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>CocoSua</title>
</head>
<body>
<%@ include file="../nav_bar/admin_nav.jsp"%>
<br>
	<div align="center" style="padding-top:50px;">
		<a href="/productList"><button style="all:unset; cursor:pointer; width:200px; height:50px; border: 1px solid rgba(0, 0, 0, 0.1);">Product List</button></a><br>
		<a href="/productRegister"><button style="all:unset; cursor:pointer; width:200px; height:50px; border: 1px solid rgba(0, 0, 0, 0.1);">Register</button></a>
	</div>

<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>