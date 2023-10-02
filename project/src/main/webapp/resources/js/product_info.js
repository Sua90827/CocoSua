	function plus(){
		var plus = document.getElementById("productAmount").value;
		var price = document.getElementById("price").value;
		
		plus++;
		document.getElementById("productAmount").value = plus;
		document.getElementById("totalPrice").value = plus*price;
		return;
	}
	
	function minus(){
		var minus = document.getElementById("productAmount").value;
		var price = document.getElementById("price").value;
		minus--;
		if(minus < 1){
			minus = 1;
		}
		document.getElementById("productAmount").value = minus;
		document.getElementById("totalPrice").value = minus*price;
		return;
	}

	const directPay = () => {
		let directForm = document.getElementById("directForm");
		let productAmount = document.getElementById("productAmount").value;
		document.getElementById("amount").value = productAmount;
		directForm.submit();
	}

	const cartAdd = () => {
		document.getElementById("cartForm").submit();
	}

	const wish = () => {
		document.getElementById("wishForm").submit();
	}

	const contentView = () => {
		let contentId = document.getElementById("contentViewId");
		let reviewDivId = document.getElementById("reviewDiv");
		let viewClass = document.querySelectorAll(".viewClass");
		if(contentId.style.display == "none"){
			contentId.style.display = "";
			viewClass[0].style.backgroundColor = "#eee";
		}else{
			contentId.style.display = "none";
			viewClass[0].style.backgroundColor = "#fff";
		}

		if(reviewDivId.style.display == ""){
			reviewDivId.style.display = "none";
			viewClass[1].style.backgroundColor = "#fff";
		}
	}

	const reviewView = () => {
		let contentId = document.getElementById("contentViewId");
		let reviewDivId = document.getElementById("reviewDiv");
		let viewClass = document.querySelectorAll(".viewClass");
		if(reviewDivId.style.display == "none"){
			reviewDivId.style.display = "";
			viewClass[1].style.backgroundColor = "#eee";
		}else{
			reviewDivId.style.display = "none";
			viewClass[1].style.backgroundColor = "#fff";
		}

		if(contentId.style.display == ""){
			contentId.style.display = "none";
			viewClass[0].style.backgroundColor = "#fff";
		}
	}

	const gdgd = (cnt) => {
		let number = Number(cnt);
		let textareaId = document.querySelectorAll(".textareaId");
		console.log(textareaId[number].value);
	}

	window.onload = () => {
		let textareaId = document.querySelectorAll(".textareaId");
		let textareaValue = document.querySelectorAll(".textareaValue");
		for(var i = 0; i < textareaId.length; i++){
			let textEnter = textareaId[i].value.split("\n");
			let msg = "";
			for(var j = 0; j < textEnter.length; j++){
				if(j == textEnter.length - 1){
					msg+=textEnter[j];
					break;
				}
				msg += textEnter[j] + '<br>';
			}
			textareaValue[i].innerHTML = msg;
		}
	}