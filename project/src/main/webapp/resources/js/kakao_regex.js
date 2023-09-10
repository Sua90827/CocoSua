function birth_click() {
	document.getElementById("member_birth").innerText = "★ ex)19001010 ★";
}
function birth_blur() {
	document.getElementById("member_birth").innerText = "";
}
function phone_click() {
	document.getElementById("member_phone").innerText = "★ 휴대폰번호(-없이 입력) ★";
}
function phone_blur() {
	document.getElementById("member_phone").innerText = "";
}

function check() {
	var birth = document.getElementById('birth').value;
	var phone = document.getElementById('phone').value;
	var zip = document.getElementById('sample6_postcode').value;
	var detail = document.getElementById('sample6_detailAddress').value;
	if (birth == "") {
		alert("생년월일 입력은 필수입니다.");
		//			document.getElementById("msg").innerText="생년월일 입력은 필수입니다.";
		document.getElementById("birth").focus();
		return;
	}
	if (phone == "") {
		alert("핸드폰 입력은 필수입니다.");
		//			document.getElementById("msg").innerText="핸드폰 입력은 필수입니다.";
		document.getElementById("phone").focus();
		return;
	}
	if (zip == "") {
		alert("우편번호 입력은 필수입니다.");
		//		document.getElementById("msg").innerText = "우편번호 입력은 필수입니다.";
		document.getElementById("sample6_postcode").focus();
		return;
	}
	if (detail == "") {
		alert("상세주소 입력은 필수입니다.");
		//		document.getElementById("msg").innerText = "상세주소 입력은 필수입니다.";
		document.getElementById("sample6_detailAddress").focus();
		return;
	}

	var phoneRegex = /^[0-9]{11,11}$/;
	var birthRegex;
	var phoner = phoneRegex.test(phone);

	if (birthRegex <= 10000000 || birthRegex >= 99999999) {
		alert("생년월일이 형식에 맞지 않습니다.");
		//		document.getElementById("msg").innerText = "생년월일이 형식에 맞지 않습니다.";
		document.getElementById("birth").focus();
		return;
	}

	if (phoner === false) {
		alert("핸드폰번호가 형식에 맞지 않습니다.");
		//		document.getElementById("msg").innerText = "핸드폰번호가 형식에 맞지 않습니다.";
		document.getElementById("phone").focus();
		return;
	}

	document.getElementById('f').submit();
}