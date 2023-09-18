let selectCnt = 0;

window.onload = () => {
    let prdtNum = document.querySelectorAll(".prdtNum");
    let productPrice = document.querySelectorAll(".prdtPrice");
	let prdtPrice = document.querySelectorAll(".prdtAllPrice");
	let prdtAllPriceId = document.getElementById("totalPrice");
	let paymentPriceId = document.getElementById("paymentPrice");
	let memberPhoneId = document.getElementById("memberPhone");
	let clientPhone1 = document.getElementById("phone1");
	let clientPhone2 = document.getElementById("phone2");
	let clientPhone3 = document.getElementById("phone3");
	let reciPhone1 = document.getElementById("reciPhone1");
	let reciPhone2 = document.getElementById("reciPhone2");
	let reciPhone3 = document.getElementById("reciPhone3");
	let total = 0;
    prdtPrice[0].value = prdtNum[0].value * productPrice[0].value;
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
	reciPhone1.value = memberPhoneId.value.substring(0, 3);
	reciPhone2.value = memberPhoneId.value.substring(3, 7);
	reciPhone3.value = memberPhoneId.value.substring(7, 11);

    // creditInfo submit 할 정보
    let creditPriceClass = document.querySelectorAll(".credit_price");
    for(var i = 0; i < creditPriceClass.length; i++){
        creditPriceClass[i].value = total;
    }
	return;
}

const selectChange = () => {
	selectCnt++;
	let selectInfo = document.querySelectorAll(".select_info");
	let tableInfo = document.querySelectorAll(".table_info");
	if(selectCnt % 2 == 0){ // 기존 배송지
		for(var i = 0; i < selectInfo.length; i++){
			selectInfo[i].value="1";
		}
		tableInfo[0].style.display = "inline";
		tableInfo[1].style.display = "none";
		return;
	}else{ // 새로운 배송지
		for(var i = 0; i < selectInfo.length; i++){
			selectInfo[i].value="0";
		}
		tableInfo[0].style.display = "none";
		tableInfo[1].style.display = "inline";
		return;
	}
}

const kakaoPay = (price, shopNm, userId) => {
    let total = 0;
    let prdtPrice = document.querySelectorAll(".prdtAllPrice");
    const blankResult = blankCheck(); // 빈칸 체크

    if(blankResult == -1){
        return;
    }

    for (var i = 0; i < prdtPrice.length; i++) {
		total += Number(prdtPrice[i].value);
	}
	$(function(){
        var IMP = window.IMP;
        IMP.init('imp22624237'); //가맹점 식별코드 삽입
        var msg;
        var user_id;
        
        //url에서 parameter 가져오기 --> price값 알기 위해서
        var getParam = function(key){
            var _parammap = {};
            document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
                function decode(s) {
                    return decodeURIComponent(s.split("+").join(" "));
                }

                _parammap[decode(arguments[1])] = decode(arguments[2]);
            });

            return _parammap[key];
        };
        user_id = userId;
		//@@@@@@ 3번 @@@@@@@
            IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : shopNm,
            amount : total,
            buyer_email : '이메일 넣기',
            buyer_name : '이름 넣기',
            buyer_tel : '번호 넣기',
            buyer_addr : '주소 넣기',
            buyer_postcode : '123-456',
           // m_redirect_url : '결제 완료후 이동할 페이지'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payment", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        uid : rsp.imp_uid,
                        price: rsp.paid_amount
                        //기타 필요한 데이터가 있으면 추가 전달
                    })
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\n결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                const submitNum = kakaopaySuccess();
                let careditInfo = document.querySelectorAll(".credit_info");
                careditInfo[submitNum].submit();
                //location.href='/orders?user_id='+user_id;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                return; 
            }
        });

    });
}

