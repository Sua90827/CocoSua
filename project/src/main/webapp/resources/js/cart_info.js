let price;
let allPrice;
let number;
let numCheck = /^[0-9]+$/;
let totalNum = 0;
let totalPrice = 0;
window.onload = () => {
	let numberAll = document.querySelectorAll(".prdtNum");
	let priceAll = document.querySelectorAll(".prdtAllPrice");
	price = document.querySelectorAll(".prdtPrice");
	let totalNumId = document.getElementById("totalNum");
	let totalPriceId = document.getElementById("totalPrice");
	let totalPrice2Id = document.getElementById("totalPrice2");
	let cartIdClass = document.querySelectorAll(".cart_id");
	let cartId = document.getElementById("cart_id");
	let cartAmountId = document.getElementById("cart_amount");
	for (var i = 0; i < priceAll.length; i++) {
		priceAll[i].value = price[i].value * numberAll[i].value;
		totalPrice += Number(priceAll[i].value);
		totalNum += Number(numberAll[i].value);
		cartId.value += cartIdClass[i].value + ",";
		cartAmountId.value += numberAll[i].value + ",";
	}
	totalNumId.value = totalNum;
	totalPriceId.value = totalPrice;
	totalPrice2Id.value = totalPrice;
	cartId.value = cartId.value.substring(0, cartId.value.length-1);
	cartAmountId.value = cartAmountId.value.substring(0, cartAmountId.value.length-1);
}

const prdtNum = (cnt) => {
	console.log("gdgd");
	let count = Number(cnt);
	let numberAll = document.querySelectorAll(".prdtNum");
	number = numberAll[count].value;
	if (!numCheck.test(number)) {
		alert("1이상의 숫자만 입력해주세요.");
		location.reload();
		return;
	}

	if (number < 1) {
		alert("1이상의 숫자만 입력해주세요.");
		location.reload();
		return;
	}

	allPrice = document.querySelectorAll(".prdtAllPrice");
	allPrice[count].value = number * price[count].value;
	let totalNumId = document.getElementById("totalNum");
	let totalPriceId = document.getElementById("totalPrice");
	let totalPrice2Id = document.getElementById("totalPrice2");
	totalNum = 0;
	totalPrice = 0;
	for (var i = 0; i < allPrice.length; i++) {
		totalNum += Number(numberAll[i].value);
		totalPrice += Number(allPrice[i].value);
	}

	totalNumId.value = totalNum;
	totalPriceId.value = totalPrice;
	totalPrice2Id.value = totalPrice;
	return;
}

const plus = (cnt) => {
	let prdtNumber = document.querySelectorAll('.prdtNum');
	let cartAmountId = document.getElementById("cart_amount");
	cartAmountId.value = "";
	prdtNumber[cnt].value = Number(prdtNumber[cnt].value) + 1;
	for(var i = 0; i < prdtNumber.length; i++){
		cartAmountId.value += prdtNumber[i].value + ",";
	}
	cartAmountId.value = cartAmountId.value.substring(0, cartAmountId.value.length-1);
	prdtNum(cnt);
	return;
}

const minus = (cnt) => {
	let prdtNumber = document.querySelectorAll('.prdtNum');
	let cartAmountId = document.getElementById("cart_amount");
	cartAmountId.value = "";
	if(prdtNumber[cnt].value == 1){
		prdtNumber[cnt].value = 1;
		for(var i = 0; i < prdtNumber.length; i++){
			cartAmountId.value += prdtNumber[i].value + ",";
		}
		cartAmountId.value = cartAmountId.value.substring(0, cartAmountId.value.length-1);
		prdtNum(cnt);
		return;
		
	}
	prdtNumber[cnt].value -= 1;
	for(var i = 0; i < prdtNumber.length; i++){
		cartAmountId.value += prdtNumber[i].value + ",";
	}
	cartAmountId.value = cartAmountId.value.substring(0, cartAmountId.value.length-1);
	prdtNum(cnt);
	return;
}

