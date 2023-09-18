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