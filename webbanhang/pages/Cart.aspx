<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebBanHang.Pages.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/css/header.css">
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
            <main>
                <div class="content">
                    <div class="table-title">
                        <div class="layer-name">Sản phẩm</div>
                        <div class="layer-price">Giá</div>
                        <div class="layer-quantities">Số lượng</div>
                        <div class="layer-money">Tổng tiền</div>
                    </div>
                    <div class="table-body border-outside">
                        <asp:ListView ID="lvCart" runat="server">
                            <ItemTemplate>
                                <div class="product-item border-outside dis-flex padding">
                                    <div class="layer-name">
                                        <div class="i-layer">
                                            <img src='<%# Eval("sPictureSource") %>' class="c-img" />
                                            <div class="resize"><%# Eval("sName") %></div>
                                        </div>
                                    </div>
                                    <div class="layer-price resize"><%# Eval("iNewPrice", "{0:N0} VND") %></div>
                                    <div class="layer-quantities resize dis-flex quanity">
                                        <asp:LinkButton ID="btnDecrease" runat="server" OnClick="btnDecrease_Click" CommandArgument='<%# Eval("CartItemID") %>' CssClass="quantity-width border-outside padding">-</asp:LinkButton>
                                        <div class="quantity-width"><%# Eval("CartQuantity") %></div>
                                        <asp:LinkButton ID="btnIncrease" runat="server" OnClick="btnIncrease_Click" CommandArgument='<%# Eval("CartItemID") %>' CssClass="quantity-width border-outside padding">+</asp:LinkButton>
                                    </div>
                                    <div class="layer-money resize"><%# Eval("TotalPrice", "{0:N0} VND") %></div>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("CartItemID") %>'
                                        OnClick="btnDelete_Click"
                                        CssClass="btn_delete"
                                        OnClientClick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">
                                        x
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>"
                            SelectCommand="SELECT CartItem.CartItemID,sPictureSource, sName,iNewPrice,CartItem.iQuantity, (LapTop.iNewPrice * CartItem.iQuantity) AS TotalPrice 
                                               FROM Cart,CartItem,LapTop 
                                               where Cart.CartID = CartItem.CartID and CartItem.sIDLaptop = LapTop.sIDLaptop and Cart.CartID = @CartID">
                            <SelectParameters>
                                <asp:SessionParameter Name="CartID" SessionField="CartID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="table-hnf">
                        <div id="noneGood" runat="server">
                            <div class="layer-50"></div>
                            <div class="total">Tổng tiền:</div>
                            <div class="total-price">0 VNĐ</div>
                        </div>
                        <asp:ListView ID="lvHienTongTien" runat="server">
                            <ItemTemplate>
                                <div class="layer-50"></div>
                                <div class="total">Tổng tiền:</div>
                                <div class="total-price">
                                    <%--<asp:Label ID="lblTotalPrice" runat="server"></asp:Label>--%>
                                    <label class="showTongtien" for=""><%# Eval("TongTien", "{0:N0} VND") %></label>
                                </div>
                                <div class="payment" id="openModalBtn">
                                    Thanh toán
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlHienTongTien" runat="server"
                            ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>"
                            SelectCommand="select sum(LapTop.iNewPrice * CartItem.iQuantity) as TongTien 
                                           FROM Cart,CartItem,LapTop
                                           where Cart.CartID = CartItem.CartID and CartItem.sIDLaptop = LapTop.sIDLaptop and Cart.CartID = @CartID">
                            <SelectParameters>
                                <asp:SessionParameter Name="CartID" SessionField="CartID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </main>


            <!-- Modal -->
            <div id="modal_cart" class="modal">
                <div class="modal-content">
                    <div class="container">
                        <span class="close">&times;</span>
                        <h1>Checkout</h1>
                        <%--<div class="product-info">
                            <h2>Thông tin sản phẩm: </h2>
                            <div class="product">
                                <div class="product-style">
                                    <img src="../assets/img/Laptop-Gaming-Asus-TUF-F15-FX506HF-HN014W-500x500.jpg"
                                        alt="Product Image" class="product-style">
                                </div>
                                <div class="product-details">
                                    <p><strong>Tên máy:</strong> Laptop Asus ROG</p>
                                    <p><strong>Giá :</strong> 10000000VND</p>
                                    <p><strong>Số lượng:</strong> 1</p>
                                </div>

                            </div>
                        </div>--%>

                        <div class="payment-info" runat="server">
                            <h2>Thông tin khách hàng: </h2>
                            <div class="payment-form">
                                <asp:TextBox ID="txtName" placeholder="Họ và tên" runat="server" required />
                                <asp:TextBox ID="txtPhone" placeholder="Số điện thoại" runat="server" required />
                                <asp:TextBox ID="txtAddress" placeholder="Địa chỉ" runat="server" />
                                <asp:TextBox ID="txtCard" placeholder="Số thẻ ngân hàng" runat="server" required />

                                <asp:Button Text="Thanh toán" runat="server" OnClick="btn_ThanhToan_Click" ID="btn_buynow" CssClass="payment-form_button" />

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
        <script src="../JS/Cart.js"></script>
    </form>
</body>
</html>
