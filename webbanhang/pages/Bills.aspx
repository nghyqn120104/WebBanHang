<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bills.aspx.cs" Inherits="WebBanHang.Pages.Bill_Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/css/header.css">
    <link rel="stylesheet" href="../Assets/css/Search.css">
    <link rel="stylesheet" href="../Assets/css/Bills.css">
    <link rel="stylesheet" href="../Assets/css/Bill_Detail.css">
    <link rel="stylesheet" href="../Assets/css/Cart.css">
    <link rel="stylesheet" href="../Assets/css/Footer.css">
    <link rel="stylesheet" href="../Assets/css/Grid.css">
    <link rel="stylesheet" href="../Assets/css/Responsive.css">
    <link rel="stylesheet" href="../Assets/icons/fontawesome-free-6.4.2-web/fontawesome-free-6.4.2-web/css/all.min.css">
    <title>Hóa đơn</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="header">
                <div class="header-infor">
                    <div class="header-infor__title">
                        <h3 class="infor-title">
                            <a href="../Pages/Home.aspx" class="infor-title__link">QLAPTOP</a>
                        </h3>
                    </div>

                    <div class="header-infor__input">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="infor-search"></asp:TextBox>
                        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn-search" OnClick="btnSearch_Click">
                                <i class="fa-solid fa-magnifying-glass search-icon"></i> 
                        </asp:LinkButton>
                        <asp:Label ID="errMessage" CssClass="errMessage" ClientIDMode="Static" runat="server" Text="Hãy nhập đầy đủ thông tin" Visible="false" ForeColor="Red"></asp:Label>

                    </div>

                    <div class="header-infor__customer">
                        <div class="infor-customer__icon">
                            <a href="" class="infor-customer__icon--link">
                                <i class="fa-solid fa-user user-icon"></i>
                            </a>
                            <ul class="customer-account" id="customerAccount" runat="server">
                                <li class="customer-account--item">
                                    <a href="Login.aspx" class="customer-item--link">Đăng nhập</a>
                                </li>
                                <li class="customer-account--item">
                                    <a href="Register.aspx" class="customer-item--link">Đăng ký</a>
                                </li>
                            </ul>
                        </div>

                        <div class="infor-cart__icon">
                            <a href="#" class="infor-cart__icon--link">
                                <i class="fa-solid fa-cart-shopping cart-icon"></i>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="header--forMobile">
                    <div class="header-wrap">
                        <div class="header-element">
                            <h3 class="header-title">
                                <a href="#" class="header-title--link">QLAPTOP</a>
                            </h3>
                        </div>
                        <div class="header-element">
                            <div id="menu" class="header-menu">
                                <i class="fa-solid fa-bars menu-icon"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main -->
            
                    <main>
                        <div class="content">
                            <div id="notFound" runat="server" style="min-height: 400px; font-size: 1.8rem;">Chưa có hóa đơn nào</div>
                            <div class="container" id="container" runat="server">
                                <asp:ListView ID="lvHoaDon" runat="server">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="itemBill_button" runat="server" CommandArgument='<%# Eval("iMaHD") %>' OnClick="itemBill_click">
                                            <div class="row content-item" runat="server">
                                                <div class="l-3 m-3 bill_id">
                                                    <h3>Hóa đơn : <%# Eval("iMaHD")  %></h3>
                                                </div>
                                                <div class="l-9 m-9 order_time">
                                                    <h3 style="display: block;">Thời gian đặt: <%# Eval("dNgayLapHD", "{0:ddMMyyyy}")  %></h3>
                                                </div>
                                            </div>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSourceHoaDon" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>"
                                    SelectCommand="select * from tblHoaDon where sTenDangNhap = @sTenDangNhap">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="iMaHD" SessionField="iMaHD" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </main>
                

            <!-- Footer  -->
            <footer class="footer">
                <div class="grid wide footer__content">
                    <div class="grid row">
                        <div class="col l-3 m-4 c-6">
                            <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                            <ul class="footer__list">
                                <li class="footer__item"><a href="" class="footer__item-link">Trung tâm trợ giúp</a></li>
                                <li class="footer__item"><a href="" class="footer__item-link">QLAPTOP Mail</a></li>
                                <li class="footer__item"><a href="" class="footer__item-link">Hướng dẫn mua hàng</a></li>
                            </ul>
                        </div>

                        <div class="col l-3 m-4 c-6">
                            <h3 class="footer__heading">Giới thiệu</h3>
                            <ul class="footer__list">
                                <li class="footer__item"><a href="" class="footer__item-link">Giới thiệu về QLAPTOP</a></li>
                                <li class="footer__item"><a href="" class="footer__item-link">Tuyển dụng</a></li>
                                <li class="footer__item"><a href="" class="footer__item-link">Điều khoản QLAPTOP</a></li>
                            </ul>
                        </div>

                        <div class="col l-3 m-4 c-6">
                            <h3 class="footer__heading">Danh mục</h3>
                            <ul class="footer__list">
                                <li class="footer__item"><a href="" class="footer__item-link">LapTop Gaming</a></li>
                                <li class="footer__item"><a href="" class="footer__item-link">LapTop Đồ Hoạ</a></li>
                                <li class="footer__item"><a href="" class="footer__item-link">LapTop Mỏng Nhẹ</a></li>
                            </ul>
                        </div>

                        <div class="col l-3 m-4 c-6">
                            <h3 class="footer__heading">Theo dõi chúng tôi</h3>
                            <ul class="footer__list">
                                <li class="footer__item">
                                    <a href="" class="footer__item-link">
                                        <i class="footer__item-icon fa-brands fa-facebook"></i>
                                        Facebook
                                    </a>
                                </li>
                                <li class="footer__item"><a href="" class="footer__item-link">
                                    <i class="footer__item-icon fa-brands fa-instagram"></i>
                                    Instagram
                                </a></li>
                                <li class="footer__item"><a href="" class="footer__item-link">
                                    <i class="footer__item-icon fa-brands fa-linkedin"></i>
                                    Linkedin
                                </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="footer__bottom">
                    <div class="grid wide">
                        <ul class="footer__bottom-list">
                            <li class="footer__bottom-item">
                                <a href="" class="footer__bottom-link">Chính sách bảo mật
                                </a>
                            </li>
                            <li class="footer__bottom-item">
                                <a href="" class="footer__bottom-link">Cơ chế hoạt động
                                </a>
                            </li>
                            <li class="footer__bottom-item">
                                <a href="" class="footer__bottom-link">Chính sách vận chuyển
                                </a>
                            </li>
                            <li class="footer__bottom-item">
                                <a href="" class="footer__bottom-link">Chính sách trả hàng và hoàn tiền
                                </a>
                            </li>
                        </ul>
                        <div class="footer__bottom-policy">
                            <img src="assets/img/checked.png" alt="" class="footer__bottom-img">
                        </div>
                        <p class="footer__text">Công ty TNHH QLAPTOP</p>
                        <p class="footer__text">
                            Địa chỉ: Số 31 ngõ 35 Cát Linh, phường Cát Linh, quận Đống Đa, thành phố Hà Nội
                        </p>
                        <p class="footer__text">
                            Mã số doanh nghiệp: 0108838679 do Sở Kế Hoạch &amp; Đầu Tư TP Hà Nội cấp lần đầu ngày 10/02/2015
                        </p>
                        <p class="footer__text">© 2023 - Bản quyền thuộc về Công ty TNHH QLAPTOP</p>
                    </div>
                </div>
            </footer>
        </div>

        <!-- Menu Mobile -->
        <div class="menu-mobile">
            <div class="menu-wrap">
                <ul class="nav-menu">
                    <li class="menu-item">
                        <a href="../pages/home.html" class="menu-item-link">
                            <i class="fa-solid fa-house home-icon"></i>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="../pages/home.html#gaming" class="menu-item-link">Laptop Gaming
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="../pages/home.html#dohoa" class="menu-item-link">LapTop Đồ Hoạ
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="../pages/home.html#mongnhe" class="menu-item-link">LapTop Mỏng nhẹ
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
