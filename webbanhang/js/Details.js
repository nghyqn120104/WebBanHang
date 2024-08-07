const menuMobile = document.getElementById('menu');
const menu = document.querySelector('.menu-mobile');
var modal = document.getElementById("modal_cart");
var btn = document.getElementById("openModalBtn");
var span = document.getElementsByClassName("close")[0];
var currentWidth = menu.clientWidth;

function showMenu() {
    menu.classList.add('open');
}

function closeMenu() {
    menu.classList.remove('open')
}

menuMobile.onclick = function () {
    var isClosed = menu.clientWidth === currentWidth;
    if (isClosed) {
        showMenu();
    } else {
        closeMenu();
    }
}

const menuItems = document.querySelectorAll('.nav-menu li a[href*="#"]');
for (var i = 0; i < menuItems.length; i++) {
    const menuItem = menuItems[i];
    menuItem.onclick = function () {
        closeMenu();
    }
}
function redirectToCart() {
    window.location.href = 'Cart.aspx';
}


// Xử lý khi click vào nút Purchase Now
btn.onclick = function () {
    modal.style.display = "block";
}

// Khi người dùng nhấn vào nút x, đóng Modal
span.onclick = function () {
    modal.style.display = "none";
}

// Khi người dùng nhấn vào bất kỳ đâu bên ngoài Modal, đóng Modal
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}



