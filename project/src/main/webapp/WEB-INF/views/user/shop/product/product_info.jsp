<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/img/cocoIcon.png" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/css/styles.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<title>CocoSua</title>

<style> 
.tb_fruits {width:100%; border-spacing:0; border-collapse:collapse; position:relative;}

.tb_fruits th,

.tb_fruits td {border:1px solid #ccc; border-top:0; text-align:center;}

.tb_fruits thead th {border-top:1px solid #ccc; background:#767676; color:#fff;}

.tb_fruits caption {position:absolute; height:0; overflow:hidden;}



.tb_fruits tbody tr.tr_visible {background:#eee; display:table-row;}

.tb_fruits .tr_visible a {

    position:absolute;

    width:100%;

    text-indent:-9999px;

    left:0;

    background:#fff;

    opacity:0;

    -ms-filter:alpha(opacity=0);

    filter:alpha(opacity=0);

}


</style>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script> 
const reviewDetail = (cnt) => {
	var number = Number(cnt);
	const detailClass = document.querySelectorAll(".detail");
	if(detailClass[number].style.display == "none"){
		detailClass[number].style.display = "";
	}else{
		detailClass[number].style.display = "none";
	}
}
</script>
<script>
	var toggleCells = document.querySelectorAll(".ClickforDetail");
	toggleCells.forEach(function(cell){
		cell.addEventListener("click", function(){
			var contentRow = this.parentNode.nextElementSibling;
			if(contentRow.classList.contains("detail")){
				contentRow.classList.remove("detail");
			}else{
				contentRow.classList.add("detail");
			}
		})
	})
	
	
$(".tr_visible a").click(function() {

    $(this).parent().parent().nextUntil(".tr_visible").toggle();

    return false;

});
	
	$(document).ready(function(){
		$("#forDetail").click(updateHit);
	});
	
	function updateHit(){
		$.ajax({
			url:"updateHit",
			type:'post',
			data : JSON.stringify( {hit :${review.hit } ),
			contentType : "application/json; charset=utf-8",
			dataType:"json",
			success:function(data){
				let obj=JSON.parse(data);
			}
		})
	}
</script>

</head>
<body> <!-- -----------------------------------<Body Tag>---------------------------------------------------- -->
	<c:if test="${empty sessionScope.loginType }">
		<%@ include file="/WEB-INF/views/nav_bar/basic_nav.jsp"%>
	</c:if>
	<c:if
		test="${sessionScope.loginType eq 0 || sessionScope.loginType eq 1 || sessionScope.loginType eq 2 }">
		<%@ include file="/WEB-INF/views/nav_bar/user_nav.jsp"%>
	</c:if>

	<br><br><br>
	<input type="hidden" id="price" value="${prdt.prdt_price }">
	<section class="product_info_page">
		
		<div class="product_info_location">
			<div style="width:50%; display:flex;">
				<div class="product_info_box" style="width:100%;">
					<div class="product_info_imgBox">
						<img class="img-fluid" style="width:1200px;" src="resources/upload/${prdt.prdt_id }/${prdt.prdt_img}" alt="..." />
					</div>
				</div>
				
				<div class="product_info_box" style="width:100%;">
					<div class="product_infomation_location">
						<div class="product_title_box">${prdt.prdt_title }</div>
						<div class="product_price_box product_box">
							<div>PRICE</div>
							<div>${prdt.prdt_price }</div>
						</div>
						<div class="product_color_box product_box">
							<div>COLOR</div>
							<div>${prdt.color_nm }</div>
						</div>
						<c:if test="${ not empty sessionScope.user_id }">
						<form action="cart.do" method="post" id="cartForm">
							<div class="product_box">
								<input type="hidden" name="user_id"
									value="${sessionScope.user_id }"> <input type="hidden"
									name="prdt_id" value="${prdt.prdt_id }">
								<div class="product_amount_box">
									<div>수량</div>
									<div class="product_amount_div">
										<div>
											<button class="cartAddBtn" type="button" onclick="minus()">-</button>
										</div>
										<div>
											<input type="text" id="productAmount" class="productAmount"
												name="cart_amount" value="1" min="1" readonly>
										</div>
										<div>
											<button class="cartAddBtn" type="button" onclick="plus()">+</button>
										</div>
									</div>
								</div>
							</div>
							<div class="product_total_box product_box">
								<div>TOTAL</div>
								<div>
									<input type="text" id="totalPrice" class="totalPrice"
										name="cart_price" value="${prdt.prdt_price }" readonly>원
								</div>
							</div>
						</form>
	
						<!-- Button Items -->
	
						<div id="buttonItemsDiv">
							<a onclick="directPay();" id="directPayBtn" style="width: 47%; display: flex; justify-content: center;">
								<span>즉시구매</span>
							</a>
							<a id="cartAddBtn" onclick="cartAdd()">
								<span><img src="resources/img/cart.png" style="width:30px;"></span>
							</a> 
							<a onclick="wish();" style="width: 20%; display: flex; justify-content: center;" id="heartBtn">
								<c:if test="${ not empty wish  }">
									<span id="heartTxt">♥</span>
								</c:if>
								<c:if test="${ empty wish  }">
									<span id="heartTxt">♡</span>
								</c:if>
							</a>
						</div>
						</c:if>
						<c:if test="${ empty sessionScope.user_id }">
							<span><span><a style=" text-decoration: underline;" href="login"><b>로그인</b></a></span> 후 상품 구매가 가능합니다.</span>
						</c:if>
						<!-- Button Items -->
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- 즉시구매 Form -->
	<form action="directPaymentInfo" method="post" id="directForm">
		<input type="hidden" value="${ sessionScope.user_id }" name="member_id"> 
		<input type="hidden" value="${prdt.prdt_id }" name="prdt_id"> 
		<input type="hidden" value="" name="amount" id="amount">
	</form>
	<!-- 즉시구매 Form -->

	<!-- insertWish 이미 db에 담겨 있는 상품이라면 deleteWish로!! -->
	<c:if test="${ empty wish }">
		<form action="insertWish" method="post" id="wishForm">
			<input type="hidden" name="user_id" value="${sessionScope.user_id }">
			<input type="hidden" name="prdt_id" value="${prdt.prdt_id }">
		</form>
	</c:if>
	<c:if test="${ not empty wish }">
		<form action="deleteWish" method="post" id="wishForm">
			<input type="hidden" name="user_id" value="${sessionScope.user_id }">
			<input type="hidden" name="prdt_id" value="${prdt.prdt_id }">
		</form>
	</c:if>
	<!-- insertWish 이미 db에 담겨 있는 상품이라면 deleteWish로!! -->
	<br><br><br>
	<div align="center" style="width:100%;">
		<div style="width:50%; display:flex; justify-content:space-between;">
			<div class="viewClass" style="width:50%; background-color:#fff; height:50px; display:flex; justify-content:center; align-items:center;"><a style="cursor:pointer;" onclick="contentView();">내용보기</a></div>
			<div class="viewClass" style="width:50%; background-color:#fff; height:50px; display:flex; justify-content:center; align-items:center;"><a style="cursor:pointer;" onclick="reviewView();">리뷰보기</a></div>
		</div>
	</div>
	<% int cnt = 0; %>
	<input type="hidden" id="reviewCnt" value="${ reviews.size() }">
	<div id="contentViewId" align="center" style="width:100%; display:none;">
		<div style="width:50%;">
			<div>
				<hr>
				${ prdt.prdt_content }
			</div>
		</div>
		<div style="width:50%;">
			<hr>
		</div>
	</div>
	<div id="reviewDiv" align="center" style="width:100%; display:none;">
		<div style="width:50%;">
			<c:forEach var="review" items="${reviews }">
				<input type="hidden" class="user_id" value="${review.user_id }">
				<input type="hidden" class="title" value="${review.title }">
				<input type="hidden" class="save_date" value="${ review.save_date }">
				<textarea class="content" style="display:none;">${review.content}</textarea>
				
				<div class="addViewDiv" align="left" style="display:flex;">
					<div>
						<c:if test="${ review.image_file_name.length() eq 3 }"><div style="width:100px;"></div></c:if>
						<c:if test="${ review.image_file_name.length() ne 3 }"><img style=" width:100px;" src="resources/reviewImg/${review.image_file_name }"></c:if>
						
					</div>
					<a id="addView" style="cursor:pointer;" onclick="addViewBtn('<%=cnt%>')">
						<div style="padding-left:50px;">
							<span class="basicUserId">jyseo****</span> | <span class="basicSaveDate">23-10-10</span><br>
							<span style="font-size:15px;"><b class="basicTitle">이옷이 너무 이쁜거 같아요</b></span><br>
							<span class="addViewText">더보기▽</span>
						</div>
					</a>
				</div>
				<div class="foldViewDiv" align="left" style="display:none;">
					<div style="width:100px;">
						
					</div>
					<a id="foldView" style="cursor:pointer;" onclick="foldViewBtn('<%=cnt++%>')">
						<div style="padding-left:50px;">
							<span class="detailUserId">jyseo****</span> | <span class="detailSaveDate">23-10-10</span><br>
							<span style="font-size:15px;"><b class="detailTitle">이옷이 너무 이쁜거 같아요</b></span><br>
							<span class="detailContent">아주아주 마음에 들어요 여러분들 많이많이 사주세요 ㅎㅎ!</span><br>
							<span class="foldViewText">접기△</span>
							<div>
								<c:if test="${ review.image_file_name.length() ne 3 }"><img style=" width:300px;" src="resources/reviewImg/${review.image_file_name }"></c:if>
							</div>
						</div>
					</a>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
	
	<div id="reviewDiv1" align="center" style="width:100%; display:none;">
		<div style="width:50%;">
			<hr>
			<div>
				리뷰<br>
				<table class="tb_fruits" border='1'>
				<thead>
					<tr>
						<!-- <th>No.</th> -->
						<th	style="width:20%;">작성자</th><th style="width:20%;">제목</th><th style="width:30%;">구매상품</th><th style="width:30%;">작성일</th>
					</tr>
				</thead>
					<tbody>
						<c:forEach var = "review" items="${reviews }" >
							<tr class="tr_visible">
								<!-- <td>${review.review_no }</td> -->
								
								<td>${review.user_id }</td>
								 <th scope="row"><a onclick="reviewDetail('<%= cnt %>');" style="cursor:pointer;">View More</a>${review.title }</th> 
								<!--<td class="ClickforDetail">${review.title }</td> -->
								<td>${review.prdt_title }<br>${review.prdt_nm }<br>${review.prdt_color }</td>
								<td>${review.save_date }</td>
							</tr>
		
							<tr class="detail" style="display:none;">
								<td colspan="4">
									<div align="center" style="width:100%">
										<div style="width:50%;">
											<textarea class="textareaId" style="all:unset; width:100%; height:100px; text-align:center; display:none;">${review.content}</textarea>
											<div class="textareaValue"></div>
											 <br>
											<img style="width:300px;" src="resources/reviewImg/${review.image_file_name }">
											<c:if test="${review.user_id == user_id}"><br>	
											<a href="modifyReview?review_no=${review.review_no }">수정</a>
											<a href="deleteReview?review_no=${review.review_no }&prdt_id=${review.prdt_id}">삭제</a>
											</c:if>
											<% cnt++; %>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<script src="/resources/js/product_info.js"></script>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	
</body>
</html>