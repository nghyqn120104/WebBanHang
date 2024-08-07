var userName = document.getElementById("txtTenDangNhap");
var eMail = document.getElementById("txtEmail");
var sdt = document.getElementById("txtSDT");
var address = document.getElementById('txtDiaChi');
var password = document.getElementById("txtMatKhau");
var confirmPassword = document.getElementById("txtXacNhanMatKhau");

var errorUserName = document.querySelector('.errorUserName');
var errorPassword = document.querySelector('.errorPassword');
var errorConfirmPassword = document.querySelector('.errorConfirmPassword');
var errorEmail = document.querySelector('.errorEmail');
var errorPhoneNumber = document.querySelector('.errorPhoneNumber');
var errorAddress = document.querySelector('.errorAddress');

function validation() {
    const usernameValue = userName.value.trim();
    const sdtValue = sdt.value.trim();
    const emailValue = eMail.value.trim();
    const addressValue = address.value.trim();
    const passwordValue = password.value.trim();
    const confirmPasswordValue = confirmPassword.value.trim();

    if (usernameValue === "") {
        if (errorUserName) {
            errorUserName.classList.add('open');
        }
        userName.focus();
        return false;
    } else {
        if (errorUserName) {
            errorUserName.classList.remove('open');
        }
    }

    if (emailValue === "") {
        if (errorEmail) {
            errorEmail.classList.add('open');
        }
        eMail.focus();
        return false;
    } else {
        if (errorEmail) {
            errorEmail.classList.remove('open');
        }
    }

    if (sdtValue === "") {
        if (errorPhoneNumber) {
            errorPhoneNumber.classList.add('open');
        }
        sdt.focus();
        return false;
    } else {
        if (errorPhoneNumber) {
            errorPhoneNumber.classList.remove('open');
        }
    }

    if (addressValue === "") {
        if (errorAddress) {
            errorAddress.classList.add('open');
        }
        address.focus();
        return false;
    } else {
        if (errorAddress) {
            errorAddress.classList.remove('open');
        }
    }

    if (passwordValue === "") {
        if (errorPassword) {
            errorPassword.classList.add('open');
        }
        password.focus();
        return false;
    } else {
        if (errorPassword) {
            errorPassword.classList.remove('open');
        }
    }

    if (confirmPasswordValue === "") {
        if (errorConfirmPassword) {
            errorConfirmPassword.classList.add('open');
        }
        confirmPassword.focus();
        return false;
    } else {
        if (errorConfirmPassword) {
            errorConfirmPassword.classList.remove('open');
        }
    }

    if (confirmPasswordValue !== passwordValue) {
        if (errorConfirmPassword) {
            errorConfirmPassword.classList.add('open');
        }
        confirmPassword.focus();
        return false;
    } else {
        if (errorConfirmPassword) {
            errorConfirmPassword.classList.remove('open');
        }
    }

    return true;
}

userName.addEventListener('input', function () {
    if (userName.value.trim() !== "") {
        if (errorUserName) {
            errorUserName.classList.remove('open');
        }
    }
});

eMail.addEventListener('input', function () {
    if (eMail.value.trim() !== "") {
        if (errorEmail) {
            errorEmail.classList.remove('open');
        }
    }
});

sdt.addEventListener('input', function () {
    if (sdt.value.trim() !== "") {
        if (errorPhoneNumber) {
            errorPhoneNumber.classList.remove('open');
        }
    }
});

address.addEventListener('input', function () {
    if (address.value.trim() !== "") {
        if (errorAddress) {
            errorAddress.classList.remove('open');
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

confirmPassword.addEventListener('input', function () {
    if (confirmPassword.value.trim() !== "") {
        if (errorConfirmPassword) {
            errorConfirmPassword.classList.remove('open');
        }
    }
});

document.getElementById("btnDangKi").onclick = function () {
    return validation();
}
