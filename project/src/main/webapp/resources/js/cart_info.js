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

	for (var i = 0; i < priceAll.length; i++) {
		totalPrice += Number(priceAll[i].value);
		totalNum += Number(numberAll[i].value);
	}
	totalNumId.value = totalNum;
	totalPriceId.value = totalPrice;
	totalPrice2Id.value = totalPrice;
}

const prdtNum = (cnt) => {
	console.log(cnt);
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

