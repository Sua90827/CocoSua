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