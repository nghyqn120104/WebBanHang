<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebBanHang.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Assets/css/Login.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="login-section">
            <div class="login-header">
                <h3 class="login-header">Trang đăng nhập</h3>
            </div>

            <div class="login-body">
                <div class="login-form">
                    <label for="" class="login-label">Tên đăng nhập</label>
                    <asp:TextBox ID="txtTenDangNhap" runat="server" class="login-input" placeholder="Tên đăng nhập" ClientIDMode="Static"></asp:TextBox>
                <p class="errorUserName">Tên đăng nhập không được để trống</p>
                </div>

                <div class="login-form">
                    <label for="" class="login-label">Mật khẩu</label>
                    <asp:TextBox ID="txtPassword" runat="server" class="login-input" placeholder="Nhập mật khẩu" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                <p class="errorPassword">Mật khẩu không được để trống</p>
                </div>

                <asp:Button ID="btnDangNhap" runat="server" Text="Đăng nhập" ClientIDMode="Static" OnClick="btnDangNhap_Click"/>
            </div>

            <div class="login-footer">
                <div class="login-footer__action-account">
                    <a href="#" class="login-footer__forgot-password link">Quên mật khẩu?</a>
                </div>

                <div class="login-footer__action-account">
                    <a href="Register.aspx" class="login-footer__not-have-account link">Tạo tài khoản</a>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script src="../JS/Login.js"></script>
</body>
</html>
