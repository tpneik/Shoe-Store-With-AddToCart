//lấy showLoginForm và loginForm 
var showLoginForm = document.getElementById("showLoginForm");
var loginForm = document.getElementById("loginForm");
//nhấn vào showLoginForm thì hiện loginForm nếu nhấn lại icon sẽ thoát
showLoginForm.onclick = function () {
    loginForm.classList.remove("hidden");
}
var closeLoginForm = document.getElementById("closeLoginForm");

// Add a click event listener to hide the login form
closeLoginForm.addEventListener("click", function () {
    loginForm.classList.add("hidden");
});

// Sự kiện add to cart
const buttons = document.querySelectorAll('.btn');
//console.log(buttons)
buttons.forEach(function(button,index){
    button.addEventListener("click",function(event){
        var btnItem = event.target
        var product = btnItem.parentNode
        var productss = product.parentNode
        var productImg = productss.querySelector("img").src
        var productName = productss.querySelector("h2").innerText
        var productPrice = productss.querySelector("h3").innerText
        //console.log(productPrice)
        addcart(productImg,productName,productPrice)

    })
})
function addcart(productImg,productName,productPrice){
    var addtr = document.createElement("tr")
    var cartItem = document.querySelectorAll("tbody tr")
    for(var i = 0; i < cartItem.length; i++){
        var productT = document.querySelectorAll(".titleproduct")
        if(productT[i].innerHTML == productName){
            alert("Sản phẩm của bạn đã có trong giỏ hàng")
            return
        }
    }
    var trcontent = ' <tr><td style="display: flex; align-items: center;"><img style="width: 100px" src="'+productImg+'" alt=""><span class="titleproduct">'+productName+'</span></td><td><p><span class="prices">'+productPrice+'</span></p></td><td><input style="width: 70px; outline: none;" type="number" value="1" min="1"></td><td style="cursor: pointer;"><span class="delete-cart">Xóa</span></td></tr>'
    addtr.innerHTML = trcontent
    var cartTable = document.querySelector("tbody")
    //console.log(cartTable)
    cartTable.append(addtr)
    carttotal()
    deleteCart()
}
//Xóa sản phẩm
function deleteCart(){
    var cartItem = document.querySelectorAll("tbody tr")
    for(var i = 0; i < cartItem.length; i++){
        var productT = document.querySelectorAll(".delete-cart")
        productT[i].addEventListener("click",function(event){
            var cartdelete = event.target
            var cartItemD = cartdelete.parentNode.parentNode
            cartItemD.remove()
            carttotal()
            //console.log(cartItemD)
        })
    }
}
//Tính tổng tiền
function carttotal(){
    var cartItem = document.querySelectorAll("tbody tr")
    var totalB = 0
    //console.log(cartItem)
    for(var i = 0; i < cartItem.length; i++){
        var inputValue = cartItem[i].querySelector("input").value
        //console.log(inputValue)
        var productPrice = cartItem[i].querySelector(".prices").innerHTML
        //console.log(productPrice)
        totalA = inputValue*productPrice
        //console.log(totalA)
        totalB = totalB + totalA
        //console.log(totalB)
    }
    var cartTotalA = document.querySelector(".price-total span")
    cartTotalA.innerHTML = totalB
    inputchange()
    //.log(cartTotalA)
}

function inputchange(){
    var cartItem = document.querySelectorAll("tbody tr")
    for(var i = 0; i < cartItem.length; i++){
        var inputValue = cartItem[i].querySelector("input")
        inputValue.addEventListener("change",function(){
            carttotal()
        })
    
    }
}

const cartbtn = document.querySelector(".fa-times")
const cartshow = document.querySelector(".fa-cart-shopping")

 cartshow.addEventListener("click",function(){
    document.querySelector(".cart").style.right = "0"
})
cartbtn.addEventListener("click",function(){
    document.querySelector(".cart").style.right = "-100%"
}) 
