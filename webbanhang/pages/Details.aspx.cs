using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace WebBanHang.Pages
{
    public partial class Details : System.Web.UI.Page
    {
        DataProvider dataProvider = new DataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    string username = Session["username"].ToString();
                    customerAccount.InnerHtml = $@"
                <li class='customer-account--item'>
                    <p class='customer-item--link'>Welcome, {username}</p>
                </li>
                <li class='customer-account--item'>
                    <a href='Logout.aspx' class='customer-item--link'>Logout</a>
                </li>
                <li class='customer-account--item'>
                    <a href = 'Bill.aspx' class='customer-item--link'>Đơn hàng</a>
                </li>";
                
                }
                string sIDLapTop = Request.QueryString["sIDLapTop"];
                if (!string.IsNullOrEmpty(sIDLapTop))
                {
                    HienThiChiTietSanPham(sIDLapTop);
                }
                if(Session["address"] != null)
                {
                    txtAddress.Text = Session["address"].ToString();
                }
            }
        }

        private void HienThiChiTietSanPham(string sIDLapTop)
        {
            DataTable dt = new DataTable();
            string query = @"SELECT [sIDLapTop], [sName], [sPictureSource], [sWarranty], [iOldPrice], [iNewPrice], [sBoostRam], [sCpu], [sRam], [sBattery], [sGraphicCard], [sWeight], [sStorage],[sDescribe]  FROM [LapTop] where [sIDLapTop] = @sIDLapTop";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@sIDLapTop", sIDLapTop);
            dt = dataProvider.execQuery(cmd);
            lvProduct.DataSource = dt;
            lvProduct.DataBind();

            lvProduct1.DataSource = dt;
            lvProduct1.DataBind();
        }
        protected void lbAddToCart2_Click(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                // Hiển thị thông báo cảnh báo nếu người dùng chưa đăng nhập
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng.');", true);
                //return;
                Response.Redirect("Home.aspx");
            }

            LinkButton lb = (LinkButton)sender;
            int idLaptop = Convert.ToInt32(lb.CommandArgument);

            // Lấy CartID từ session
            int cartId = Convert.ToInt32(Session["CartID"]);

            // Kiểm tra xem CartID đã tồn tại trong bảng Cart chưa
            string checkCartQuery = "SELECT COUNT(*) FROM Cart WHERE CartID = @CartID";
            SqlParameter[] checkCartParameters = new SqlParameter[]
            {
                new SqlParameter("@CartID", cartId)
            };
            int cartCount = (int)dataProvider.execScaler(checkCartQuery, checkCartParameters);

            if (cartCount == 0)
            {
                // Nếu CartID chưa tồn tại, tạo một giỏ hàng mới
                string createCartQuery = "INSERT INTO Cart (sTenDangNhap) OUTPUT INSERTED.CartID VALUES (@sTenDangNhap)";
                SqlParameter[] createCartParameters = new SqlParameter[]
                {
                    new SqlParameter("@sTenDangNhap", Session["Username"].ToString())
                };
                cartId = (int)dataProvider.execScaler(createCartQuery, createCartParameters);

                // Lưu CartID mới vào session
                Session["CartID"] = cartId;
            }

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            string checkCartItemQuery = "SELECT COUNT(*) FROM CartItem WHERE CartID = @CartID AND sIDLapTop = @IDLapTop";
            SqlParameter[] checkCartItemParameters = new SqlParameter[]
            {
                new SqlParameter("@CartID", cartId),
                new SqlParameter("@IDLapTop", idLaptop)
            };
            int itemCount = (int)dataProvider.execScaler(checkCartItemQuery, checkCartItemParameters);

            if (itemCount > 0)
            {
                // Nếu sản phẩm đã có trong giỏ hàng, tăng số lượng
                string updateCartItemQuery = "UPDATE CartItem SET iQuantity = iQuantity + 1 WHERE CartID = @CartID AND sIDLapTop = @IDLapTop";
                SqlParameter[] updateCartItemParameters = new SqlParameter[]
                {
                    new SqlParameter("@CartID", cartId),
                    new SqlParameter("@IDLapTop", idLaptop)
                };
                dataProvider.ThemSuaXoaNhieu(updateCartItemQuery, updateCartItemParameters);
            }
            else
            {
                // Nếu sản phẩm chưa có trong giỏ hàng, thêm sản phẩm mới với số lượng là 1
                string addCartItemQuery = "INSERT INTO CartItem (CartID, sIDLapTop, iQuantity) VALUES (@CartID, @IDLapTop, @iQuantity)";
                SqlParameter[] addCartItemParameters = new SqlParameter[]
                {
                    new SqlParameter("@CartID", cartId),
                    new SqlParameter("@IDLapTop", idLaptop),
                    new SqlParameter("@iQuantity", 1)
                };
                dataProvider.ThemSuaXoaNhieu(addCartItemQuery, addCartItemParameters);
            }

            // Chuyển hướng đến trang Cart.aspx
            Response.Redirect("Cart.aspx");
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