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