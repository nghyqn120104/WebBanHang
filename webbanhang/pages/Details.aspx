<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="WebBanHang.Pages.Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/css/header.css">
    <link rel="stylesheet" href="../Assets/css/Details.css">
    <link rel="stylesheet" href="../Assets/css/Cart.css">
    <link rel="stylesheet" href="../Assets/css/Footer.css">
    <link rel="stylesheet" href="../Assets/css/MobileHeader.css">
    <link rel="stylesheet" href="../Assets/css/Grid.css">
    <link rel="stylesheet" href="../Assets/css/Responsive.css">
    <link rel="stylesheet" href="../Assets/icons/fontawesome-free-6.4.2-web/fontawesome-free-6.4.2-web/css/all.min.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="main">
                <div class="header">
                    <div class="header-infor">
                        <div class="header-infor__title">
                            <h3 class="infor-title">
                                <a href="Home.aspx" class="infor-title__link">QLAPTOP</a>
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
                <!-- Main  -->
                <asp:Repeater ID="lvProduct" runat="server">
                    <ItemTemplate>
                        <main>
                            <div class="row content">
                                <div class="col l-5 m-5 c-12 img-layer">
                                    <img src="<%# Eval("sPictureSource") %>" alt="Img" class="product-img" />
                                </div>
                                <div class="col l-7 m-7 c-12 details-layer">
                                    <div class="details-title">
                                        <h3 class="p-name"><%# Eval("sName") %></h3>
                                        <div class="details-content">
                                            <div class="p-price"><%# Eval("iNewPrice") %> VNĐ</div>
                                            <div class="purchase-layer">
                                                <asp:LinkButton ID="lbAddToCart2" runat="server" OnClick="lbAddToCart2_Click" CommandArgument='<%# Eval("sIDLapTop") %>' CssClass="home-product__item--addCart">
                                                    <div class="purchase" onclick="redirectToCart(1)">Thêm vào giỏ hàng</div>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Mô tả sản phẩm -->
                            <div class="row describe">
                                <div class="col l-7 product_describe">
                                    <label class="row describe_title">Mô tả sản phẩm</label>
                                    <p><%# Eval("sDescribe") %></p>
                                </div>
                                <div class="col l-5 infor_describe">
                                    <label class="row describe_title">Thông tin chi tiết sản phẩm</label>
                                    <div class="infor_describe-item grey_color">
                                        <div class="infor_describe-item--title">Bảo hành</div>
                                        <label class="infor_describe-item-content"><%# Eval("sWarranty") %></label>
                                    </div>
                                    <div class="infor_describe-item">
                                        <div class="infor_describe-item--title">BoostRam</div>
                                        <label class="infor_describe-item-content"><%# Eval("sBoostRam") %></label>
                                    </div>
                                    <div class="infor_describe-item grey_color">
                                        <div class="infor_describe-item--title">CPU</div>
                                        <label class="infor_describe-item-content"><%# Eval("sCpu") %></label>
                                    </div>
                                    <div class="infor_describe-item">
                                        <div class="infor_describe-item--title">RAM</div>
                                        <label class="infor_describe-item-content"><%# Eval("sRam") %></label>
                                    </div>
                                    <div class="infor_describe-item grey_color">
                                        <div class="infor_describe-item--title">Pin</div>
                                        <label class="infor_describe-item-content"><%# Eval("sBattery") %></label>
                                    </div>
                                    <div class="infor_describe-item">
                                        <div class="infor_describe-item--title">Đồ họa</div>
                                        <label class="infor_describe-item-content"><%# Eval("sGraphicCard") %></label>
                                    </div>
                                    <div class="infor_describe-item grey_color">
                                        <div class="infor_describe-item--title">Cân nặng</div>
                                        <label class="infor_describe-item-content"><%# Eval("sWeight") %></label>
                                    </div>
                                    <div class="infor_describe-item">
                                        <div class="infor_describe-item--title">Bộ nhớ lưu trữ</div>
                                        <label class="infor_describe-item-content"><%# Eval("sStorage") %></label>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>" ProviderName="<%$ ConnectionStrings:WebBanHangConnectionString.ProviderName %>"></asp:SqlDataSource>

                <!--Modal-->
                <div id="modal_cart" class="modal">
                    <div class="modal-content">
                        <div class="container">
                            <span class="close">&times;</span>
                            <h1>Checkout</h1>
                            <div class="product-info">
                                <h2>Thông tin sản phẩm: </h2>
                                <asp:Repeater ID="lvProduct1" runat="server">
                                    <ItemTemplate>
                                        <div class="product">
                                            <div class="product-style">
                                                <img src="<%# Eval("sPictureSource") %>"
                                                    alt="Product Image" class="product-style">
                                            </div>
                                            <div class="product-details">
                                                <p><strong>Tên máy:</strong> <%# Eval("sName") %></p>
                                                <p><strong>Giá :</strong> <%# Eval("iNewPrice") %> VNĐ</p>
                                                <p><strong>Số lượng:</strong> 1</p>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <div class="payment-info" runat="server">
                                <h2>Thông tin khách hàng: </h2>
                                <div class="payment-form">
                                    <!-- <label for="name">Tên:</label> -->
                                    <input type="text" id="name" name="name" placeholder="Họ và tên" required>

                                    <!-- <label for="điện thoại">Số điện thoại:</label> -->
                                    <input type="text" id="phone" name="phone" placeholder="Số Điện Thoại" required>

                                    <!-- <label for="address">Địa chỉ:</label> -->
                                    <asp:TextBox ID="txtAddress" placeholder="Địa chỉ" runat="server" />

                                    <!-- <label for="card">Số thẻ ngân hàng:</label> -->
                                    <input type="text" id="card" name="card" placeholder="Số thẻ ngân hàng" required>


                                    <asp:Button Text="Thanh toán" runat="server" ID="btn_buynow" CssClass="payment-form_button" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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
                                    <li class="footer__item"><a href="" class="footer__item-link">LapTop
                                            Gaming</a></li>
                                    <li class="footer__item"><a href="" class="footer__item-link">LapTop Đồ
                                            Hoạ</a></li>
                                    <li class="footer__item"><a href="" class="footer__item-link">LapTop
                                            Mỏng Nhẹ</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col l-3 m-4 c-6">
                                <h3 class="footer__heading">Theo dõi chúng
                                    tôi</h3>
                                <ul class="footer__list">
                                    <li class="footer__item">
                                        <a href="" class="footer__item-link">
                                            <i class="footer__item-icon fa-brands fa-facebook"></i>
                                            Facebook
                                        </a>
                                    </li>
                                    <li class="footer__item">
                                        <a href="" class="footer__item-link">
                                            <i class="footer__item-icon fa-brands fa-instagram"></i>
                                            Instagram
                                        </a>
                                    </li>
                                    <li class="footer__item">
                                        <a href="" class="footer__item-link">
                                            <i class="footer__item-icon fa-brands fa-linkedin"></i>
                                            Linkedin
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="footer__bottom">
                        <div class="grid wide">
                            <ul class="footer__bottom-list">
                                <li class="footer__bottom-item">
                                    <a href="" class="footer__bottom-link">Chính
                                        sách bảo mật
                                    </a>
                                </li>
                                <li class="footer__bottom-item">
                                    <a href="" class="footer__bottom-link">Cơ chế
                                        hoạt động
                                    </a>
                                </li>
                                <li class="footer__bottom-item">
                                    <a href="" class="footer__bottom-link">Chính
                                        sách vận chuyển
                                    </a>
                                </li>
                                <li class="footer__bottom-item">
                                    <a href class="footer__bottom-link">Chính
                                        sách trả hàng và hoàn tiền
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
                            <p class="footer__text">Mã số doanh nghiệp: 0108838679 do Sở Kế Hoạch &amp; Đầu Tư TP Hà Nội cấp lần đầu ngày 10/02/2015 </p>
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
                            <a href="../Pages/Home.aspx" class="menu-item-link">
                                <i class="fa-solid fa-house home-icon"></i>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="../Pages/Home.aspx#gaming" class="menu-item-link">Laptop
                                Gaming
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="../Pages/Home.apsx#dohoa" class="menu-item-link">LapTop Đồ
                                Hoạ
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="../Pages/Home.aspx#mongnhe" class="menu-item-link">LapTop
                                Mỏng nhẹ
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <script src="../Js/Details.js"></script>
        </div>
    </form>
</body>
</html>
