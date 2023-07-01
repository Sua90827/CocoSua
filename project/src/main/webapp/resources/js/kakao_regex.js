    function birth_click(){
		document.getElementById("member_birth").innerText="ex)19001212";
	}
	function birth_blur(){
		document.getElementById("member_birth").innerText="";
	}
	
	function phone_click(){
		document.getElementById("member_phone").innerText="휴대폰번호(-없이 입력)";
	}
	function phone_blur(){
		document.getElementById("member_phone").innerText="";
	}
	
	function check(){
        var birth = document.getElementById('birth').value;
		var phone = document.getElementById('phone').value;
		var zip = document.getElementById('sample6_postcode').value;
		var detail = document.getElementById('sample6_detailAddress').value;
        if(birth == ""){
			document.getElementById("msg").innerText="생년월일 입력은 필수입니다.";
			return;
		}
		if(phone == ""){
			document.getElementById("msg").innerText="핸드폰 입력은 필수입니다.";
			return;
		}
		if(zip == ""){
			document.getElementById("msg").innerText="우편번호 입력은 필수입니다.";
			return;
		}
		if(detail == ""){
			document.getElementById("msg").innerText="상세주소 입력은 필수입니다.";
			return;
		}
		if(pw != pwCheck){
			document.getElementById("msg").innerText="비밀번호가 일치하지 않습니다.";
			return;
		}
		
		var phoneRegex = /^[0-9]{11,11}$/;
		
		var phoner = phoneRegex.test(phone);
		
		if(phoner === false){
			document.getElementById("msg").innerText="핸드폰번호가 형식에 맞지 않습니다.";
			return;
		}

		document.getElementById('f').submit();
	}