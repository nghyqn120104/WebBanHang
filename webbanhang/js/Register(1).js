var userName = document.getElementById("txtTenDangNhap");
var eMail = document.getElementById("txtEmail");
var sdt = document.getElementById("txtSDT");
var password = document.getElementById("txtMatKhau");
var confirmPassword = document.getElementById("txtXacNhanMatKhau");

var errorUsername = document.getElementById("errorUserName"); // Chỉnh sửa đúng tên ID
var errorEmail = document.getElementById("errorEmail");
var errorPhoneNumber = document.getElementById("errorPhoneNumber");
var errorPassword = document.getElementById("errorPassword");
var errorConfirmPassword = document.getElementById("errorConfirmPassword");

function validation() {
    const usernameValue = userName.value.trim(); // Chỉnh sửa đúng tên biến
    const sdtValue = sdt.value.trim();
    const emailValue = eMail.value.trim(); // Chỉnh sửa đúng tên biến
    const passwordValue = password.value.trim();
    const confirmPasswordValue = confirmPassword.value.trim();

    errorEmail.innerText = "";
    errorPassword.innerText = "";
    errorUsername.innerText = "";
    errorPhoneNumber.innerText = "";
    errorConfirmPassword.innerText = "";

    if (usernameValue === "") {
        errorUsername.innerText = "Chưa nhập tài khoản!";
        userName.focus(); // Chỉnh sửa đúng tên biến
        return false;
    }

    if (emailValue === "") {
        errorEmail.innerText = "Chưa nhập Email!";
        eMail.focus(); // Chỉnh sửa đúng tên biến
        return false;
    }

    if (sdtValue === "") {
        errorPhoneNumber.innerText = "Chưa nhập số điện thoại";
        sdt.focus();
        return false;
    }

    if (passwordValue === "") {
        errorPassword.innerText = "Chưa nhập mật khẩu";
        password.focus();
        return false;
    }

    if (confirmPasswordValue === "") {
        errorConfirmPassword.innerText = "Hãy xác nhận mật khẩu!";
        confirmPassword.focus();
        return false;
    }

    if (confirmPasswordValue !== passwordValue) {
        errorConfirmPassword.innerText = "Mật khẩu nhập lại chưa đúng!";
        confirmPassword.focus();
        return false;
    }

    if (passwordValue === confirmPasswordValue) {
        errorPassword.innerText = "";
        errorUsername.innerText = "";
        errorEmail.innerText = "";
        errorConfirmPassword.innerText = "";
        return true;
    }
}

document.getElementById("btnDangKi").onclick = function () {
    return validation();
}
