window.onload = () => {
	let prdtPrice = document.querySelectorAll(".prdtAllPrice");
	let prdtAllPriceId = document.getElementById("totalPrice");
	let paymentPriceId = document.getElementById("paymentPrice");
	let memberPhoneId = document.getElementById("memberPhone");
	let clientPhone1 = document.getElementById("phone1");
	let clientPhone2 = document.getElementById("phone2");
	let clientPhone3 = document.getElementById("phone3");
	let total = 0;
	for (var i = 0; i < prdtPrice.length; i++) {
		total += Number(prdtPrice[i].value);
	}
	paymentPriceId.value = total;
	const num = total.toLocaleString('ko-KR');
	prdtAllPriceId.value = num;
	paymentPriceId.value = num;

	clientPhone1.value = memberPhoneId.value.substring(0, 3);
	clientPhone2.value = memberPhoneId.value.substring(3, 7);
	clientPhone3.value = memberPhoneId.value.substring(7, 11);
	return;
}