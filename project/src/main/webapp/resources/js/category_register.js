window.onload = () => {
	let registerMenuClass = document.querySelectorAll(".registerMenu");
	registerMenuClass[1].style.backgroundColor = "#eee";
}

function categoryDelete(id){
	var cateId = id;
	if(window.confirm('삭제하게 되면 카테고리 관련된 모든 상품도 삭제됩니다. 카테고리를 삭제하시겠습니까?')){
		location.href="categoryDelete.do?cate_id=" + cateId;	
	}else
	return;
}