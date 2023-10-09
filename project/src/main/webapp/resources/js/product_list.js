window.onload = () => {
	let listMenuClass = document.querySelectorAll(".listMenu");
	listMenuClass[0].style.backgroundColor = "#eee";
}

function productDelete(id){
	var prdtId = id;
	if (window.confirm('상품을 삭제하시겠습니까?'))
	{
		location.href="prdtDelete.do?prdt_id=" + prdtId;
	}
	else
	{
		return;
	}
}

function productHide(id){
	var prdtId = id;
	if (window.confirm('상품을 숨기겠습니까?'))
	{
		location.href="productHide.do?prdt_id=" + prdtId;
	}
	else
	{
		return;
	}
}