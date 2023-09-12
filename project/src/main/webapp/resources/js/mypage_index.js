window.onload = () => {
		let phoneNum = document.getElementById("memberPhone").value;
		let phoneNum1 = phoneNum.substring(0, 3);
		let phoneNum2 = phoneNum.substring(3, 7);
		let phoneNum3 = phoneNum.substring(7, 11);
		phoneNum = phoneNum1 + "-" + phoneNum2 + "-" + phoneNum3;
		document.getElementById("userPhone").innerText = phoneNum;
		
	}
	
const kakaoMemberDelete = (userId) => {
	if(window.confirm("정말 탈퇴하시겠습니까?")){
		location.href="kakaoMemberDelete.do?member_id=" + userId;
	}
}