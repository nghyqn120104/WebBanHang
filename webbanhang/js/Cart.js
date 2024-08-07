var modal = document.getElementById("modal_cart");
var btn = document.getElementById("openModalBtn");
var span = document.getElementsByClassName("close")[0];
var deleteBtns = document.querySelectorAll(".btn_delete");
// Khi người dùng nhấn vào nút, mở Modal
btn.onclick = function () {
    modal.style.display = "flex";
    modal.style.alignItems = "center";
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

const menuMobile = document.getElementById('menu');
const menu = document.querySelector('.menu-mobile');

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

//Xóa sản phẩm trong giỏ hàng
//deleteBtns.forEach(function (deleteBtn) {
//    deleteBtn.onclick = function () {
//        var message = confirm("Bạn có chắc muốn xóa sản phẩm này không");
//        if (message == true) {
//            var productItem = deleteBtn.parentElement;
//            productItem.remove();
//        }
//    }
//});
