using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace WebBanHang.Pages
{
    public partial class Bill_Detail : System.Web.UI.Page
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
                    <a href='#' class='customer-item--link'>Đơn hàng</a>
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

                lvHoaDon.DataSource = SqlDataSourceHoaDon;
                hienHoaDon();
            }
        }

        //Hiển thị danh sách hóa đơn
        protected void hienHoaDon()
        {
            string username = Session["username"].ToString();
            string query = "SELECT * from tblHoaDon where sTenDangNhap = @sTenDangNhap";

            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Parameters.AddWithValue("@sTenDangNhap", username);
                DataTable dt = dataProvider.execQuery(cmd);
                if (dt.Rows.Count > 0)
                {
                    container.Visible = true;
                    notFound.Visible = false;
                    lvHoaDon.DataSource = dt;
                    lvHoaDon.DataBind();
                }
                else
                {
                    container.Visible = false;
                    notFound.Visible = true;
                }
            }
        }

        // Click vào từng hóa đơn
        protected void itemBill_click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                // Hiển thị thông báo cảnh báo nếu người dùng chưa đăng nhập
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng.');", true);
                //return;
                Response.Redirect("Home.aspx");
            }
            LinkButton lb = (LinkButton)sender;
            int iMaHD = Convert.ToInt32(lb.CommandArgument);
            Session["iMaHD"] = iMaHD;
            Response.Redirect("Bill_Detail.aspx");
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
    }
}