const blankCheck = () => {
    let orderNmId = document.getElementById("order_nm").value;
    let orderPhone1 = document.getElementById("phone1").value;
    let orderPhone2 = document.getElementById("phone2").value;
    let orderPhone3 = document.getElementById("phone3").value;
    let orderEmail = document.getElementById("order_email").value;

    if(orderNmId == ""){
        alert("주문하시는 분 이름을 입력해주세요.");
        document.getElementById("order_nm").focus();
        return -1;
    }
    if(orderPhone1 == ""){
        alert("핸드폰 번호를 입력해주세요.");
        document.getElementById("phone1").focus();
        return -1;
    }
    if(orderPhone2 == ""){
        alert("핸드폰 번호를 입력해주세요.");
        document.getElementById("phone2").focus();
        return -1;
    }
    if(orderPhone3 == ""){
        alert("핸드폰 번호를 입력해주세요.");
        document.getElementById("phone3").focus();
        return -1;
    }
    if(orderEmail == ""){
        alert("이메일을 입력해주세요.");
        document.getElementById("order_email").focus();
        return -1;
    }

    if(selectCnt % 2 == 0){
        let reciNm = document.getElementById("recipient_nm").value;
        let reciPhone1 = document.getElementById("reciPhone1").value;
        let reciPhone2 = document.getElementById("reciPhone2").value;
        let reciPhone3 = document.getElementById("reciPhone3").value;
        let zipCode = document.getElementById("zip_code").value;
        let addressDetail = document.getElementById("address_detail").value;

        if(reciNm == ""){
            alert("받으시는 분 이름을 입력해주세요.");
            document.getElementById("recipient_nm").focus();
            return -1;
        }
        if(reciPhone1 == ""){
            alert("핸드폰 번호를 입력해주세요.");
            document.getElementById("reciPhone1").focus();
            return -1;
        }
        if(reciPhone2 == ""){
            alert("핸드폰 번호를 입력해주세요.");
            document.getElementById("reciPhone2").focus();
            return -1;
        }
        if(reciPhone3 == ""){
            alert("핸드폰 번호를 입력해주세요.");
            document.getElementById("reciPhone3").focus();
            return -1;
        }
        if(zipCode == ""){
            alert("배송지 정보를 입력해주세요.");
            document.getElementById("zip_code").focus();
            return -1;
        }
        if(addressDetail == ""){
            alert("상세 주소를 입력해주세요.");
            document.getElementById("address_detail").focus();
            return -1;
        }
    }else{
        let newReciNm = document.getElementById("new_recipient_nm").value;
        let newReciPhone1 = document.getElementById("new_reciPhone1").value;
        let newReciPhone2 = document.getElementById("new_reciPhone2").value;
        let newReciPhone3 = document.getElementById("new_reciPhone3").value;
        let newZipCode = document.getElementById("new_zip_code").value;
        let newAddressDetail = document.getElementById("new_address_detail").value;

        if(newReciNm == ""){
            alert("받으시는 분 이름을 입력해주세요.");
            document.getElementById("new_recipient_nm").focus();
            return -1;
        }
        if(newReciPhone1 == ""){
            alert("핸드폰 번호를 입력해주세요.");
            document.getElementById("new_reciPhone1").focus();
            return -1;
        }
        if(newReciPhone2 == ""){
            alert("핸드폰 번호를 입력해주세요.");
            document.getElementById("new_reciPhone2").focus();
            return -1;
        }
        if(newReciPhone3 == ""){
            alert("핸드폰 번호를 입력해주세요.");
            document.getElementById("new_reciPhone3").focus();
            return -1;
        }
        if(newZipCode == ""){
            alert("배송지 정보를 입력해주세요.");
            document.getElementById("new_zip_code").focus();
            return -1;
        }
        if(newAddressDetail == ""){
            alert("상세 주소를 입력해주세요.");
            document.getElementById("new_address_detail").focus();
            return -1;
        }
    }
}

