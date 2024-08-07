var userName = document.getElementById("txtTenDangNhap");
var password = document.getElementById("txtPassword");

var errorUserName = document.querySelector('.errorUserName');
var errorPassword = document.querySelector('.errorPassword');

function validation() {
    const usernameValue = userName.value.trim();
    const passwordValue = password.value.trim();

    let isValid = true;

    if (usernameValue === "") {
        if (errorUserName) {
            errorUserName.classList.add('open');
        }
        userName.focus();
        isValid = false;
    } else {
        if (errorUserName) {
            errorUserName.classList.remove('open');
            errorUserName.textContent = "";
        }
    }

    if (passwordValue === "") {
        if (errorPassword) {
            errorPassword.classList.add('open');
        }
        password.focus();
        isValid = false;
    } else {
        if (errorPassword) {
            errorPassword.classList.remove('open');
        }
    }

    return isValid;
}

userName.addEventListener('input', function () {
    if (userName.value.trim() !== "") {
        if (errorUserName) {
            errorUserName.classList.remove('open');
        }
    }
});

password.addEventListener('input', function () {
    if (password.value.trim() !== "") {
        if (errorPassword) {
            errorPassword.classList.remove('open');
        }
    }
});

document.getElementById("btnDangNhap").onclick = function () {
    return validation();
}
