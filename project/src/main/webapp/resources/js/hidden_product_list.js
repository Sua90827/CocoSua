window.onload = () => {
	let listMenuClass = document.querySelectorAll(".listMenu");
	listMenuClass[1].style.backgroundColor = "#eee";
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

function productDisplay(id){
	var prdtId = id;
	if (window.confirm('상품을 사용자에게 보이도록 하겠습니까?'))
	{
		location.href="productDisplay.do?prdt_id=" + prdtId;
	}
	else
	{
		return;
	}
}