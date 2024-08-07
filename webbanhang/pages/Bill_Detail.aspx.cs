using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace WebBanHang.Pages
{
    public partial class Bill : System.Web.UI.Page
    {
        DataProvider dataProvider = new DataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    string username = Session["username"].ToString();
                    // Hiển thị thông tin người dùng
                    customerAccount.InnerHtml = $@"
                <li class='customer-account--item'>
                    <p class='customer-item--link'>Welcome, {username}</p>
                </li>
                <li class='customer-account--item'>
                    <a href='Logout.aspx' class='customer-item--link'>Đăng xuất</a>
                </li>
                <li class='customer-account--item'>
                    <a href='Bills.aspx' class='customer-item--link'>Đơn hàng</a>
                </li>";

                }
                else
                {
                    // Hiển thị các liên kết đăng nhập và đăng ký
                    customerAccount.InnerHtml = @"
                <li class='customer-account--item'>
                    <a href='Login.aspx' class='customer-item--link'>Đăng nhập</a>
                </li>
                <li class='customer-account--item'>
                    <a href='Register.aspx' class='customer-item--link'>Đăng ký</a>
                </li>";
                }
                lvHoaDonInfo.DataSource = SqlDataSourceInfo;
                lvHoaDonProduct.DataSource = SqlDataSourceProduct;
                lvCTHDTongTien.DataSource = SqlDataSourceInfo;
                hienCTHDInfo();
                hienCTHDProduct();
            
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSearch.Text))
            {
                errMessage.Visible = true;
            }
            else
            {
                errMessage.Visible = false;
                Session["tenMayTinh"] = txtSearch.Text;
                Response.Redirect("Search.aspx");
            }
        }


        // Hiển thị thông tin khách hàng và tổng tiền
        protected void hienCTHDInfo()
        {
            int maHD = Convert.ToInt32(Session["iMaHD"]);
            string queryInfo = "SELECT * FROM tblHoaDon where iMaHD = @iMaHD";
            
            using (SqlCommand cmd = new SqlCommand(queryInfo))
            {
                cmd.Parameters.AddWithValue("@iMaHD", maHD);
                DataTable dtInfo = dataProvider.execQuery(cmd);
                lvHoaDonInfo.DataSource = dtInfo;
                lvHoaDonInfo.DataBind();
                lvCTHDTongTien.DataSource = dtInfo;
                lvCTHDTongTien.DataBind();
            }
        }


        //Hiển thị danh sách sản phẩm
        protected void hienCTHDProduct()
        {
            string queryProduct = "select LapTop.sName, LapTop.sPictureSource, LapTop.iNewPrice, CartItem.iQuantity from tblCTHoaDon inner join CartItem on tblCTHoaDon.CartItemID = CartItem.CartItemID inner join LapTop on CartItem.sIDLapTop= LapTop.sIDLapTop where tblCTHoaDon.iMaHD = @iMaHD";
            int maHD = Convert.ToInt32(Session["iMaHD"]);
            using (SqlCommand cmdProduct = new SqlCommand(queryProduct))
            {
                cmdProduct.Parameters.AddWithValue("iMaHD", maHD);
                DataTable dtProduct = dataProvider.execQuery(cmdProduct);
                lvHoaDonProduct.DataSource = dtProduct;
                lvHoaDonProduct.DataBind();

            }
        }
    }
}