let selectCnt = 0;

window.onload = () => {
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
	return;
}

const selectChange = () => {
	console.log("gdgd");
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
            amount : price,
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
                location.href='/orders?user_id='+user_id;
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