using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;

namespace WebBanHang.Pages
{
    public partial class Cart : System.Web.UI.Page
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


                lvCart.DataSource = SqlDataSource1;
                //lvCart.DataBind();
                HienTongTien();
                HienDSCarts();
                LoadCustomerInfo();
            }
        }

        private void HienDSCarts()
        {
            int cartID = Convert.ToInt32(Session["CartID"]);

            DataTable dt = new DataTable();
            string query = @"
        SELECT 
            CartItem.CartItemID,
            CartItem.CartID,
            CartItem.sIDLapTop,
            CartItem.iQuantity AS CartQuantity,
            LapTop.sName,
            LapTop.sPictureSource,
            LapTop.sWarranty,
            LapTop.iOldPrice,
            LapTop.iNewPrice,
            LapTop.sBoostRam,
            LapTop.sCpu,
            LapTop.sRam,
            LapTop.sBattery,
            LapTop.sGraphicCard,
            LapTop.sWeight,
            LapTop.sStorage,
            LapTop.sDescribe,
            (LapTop.iNewPrice * CartItem.iQuantity) AS TotalPrice
        FROM 
            CartItem
        INNER JOIN 
            LapTop ON CartItem.sIDLapTop = LapTop.sIDLapTop
        WHERE 
            CartItem.CartID = @CartID;";

            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Parameters.AddWithValue("@CartID", cartID);
                dt = dataProvider.execQuery(cmd);
            }

            lvCart.DataSource = dt;
            lvCart.DataBind();

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

        protected void HienTongTien()
        {
            int cartID = Convert.ToInt32(Session["CartID"]);
            StringBuilder qry = new StringBuilder("select sum(LapTop.iNewPrice * CartItem.iQuantity) as TongTien");
            qry.Append(" FROM Cart,CartItem,LapTop");
            qry.Append(" where Cart.CartID = CartItem.CartID and CartItem.sIDLaptop = LapTop.sIDLaptop and Cart.CartID = '" + cartID + "'");
            object tongTienThanhToan = dataProvider.HamTinhToan(qry.ToString());
            if (tongTienThanhToan == DBNull.Value)
            {
                lvHienTongTien.Visible = false;
                noneGood.Visible = true;
            }
            else
            {
                noneGood.Visible = false;
                lvHienTongTien.Visible = true;
                tongTienThanhToan = Convert.ToInt32(dataProvider.HamTinhToan(qry.ToString()));
                Session["tongtien"] = tongTienThanhToan;
                lvHienTongTien.DataSource = SqlHienTongTien;
                lvHienTongTien.DataBind();
            }
            //else
            //{
            //    tongTienThanhToan = Convert.ToInt32(dataProvider.HamTinhToan(qry.ToString()));
            //    lblTotalPrice.Text = tongTienThanhToan.ToString();
            //    Session["tongtien"] = tongTienThanhToan;
            //}
        }

        protected void btnDecrease_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int cartItemID = Convert.ToInt32(lb.CommandArgument);
            string qry;
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@CartItemID", cartItemID)
            };
            int currentQuantity = Convert.ToInt32(dataProvider.execScaler("SELECT iQuantity FROM CartItem WHERE CartItemID = @CartItemID", parameters));

            if (currentQuantity <= 1)
            {
                qry = "DELETE FROM CartItem WHERE CartItemID = '" + cartItemID + "'";
                SqlParameter[] parametersforDelete = new SqlParameter[]
                {
                    new SqlParameter("@CartItemID", cartItemID)
                };
                dataProvider.ThemSuaXoaNhieu(qry, parametersforDelete);
                Response.Redirect("Cart.aspx");
            }
            else
            {
                qry = "UPDATE CartItem SET iQuantity = iQuantity - 1 WHERE CartItemID = @CartItemID";
                SqlParameter[] parametersforUpdate = new SqlParameter[]
                {
                    new SqlParameter("@CartItemID", cartItemID)
                };
                dataProvider.ThemSuaXoaNhieu(qry, parametersforUpdate);
                Response.Redirect("Cart.aspx");
            }
        }

        protected void btnIncrease_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int cartItemID = Convert.ToInt32(lb.CommandArgument);
            string qry = "UPDATE CartItem SET iQuantity = iQuantity + 1 WHERE CartItemID = @CartItemID";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@CartItemID", cartItemID)
            };
            dataProvider.ThemSuaXoaNhieu(qry, parameters);
            Response.Redirect("Cart.aspx");
        }

        //Xóa mã sản phẩm khỏi giỏ hàng
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int cartItemID = Convert.ToInt32(lb.CommandArgument);
            string qry = "DELETE FROM CartItem WHERE CartItemID = @CartItemID";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@CartItemID", cartItemID)
            };
            dataProvider.ThemSuaXoaNhieu(qry, parameters);
            Response.Redirect("Cart.aspx");
        }

        protected void btn_ThanhToan_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            if (username != null)
            {
                int cartID = Convert.ToInt32(Session["CartID"]);
                string phone = txtPhone.Text;
                string address = txtAddress.Text;
                string name = txtName.Text;
                string card = txtCard.Text;
                string totalPrice = Session["tongtien"].ToString();

                using (SqlConnection cnn = new SqlConnection(dataProvider.StrCon))
                {
                    cnn.Open();
                    SqlTransaction transaction = cnn.BeginTransaction();
                    try
                    {

                        string insertquery = @"INSERT INTO tblHoaDon (CartID, sHoTen, sDiaChi, sDienThoai, sTheNganHang,sTenDangNhap,iTongTien) 
                                 VALUES (@CartID, @sHoTen, @sDiaChi, @sDienThoai, @sTheNganHang,@sTenDangNhap,@iTongTien);
                                 SELECT SCOPE_IDENTITY();";
                        SqlParameter[] parameter = new SqlParameter[]{
                            new SqlParameter("@CartID",cartID),
                            new SqlParameter("@sHoTen", name),
                            new SqlParameter("@sDiaChi", address),
                            new SqlParameter("@sDienThoai", phone),
                            new SqlParameter("@sTheNganHang", card),
                            new SqlParameter("@sTenDangNhap", username),
                            new SqlParameter("@iTongTien", totalPrice)
                        };

                        // Truy vấn dòng dữ liệu mã hóa đơn.
                        object result = dataProvider.execScaler(insertquery, parameter);
                        int maHD = Convert.ToInt32(result);

                        // Lấy sản phẩm có trong giỏ hàng để thêm vào bảng chi tiết hóa đơn
                        string selectCartItemQuery = @"SELECT CartItemID from CartItem where CartID = @cartID";
                        SqlParameter[] cartItemParameter = new SqlParameter[]
                        {
                            new SqlParameter("@CartID", cartID)
                        };

                        DataTable cartItems = dataProvider.HamTimKiem(selectCartItemQuery, cartItemParameter);
                        string insertCTHDQuery = @"INSERT INTO tblCTHoaDon(iMaHD, CartItemID) VALUES (@iMaHD,@CartItemID)";
                        foreach (DataRow row in cartItems.Rows)
                        {
                            int cartItemID = Convert.ToInt32(row["CartItemID"]);
                            SqlParameter[] CTHDParameter = new SqlParameter[]
                            {
                                new SqlParameter("@iMaHD", maHD),
                                new SqlParameter("@CartItemID", cartItemID)
                            };
                            dataProvider.ThemSuaXoaNhieu(insertCTHDQuery, CTHDParameter);
                        }

                        transaction.Commit();
                        ShowMessageBox("Đặt hàng thành công");                 
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        ShowMessageBox("Đặt hàng thất bại " + ex.Message);
                    }
                    finally
                    {
                        cnn.Close();
                    }
                }
            }
        }

        private void ShowMessageBox(string message)
        {
            string script = $"alert('{message}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
        }

        private void LoadCustomerInfo()
        {
            string query = "SELECT sTenDangNhap, sPhone, sAddress FROM tblDangKyTaiKhoan WHERE sTenDangNhap = @UserName";
            string username = Session["username"].ToString();
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@UserName", username); // Thay bằng giá trị thực

            DataTable dt = dataProvider.execQuery(cmd);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                txtName.Text = row["sTenDangNhap"].ToString();
                txtPhone.Text = row["sPhone"].ToString();
                txtAddress.Text = row["sAddress"].ToString();
            }
        }
    }
}