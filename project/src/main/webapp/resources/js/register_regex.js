function id_click(){
    document.getElementById("member_id").innerText="영문자 또는 숫자 6~20";
}
function id_blur(){
    document.getElementById("member_id").innerText="";
}

function pw_click(){
    document.getElementById("member_pw").innerText="8~20자 영문, 숫자, 특수문자 필수";
}
function pw_blur(){
    document.getElementById("member_pw").innerText="";
}

function birth_click(){
    document.getElementById("member_birth").innerText="ex)19001010";
}
function birth_blur(){
    document.getElementById("member_birth").innerText="";
}

function email_click(){
    document.getElementById("member_email").innerText="example@naver.com";
}
function email_blur(){
    document.getElementById("member_email").innerText="";
}

function phone_click(){
    document.getElementById("member_phone").innerText="휴대폰번호(-없이 입력)";
}
function phone_blur(){
    document.getElementById("member_phone").innerText="";
}

function check(){
    var id = document.getElementById('id').value;
    var pw = document.getElementById('pw').value;
    var pwCheck = document.getElementById('pwCheck').value;
    var nm = document.getElementById('nm').value;
    var email = document.getElementById('email').value;
    var birth = document.getElementById('birth').value;
    var phone = document.getElementById('phone').value;
    var zip = document.getElementById('sample6_postcode').value;
    var detail = document.getElementById('sample6_detailAddress').value;
    if(id == ""){
        document.getElementById("msg").innerText="아이디 입력은 필수입니다.";
        return;
    }
    if(pw == ""){
        document.getElementById("msg").innerText="비밀번호 입력은 필수입니다.";
        return;
    }
    if(nm == ""){
        document.getElementById("msg").innerText="이름 입력은 필수입니다.";
        return;
    }
    if(email == ""){
        document.getElementById("msg").innerText="이메일 입력은 필수입니다.";
        return;
    }
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
    
    var idRegex = /^[A-Za-z]{1}[A-Za-z0-9_-]{5,19}$/;
    var pwRegex = /(?=.*\d)(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,19}/;
    var birthRegex;
    var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    var phoneRegex = /^[0-9]{11,11}$/;
    
    var idr = idRegex.test(id);
    var pwr = pwRegex.test(pw);
    var emailr = emailRegex.test(email);
    var phoner = phoneRegex.test(phone);
    

    if(idr === false){
        document.getElementById("msg").innerText="아이디가 형식에 맞지 않습니다.";
        return;
    }
    if(pwr === false){
        document.getElementById("msg").innerText="비밀번호가 형식에 맞지 않습니다.";
        return;
    }
    if(birthRegex <= 10000000){
        document.getElementById("msg").innerText="생년월일이 형식에 맞지 않습니다.";
        return;
    }
    if(emailr === false){
        document.getElementById("msg").innerText="이메일이 형식에 맞지 않습니다.";
        return;
    }
    if(phoner === false){
        document.getElementById("msg").innerText="핸드폰번호가 형식에 맞지 않습니다.";
        return;
    }

    document.getElementById('f').submit();
}