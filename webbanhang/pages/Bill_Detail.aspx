<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bill_Detail.aspx.cs" Inherits="WebBanHang.Pages.Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Assets/css/header.css">
    <link rel="stylesheet" href="../Assets/css/Search.css">
    <link rel="stylesheet" href="../Assets/css/Bill_Detail.css">
    <link rel="stylesheet" href="../Assets/css/Cart.css">
    <link rel="stylesheet" href="../Assets/css/Footer.css">
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
                            <a href="../Pages/Cart.aspx" class="infor-cart__icon--link">
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
                        <asp:ListView ID="lvHoaDonInfo" runat="server">
                            <ItemTemplate>
                                <div class="row content-item bill_header">
                                    <div class="col l-12 bill_header-id">
                                        <label for="">MÃ ĐƠN HÀNG: </label>
                                        <label for="bill_id"><%# Eval("dNgayLapHD", "{0:ddMMyyyy}") %>MVD0<%# Eval("iMaHD") %></label>
                                    </div>
                                </div>

                                <div class="row content-item bill_infor">
                                    <div class="col l-6 m-12 c-12 bill_adress">
                                        <div id="name">
                                            Tên: 
                               
                                            <label><%# Eval("sHoTen") %></label>
                                        </div>
                                        <div id="phone">
                                            Số điện thoại: 
                               
                                            <label><%# Eval("sDienThoai") %></label>
                                        </div>
                                        <div id="adress">
                                            Địa chỉ: 
                               
                                            <label><%# Eval("sDiaChi") %></label>
                                        </div>
                                    </div>
                                    <div class="col l-6 m-12 c-12 bill_date">
                                        <div class="bill_date-order">
                                            <i class="fa-solid fa-clock"></i>
                                            <label for="">Ngày đặt : </label>
                                            <label><%# Eval("dNgayLapHD", "{0:dd/MM/yyyy}") %></label>
                                        </div>
                                        <div class="bill_date-delivery">
                                            <i class="fa-solid fa-truck"></i>
                                            <label for="">Ngày giao hàng dự kiến : </label>
                                            <label><%# Eval("dNgayGiaoHang", "{0:dd/MM/yyyy}") %></label>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSourceInfo" runat="server"
                            ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>"
                            SelectCommand="SELECT * FROM tblHoaDon where iMaHD = @iMaHD">
                            <SelectParameters>
                            <asp:SessionParameter Name="iMaHD" SessionField="iMaHD" Type="Int32" />
                             </SelectParameters>
                        </asp:SqlDataSource>


                        <asp:ListView ID="lvHoaDonProduct" runat="server">
                            <ItemTemplate>
                                <div class="row content-item bill_products">
                                    <div class="row bill-product__item">
                                        <div class="col l-4 m-3 c-3">
                                            <div class="bill-product__item--img" style="background-image: url('<%# Eval("sPictureSource") %>');"></div>
                                        </div>
                                        <div class="col l-6 m-6 c-6">
                                            <h4 class="bill-product__item--title"><%# Eval("sName") %></h4>
                                        </div>
                                        <div class="col l-2 m-3 c-3">
                                            <label class="bill-product__item--price"><%# Eval("iNewPrice", "{0:N0} VND") %></label>
                                            <label class="bill-product__item--quantity">x<%# Eval("iQuantity") %></label>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server"
                            ConnectionString="<%$ ConnectionStrings:WebBanHangConnectionString %>"
                            SelectCommand="select LapTop.sName, LapTop.sPictureSource, LapTop.iNewPrice, CartItem.iQuantity from tblCTHoaDon inner join CartItem on tblCTHoaDon.CartItemID = CartItem.CartItemID inner join LapTop on CartItem.sIDLapTop= LapTop.sIDLapTop where tblCTHoaDon.iMaHD = @iMaHD">
                            <SelectParameters>
                                <asp:SessionParameter Name="iMaHD" SessionField="iMaHD" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:ListView ID="lvCTHDTongTien" runat="server">
                            <ItemTemplate>
                                <div class="row bill_total-price" style="font-weight:bold; color:red; font-size: 2rem;">
                                    <label>Thành tiền : </label>
                                    <label style="margin-left: 10px;"><%# Eval("iTongTien", "{0:N0} VND") %></label>
                            </ItemTemplate>
                        </asp:ListView>

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
                            <a href="../Pages/Home.aspx" class="menu-item-link">
                                <i class="fa-solid fa-house home-icon"></i>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="../Pages/Home.asps#gaming" class="menu-item-link">Laptop Gaming
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="../pages/Home.asps#dohoa" class="menu-item-link">LapTop Đồ Hoạ
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="../pages/Home.asps#mongnhe" class="menu-item-link">LapTop Mỏng nhẹ
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
