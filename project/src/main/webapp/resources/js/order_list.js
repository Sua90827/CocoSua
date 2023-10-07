window.onload = () => {
    let prdtPrice = document.querySelectorAll(".prdtPrice");
    let prdtNum = document.querySelectorAll(".prdtNum");
    let prdtAllPrice = document.querySelectorAll(".prdtAllPrice");
    
    for(var i = 0; i < prdtPrice.length; i++){
        prdtAllPrice[i].value = Number(prdtPrice[i].value) * Number(prdtNum[i].value);
    }
    
}

const deliveryBtn = (cnt) => {
    let number = Number(cnt);
    let deliveryForm = document.querySelectorAll(".deliveryForm");
    deliveryForm[number].submit();
}

const deliveryInfoBlock = (cnt) => {
    const number = Number(cnt);
    let deliveryInfoView = document.querySelectorAll(".deliveryInfoView");
    let deliveryInfoNonView = document.querySelectorAll(".deliveryInfoNonView");
    let deleveryInfoDiv = document.querySelectorAll(".deleveryInfoDiv");
    deliveryInfoView[number].style.display = "none";
    deliveryInfoNonView[number].style.display = "flex";
    deleveryInfoDiv[number].style.display = "block";
}

const deliveryInfoNone = (cnt) => {
    const number = Number(cnt);
    let deliveryInfoView = document.querySelectorAll(".deliveryInfoView");
    let deliveryInfoNonView = document.querySelectorAll(".deliveryInfoNonView");
    let deleveryInfoDiv = document.querySelectorAll(".deleveryInfoDiv");
    deliveryInfoView[number].style.display = "flex";
    deliveryInfoNonView[number].style.display = "none";
    deleveryInfoDiv[number].style.display = "none";
}

const reviewOn = (prdt_title, prdt_nm, prdt_id, prdt_color, index, credit_id) => {
    modalContainerId = document.getElementById("modalContainer");
    document.getElementById("id").value=prdt_nm+ " " + prdt_title + " " + prdt_color + " " + prdt_id;
    document.getElementById("prdt_title").value=prdt_title;
    document.getElementById("prdt_nm").value=prdt_nm;
    document.getElementById("prdt_id").value=prdt_id;
    document.getElementById("prdt_color").value=prdt_color;
    document.getElementById("index").value=index;
    document.getElementById("credit_id").value=credit_id;
    
    modalContainerId.style.display = "";

}

const reviewOff = () => {
    modalContainerId = document.getElementById("modalContainer");
    modalContainerId.style.display = "none";
}