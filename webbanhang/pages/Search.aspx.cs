using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanHang.Pages
{
    public partial class Search : System.Web.UI.Page
    {
        DataProvider dataProvider = new DataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            HienLapCanTim();
        }

        private void HienLapCanTim()
        {
            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();
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
                customerAccount.InnerHtml = @"
            <li class='customer-account--item'>
                <a href='Login.aspx' class='customer-item--link'>Đăng nhập</a>
            </li>
            <li class='customer-account--item'>
                <a href='Register.aspx' class='customer-item--link'>Đăng ký</a>
            </li>";
            }
            DataTable dt = new DataTable();
            string tenMayTinh = Session["tenMayTinh"].ToString();
            string query = @"exec TimKiemTheoTen @TenMayTinh= '"+tenMayTinh+"'";
            SqlCommand cmd = new SqlCommand(query);
            dt = dataProvider.execQuery(cmd);
            if (dt.Rows.Count > 0)
            {
                Container.Visible = true;
                NotFound.Visible = false;
                lvLapTimKiem.DataSource = dt;
                lvLapTimKiem.DataBind();
            }
            else
            {
                Container.Visible = false;
                NotFound.Visible = true;
            }
        }


        // Nút search của trang Search
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string tenMayTinh = txtSearch.Text;
            string query = @"exec TimKiemTheoTen @TenMayTinh= '" + tenMayTinh + "'";
            SqlCommand cmd = new SqlCommand(query);
            dt = dataProvider.execQuery(cmd);
            if (dt.Rows.Count > 0)
            {
                Container.Visible = true;
                NotFound.Visible = false;
                lvLapTimKiem.DataSource = dt;
                lvLapTimKiem.DataBind();
            }
            else
            {
                Container.Visible = false;
                NotFound.Visible = true;
            }
        }

        protected void lbAddToCart_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int idLaptop = Convert.ToInt32(lb.CommandArgument);

            // Lấy CartID từ session
            int cartId = Convert.ToInt32(Session["CartID"]);

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            string checkCartItemQuery = "SELECT COUNT(*) FROM CartItem WHERE CartID = @CartID AND sIDLapTop = @IDLapTop";
            SqlParameter[] checkParameters = new SqlParameter[]
            {
                new SqlParameter("@CartID", cartId),
                new SqlParameter("@IDLapTop", idLaptop)
            };
            int count = (int)dataProvider.execScaler(checkCartItemQuery, checkParameters);

            if (count > 0)
            {
                // Nếu sản phẩm đã có trong giỏ hàng, tăng số lượng
                string updateCartItemQuery = "UPDATE CartItem SET iQuantity = iQuantity + 1 WHERE CartID = @CartID AND sIDLapTop = @IDLapTop";
                SqlParameter[] updateParameters = new SqlParameter[]
                {
                    new SqlParameter("@CartID", cartId),
                    new SqlParameter("@IDLapTop", idLaptop)
                };
                dataProvider.ThemSuaXoaNhieu(updateCartItemQuery, updateParameters);
            }
            else
            {
                // Nếu sản phẩm chưa có trong giỏ hàng, thêm sản phẩm mới với số lượng là 1
                string addCartItemQuery = "INSERT INTO CartItem (CartID, sIDLapTop, iQuantity) VALUES (@CartID, @IDLapTop, @iQuantity)";
                SqlParameter[] addParameters = new SqlParameter[]
                {
                    new SqlParameter("@CartID", cartId),
                    new SqlParameter("@IDLapTop", idLaptop),
                    new SqlParameter("@iQuantity", 1)
                };
                dataProvider.ThemSuaXoaNhieu(addCartItemQuery, addParameters);
            }

            // Chuyển hướng đến trang Cart.aspx
            Response.Redirect("Cart.aspx");
        }
    }
}