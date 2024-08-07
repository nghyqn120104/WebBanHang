<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebBanHang.Pages.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Assets/css/Register.css" />
    <title>Trang đăng ký</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="register-section">
                <div class="register-header">
                    <h3 class="register-header">Đăng ký tài khoản</h3>
                </div>

                <div class="register-body">
                    <div class="register-form">
                        <label for="" class="register-label">Tên đăng nhập</label>
                        <asp:TextBox ID="txtTenDangNhap" runat="server" CssClass="register-input" placeholder="Nhập tên đăng nhập" ClientIDMode="Static"></asp:TextBox>
                        <p class="errorUserName">Tên đăng nhập không được để trống</p>
                    </div>

                    <div class="register-form">
                        <label for="" class="register-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="register-input" placeholder="Nhập email" TextMode="Email" ClientIDMode="Static"></asp:TextBox>
                        <p class="errorEmail">Email không được để trống</p>
                    </div>

                    <div class="register-form">
                        <label for="" class="register-label">Số điện thoại</label>
                        <asp:TextBox ID="txtSDT" runat="server" CssClass="register-input" placeholder="Nhập số điện thoại" ClientIDMode="Static"></asp:TextBox>
                        <p class="errorPhoneNumber">Số điện thoại không được để trống</p>
                    </div>

                    <div class="register-form">
                        <label for="" class="register-label">Địa chỉ</label>
                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="register-input" placeholder="Nhập địa chỉ" ClientIDMode="Static"></asp:TextBox>
                        <p class="errorAddress">Địa chỉ không được để trống</p>
                    </div>

                    <div class="register-form">
                        <label for="" class="register-label">Mật khẩu</label>
                        <asp:TextBox ID="txtMatKhau" runat="server" CssClass="register-input" placeholder="Nhập mật khẩu" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                        <p class="errorPassword">Không được để trống mật khẩu</p>
                    </div>

                    <div class="register-form">
                        <label for="" class="register-label">Xác nhận mật khẩu</label>
                        <asp:TextBox ID="txtXacNhanMatKhau" runat="server" CssClass="register-input" placeholder="Nhập lại mật khẩu" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                        <p class="errorConfirmPassword">Hãy xác nhận mật khẩu</p>
                    </div>

                    <asp:Button ID="btnDangKi" runat="server" Text="Đăng ký" ClientIDMode="Static" OnClick="btnDangKi_Click" />
                </div>

                <div class="register-footer">
                    <p class="register-have-account">
                        <a class="register-have-account--link" href="Login.aspx">Đã có tài khoản? Đăng nhập ngay</a>
                    </p>
                </div>
            </div>
        </div>
    </form>
    <script src="../JS/Register.js"></script>
</body>
</html>
