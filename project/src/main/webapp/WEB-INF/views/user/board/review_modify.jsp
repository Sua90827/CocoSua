<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
  	<c:if test="${empty sessionScope.loginType }">
		<%@ include file="../../nav_bar/basic_nav.jsp"%>
	</c:if>
	<c:if test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
		<%@ include file="../../nav_bar/user_nav.jsp"%>
	</c:if>
	<br>
   <div align="center">
      <h1>리뷰 수정</h1>
      <form action="SaveModifiedReview" method="post" enctype="multipart/form-data">
         <table>
            <tr>
               <td>
                  <b>작성자</b><br>
                  <input type="text" name="user_id" value="${ dto.user_id }" readonly>
               </td>
            </tr>
            <tr>
               <td>
                  <b>상품명</b><br>
                  <input type="text" name="id" value="${ dto.prdt_nm } ${dto.prdt_title} ${dto.prdt_color} ${dto.prdt_id}" readonly>
                  <input type="hidden" name="prdt_id" value="${dto.prdt_id}">
                  <input type="hidden" name="prdt_nm" value="${dto.prdt_nm}">
                  <input type="hidden" name="prdt_color" value="${dto.prdt_color}">
                  <input type="hidden" name="prdt_title" value="${dto.prdt_title}">
               </td>
            </tr>
            <tr>
               <td>
                  <b>제목</b><br>
                  <input type="text" name="title"> 
               </td>
            </tr>
            <tr>
               <td>
                  <b>내용</b><br>
                  <textarea name="content"></textarea>
               </td>
            </tr>
            <tr>
               <td>
                  <b>이미지파일 첨부</b>
                  <input type="file" name="file" onchange="readURL(this);">
                  <div><img id="preview"  width=100 height=100 alt="선택된 이미지가 없습니다." /></div>

               </td>
            </tr>
            <tr>
               <td>
                  <button type="submit">글쓰기</button>
                  <button type="button" onclick="window.history.back();">목록보기</button>
               </td>
            </tr>
         </table>
      </form>
   </div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
   
</body>
</html>