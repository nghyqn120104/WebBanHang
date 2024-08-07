var userName = document.getElementById("txtTenDangNhap");
var password = document.getElementById("txtPassword");

var errorUsername = document.getElementById("errorUserName");
var errorPassword = document.getElementById("errorPassword");

function validation() {
    const usernameValue = userName.value.trim();
    const passwordValue = password.value.trim();

    errorUsername.innerText = "";
    errorPassword.innerText = "";

    if (usernameValue === "") {
        errorUsername.innerText = "Chưa nhập tài khoản!";
        userName.focus();
        return false;
    }

    if (passwordValue === "") {
        errorPassword.innerText = "Chưa nhập mật khẩu";
        password.focus();
        return false;
    }
}

document.getElementById("btnDangNhap").onclick = function () {
    return validation();
}