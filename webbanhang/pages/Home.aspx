<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebBanHang.Pages.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/css/header.css">
    <link rel="stylesheet" href="../Assets/css/Home.css">
    <link rel="stylesheet" href="../Assets/css/Footer.css">
    <link rel="stylesheet" href="../Assets/css/MobileHeader.css">
    <link rel="stylesheet" href="../Assets/css/Grid.css">
    <link rel="stylesheet" href="../Assets/css/Responsive.css">
    <link rel="stylesheet" href="../Assets/icons/fontawesome-free-6.4.2-web/fontawesome-free-6.4.2-web/css/all.min.css">
    <title>Trang chủ</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="main">
                <%-- Header --%>
                <div class="header">
                    <div class="header-infor">
                        <div class="header-infor__title">
                            <h3 class="infor-title">
                                <a href="#" class="infor-title__link">QLAPTOP</a>
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
                                <a class="infor-customer__icon--link">
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
                                <a href="Cart.aspx" class="infor-cart__icon--link">
                                    <i class="fa-solid fa-cart-shopping cart-icon"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="header-navigators">
                        <ul class="nav-lists">
                            <li class="nav-lists--item">
                                <a href="#" class="list-item--link">Trang chủ</a>
                            </li>
                            <li class="nav-lists--item laptop-type">
                                <a href="#gaming" class="list-item--link">Laptop Gaming</a>
                            </li>
                            <li class="nav-lists--item">
                                <a href="#mongnhe" class="list-item--link">Laptop Mỏng nhẹ</a>
                            </li>
                            <li class="nav-lists--item">
                                <a href="#dohoa" class="list-item--link">Laptop Đồ hoạ</a>
                            </li>
                            <%--                            <li class="nav-lists--item">
                                <a href="" class="list-item--link">Giới thiệu</a>
                            </li>--%>
                        </ul>
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

                <%-- Banner --%>
                <div class="banner">
                    <div class="banner-img">
                        <img src="../Assets/img/asus-tuf-gaming-f15-fx507vv4-i9-lp382w-acv-1.jpg" alt="" class="banner-img__asus">
                    </div>
                </div>

                <%-- Content --%>
                <div class="content">
                    <div class="grid wide">
                        <div id="gaming" class="row app-content no-gutters">
                            <div class="col l-2 m-0 c-0">
                                <img src="../Assets/img/banner/Laptop-Asus-ROG.jpg" alt="" class="img-banner">
                            </div>

                            <div class="col l-10 m-12 c-12">
                                <div class="product-title">
                                    <h2 class="title-gaming">LAPTOP GAMING</h2>
                                </div>

                                <div class="home-product">
                                    <div class="row sm-gutter">
                                        <asp:ListView ID="lvLapGaming" runat="server">
                                            <ItemTemplate>
                                                <div class="col l-3 m-6 c-6">
                                                    <a href="Details.aspx?sIDLapTop=<%# Eval("sIDLapTop") %>" class="home-product__item">
                                                        <div class="home-product__item--img"
                                                            style="background-image: url('<%# Eval("sPictureSource") %>');">
                                                        </div>
                                                        <h4 class="home-product__item--title"><%# Eval("sName") %></h4>
                                                        <div class="home-product__item--rateAndguarantee">
                                                            <div class="home-product__item--guarantee">
                                                                <h4 class="home-product__item--guarantee-detail"><%# Eval("sWarranty") %></h4>
                                                            </div>
                                                        </div>
                                                        <div class="home-product__item--price">
                                                            <span class="home-product__item--price-old"><%# Eval("iOldPrice") %> ₫</span>
                                                            <span class="home-product__item--price-current"><%# Eval("iNewPrice") %> ₫</span>
                                                        </div>

                                                        <div class="home-product__item--bonus">
                                                            <h4 class="bonus-detail"><%# Eval("sBoostRam") %></h4>
                                                        </div>

                                                        <div class="home-product__item-elements">
                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/cpu-tower.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sCpu") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/graphic-card.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sGraphicCard") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/ram.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sRam") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/m2.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sStorage") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/battery.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sBattery") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/weight.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sWeight") %></h3>
                                                            </div>
                                                        </div>
                                                        <asp:LinkButton ID="lbAddToCart1" runat="server" OnClick="lbAddToCart1_Click" CommandArgument='<%# Eval("sIDLapTop") %>' CssClass="home-product__item--addCart">
                                                            <div class="infor-addCart__icon--link">
                                                                <i class="fa-solid fa-cart-shopping addCart-icon"></i>
                                                            </div>
                                                            <div class="addCart-title">
                                                                Thêm vào giỏ hàng
                                                            </div>
                                                      </asp:LinkButton>
                                                    </a>
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>" ProviderName="<%$ ConnectionStrings:WebBanHangConnectionString.ProviderName %>"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="mongnhe" class="row app-content no-gutters">

                            <div class="col l-10 m-12 c-12">
                                <div class="product-title">
                                    <h2 class="title-gaming">LAPTOP MỎNG NHẸ</h2>
                                </div>

                                <div class="home-product">
                                    <div class="row sm-gutter">
                                        <asp:ListView ID="lvMongNhe" runat="server">
                                            <ItemTemplate>
                                                <div class="col l-3 m-6 c-6">
                                                    <a href="Details.aspx?sIDLapTop=<%# Eval("sIDLapTop") %>" class="home-product__item">
                                                        <div class="home-product__item--img"
                                                            style="background-image: url('<%# Eval("sPictureSource") %>');">
                                                        </div>
                                                        <h4 class="home-product__item--title"><%# Eval("sName") %></h4>
                                                        <div class="home-product__item--rateAndguarantee">
                                                            <div class="home-product__item--guarantee">
                                                                <h4 class="home-product__item--guarantee-detail"><%# Eval("sWarranty") %></h4>
                                                            </div>
                                                        </div>
                                                        <div class="home-product__item--price">
                                                            <span class="home-product__item--price-old"><%# Eval("iOldPrice") %> ₫</span>
                                                            <span class="home-product__item--price-current"><%# Eval("iNewPrice") %> ₫</span>
                                                        </div>

                                                        <div class="home-product__item--bonus">
                                                            <h4 class="bonus-detail"><%# Eval("sBoostRam") %></h4>
                                                        </div>

                                                        <div class="home-product__item-elements">
                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/cpu-tower.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sCpu") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/graphic-card.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sGraphicCard") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/ram.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sRam") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/m2.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sStorage") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/battery.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sBattery") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/weight.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sWeight") %></h3>
                                                            </div>
                                                        </div>
                                                    
                                                        <asp:LinkButton ID="lbAddToCart2" runat="server" OnClick="lbAddToCart2_Click" CommandArgument='<%# Eval("sIDLapTop") %>' CssClass="home-product__item--addCart">
                                                                <div class="infor-addCart__icon--link">
                                                                    <i class="fa-solid fa-cart-shopping addCart-icon"></i>
                                                                </div>
                                                                <div class="addCart-title">
                                                                    Thêm vào giỏ hàng
                                                                </div>
                                                         </asp:LinkButton>
                                                       </a>
                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>" ProviderName="<%$ ConnectionStrings:WebBanHangConnectionString.ProviderName %>"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>

                            <div class="col l-2 m-0 c-0">
                                <img src="../Assets/img/banner/Laptop-Acer-Predator-Helios-Neo.jpg" alt="" class="img-banner">
                            </div>
                        </div>

                        <div id="dohoa" class="row app-content no-gutters">
                            <div class="col l-2 m-0 c-0">
                                <img src="../Assets/img/banner/Laptop-Gigabyte.jpg" alt="" class="img-banner">
                            </div>

                            <div class="col l-10 m-12 c-12">
                                <div class="product-title">
                                    <h2 class="title-gaming">LAPTOP ĐỒ HOẠ</h2>
                                </div>

                                <div class="home-product">
                                    <div class="row sm-gutter">
                                        <asp:ListView ID="lvDoHoa" runat="server">
                                            <ItemTemplate>
                                                <div class="col l-3 m-6 c-6">
                                                    <a href="Details.aspx?sIDLapTop=<%# Eval("sIDLapTop") %>" class="home-product__item">
                                                        <div class="home-product__item--img"
                                                            style="background-image: url('<%# Eval("sPictureSource") %>');">
                                                        </div>
                                                        <h4 class="home-product__item--title"><%# Eval("sName") %></h4>
                                                        <div class="home-product__item--rateAndguarantee">
                                                            <div class="home-product__item--guarantee">
                                                                <h4 class="home-product__item--guarantee-detail"><%# Eval("sWarranty") %></h4>
                                                            </div>
                                                        </div>
                                                        <div class="home-product__item--price">
                                                            <span class="home-product__item--price-old"><%# Eval("iOldPrice") %> ₫</span>
                                                            <span class="home-product__item--price-current"><%# Eval("iNewPrice") %> ₫</span>
                                                        </div>

                                                        <div class="home-product__item--bonus">
                                                            <h4 class="bonus-detail"><%# Eval("sBoostRam") %></h4>
                                                        </div>

                                                        <div class="home-product__item-elements">
                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/cpu-tower.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sCpu") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/graphic-card.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sGraphicCard") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/ram.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sRam") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/m2.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sStorage") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/battery.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sBattery") %></h3>
                                                            </div>

                                                            <div class="home-product__item-details">
                                                                <img src="/assets/img/details/weight.png" alt="" class="cpu-img">
                                                                <h3 class="detail"><%# Eval("sWeight") %></h3>
                                                            </div>
                                                        </div>

                                                        <asp:LinkButton ID="lbAddToCart3" runat="server" OnClick="lbAddToCart3_Click" CommandArgument='<%# Eval("sIDLapTop") %>' CssClass="home-product__item--addCart">
                                                                <div class="infor-addCart__icon--link">
                                                                    <i class="fa-solid fa-cart-shopping addCart-icon"></i>
                                                                </div>
                                                                <div class="addCart-title">
                                                                    Thêm vào giỏ hàng
                                                                </div>
                                                         </asp:LinkButton>
                                                    </a>
                                                </div>

                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>" ProviderName="<%$ ConnectionStrings:WebBanHangConnectionString.ProviderName %>"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Footer --%>
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

            <%-- Menu Mobile --%>
            <div class="menu-mobile">
                <div class="menu-wrap">
                    <ul class="nav-menu">
                        <li class="menu-item">
                            <a href="#" class="menu-item-link">
                                <i class="fa-solid fa-house home-icon"></i>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="#gaming" class="menu-item-link">Laptop Gaming
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="#dohoa" class="menu-item-link">LapTop Đồ Hoạ
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="#mongnhe" class="menu-item-link">LapTop Mỏng nhẹ
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
    <script src="../JS/Home.js"></script>
</body>
</html>
