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
    public partial class Login : System.Web.UI.Page
    {
        DataProvider dataProvider = new DataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string message = "";
            SqlCommand ktraDangNhap = new SqlCommand("select * from tblDangKyTaiKhoan where sTenDangNhap='"+txtTenDangNhap.Text+ "' and sPassword= '"+txtPassword.Text+"'");
            dt = dataProvider.execQuery(ktraDangNhap);
            if (dt.Rows.Count > 0 )
            {
                Session["username"] = txtTenDangNhap.Text;
                Session["address"] = dt.Rows[0]["sAddress"];
                Response.Redirect("Home.aspx");
            }
            else
            {
                message = "Đăng nhập không thành công!";
                string script = "alert('" + message + "'); window.location='Login.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }
    }
}