const kakaopaySuccess = () => {
    // 결제정보에 보낼 데이터
    let prdtIdClass = document.querySelectorAll(".prdt_id");
    let prdtPriceClass = document.querySelectorAll(".prdt_price");
    let prdtAmountClass = document.querySelectorAll(".prdt_amount");
    // let creditPriceClass = document.querySelectorAll(".credit_price");
    // let creditWayClass = document.querySelectorAll(".credit_way");
    let creditWayClass = document.querySelectorAll(".creditWay");
    let creditWay = document.querySelectorAll(".credit_way");
    let orderNmClass = document.querySelectorAll(".order_nm");
    let orderPhoneNumClass = document.querySelectorAll(".order_phone_num");
    let orderEmailClass = document.querySelectorAll(".order_email");
    let recipientNmClass = document.querySelectorAll(".recipient_nm");
    let recipientPhoneNumClass = document.querySelectorAll(".recipient_phone_num");
    let recipientZipCodeClass = document.querySelectorAll(".recipient_zip_code");
    let recipientAddressClass = document.querySelectorAll(".recipient_address");
    let recipientAddressDetailClass = document.querySelectorAll(".recipient_address_detail");
    let recipientMemoClass = document.querySelectorAll(".recipient_memo");
    // 결제정보에 보낼 데이터

    //결제 정보에 보낼 데이터에 들어갈 value config
    let prdtId = document.querySelectorAll(".prdtId");
    let prdtPrice = document.querySelectorAll(".prdtPrice");
    let prdtAmount = document.querySelectorAll(".prdtAmount");
    let orderNmId = document.getElementById("order_nm").value;
    let orderPhone1 = document.getElementById("phone1").value;
    let orderPhone2 = document.getElementById("phone2").value;
    let orderPhone3 = document.getElementById("phone3").value;
    let orderEmail = document.getElementById("order_email").value;
    let reciNm = document.getElementById("recipient_nm").value;
    let reciPhone1 = document.getElementById("reciPhone1").value;
    let reciPhone2 = document.getElementById("reciPhone2").value;
    let reciPhone3 = document.getElementById("reciPhone3").value;
    let zipCode = document.getElementById("zip_code").value;
    let address = document.getElementById("address").value;
    let addressDetail = document.getElementById("address_detail").value;
    let memo = document.getElementById("memo").value;

    let newReciNm = document.getElementById("new_recipient_nm").value;
    let newReciPhone1 = document.getElementById("new_reciPhone1").value;
    let newReciPhone2 = document.getElementById("new_reciPhone2").value;
    let newReciPhone3 = document.getElementById("new_reciPhone3").value;
    let newZipCode = document.getElementById("new_zip_code").value;
    let newAddress = document.getElementById("new_address").value;
    let newAddressDetail = document.getElementById("new_address_detail").value;
    let newMemo = document.getElementById("new_memo").value;
    //결제 정보에 보낼 데이터에 들어갈 value config


    if(selectCnt % 2 == 0){ // 기존 배송지일 경우
        for(var i = 0; i < creditWayClass.length; i++){
            if(creditWayClass[i].checked){
                for(var j = 0; j < creditWay.length; j++){
                    creditWay[j].value = creditWayClass[i].value;
                }
                break;
            }
        }
        orderNmClass[0].value = orderNmId;
        orderPhoneNumClass[0].value = orderPhone1+orderPhone2+orderPhone3;
        orderEmailClass[0].value = orderEmail;
        recipientNmClass[0].value = reciNm;
        recipientPhoneNumClass[0].value = reciPhone1+reciPhone2+reciPhone3;
        recipientZipCodeClass[0].value = zipCode
        recipientAddressClass[0].value = address;
        recipientAddressDetailClass[0].value = addressDetail;
        recipientMemoClass[0].value = memo;
        return 0;
    }else{ // 새로운 배송지일 경우
        for(var i = 0; i < creditWayClass.length; i++){
            if(creditWayClass[i].checked){
                for(var j = 0; j < creditWay.length; j++){
                    creditWay[j].value = creditWayClass[i].value;
                }
                break;
            }
        }
        orderNmClass[1].value = orderNmId
        orderPhoneNumClass[1].value = orderPhone1+orderPhone2+orderPhone3;
        orderEmailClass[1].value = orderEmail;
        recipientNmClass[1].value = newReciNm;
        recipientPhoneNumClass[1].value = newReciPhone1+newReciPhone2+newReciPhone3;
        recipientZipCodeClass[1].value = newZipCode
        recipientAddressClass[1].value = newAddress;
        recipientAddressDetailClass[1].value = newAddressDetail;
        recipientMemoClass[1].value = newMemo;
        return 1;
    }
}


const sample6_execDaumPostcode = () => {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = '';
						var extraAddr = ''; 

						if (data.userSelectedType === 'R') { 
							addr = data.roadAddress;
						} else { 
							addr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
						}

                        if(selectCnt % 2 == 0){
                            document.getElementById('zip_code').value = data.zonecode;
                            document.getElementById("address").value = addr;
                            document.getElementById("address_detail").focus();
                        }else{
                            document.getElementById('new_zip_code').value = data.zonecode;
                            document.getElementById("new_address").value = addr;
                            document.getElementById("new_address_detail").focus();
                        }
					}
				}).open();
	}