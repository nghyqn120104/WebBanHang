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
    public partial class Register : System.Web.UI.Page
    {
        DataProvider dataProvider = new DataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangKi_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string message = "";
            SqlCommand ktraTaiKhoan = new SqlCommand("select * from tblDangKyTaiKhoan where sEmail = '"+txtEmail.Text+ "' or sTenDangNhap = '"+txtTenDangNhap.Text+"'");
            dt = dataProvider.execQuery(ktraTaiKhoan);
            if(dt.Rows.Count > 0 )
            {
                message = "Tài khoản này đã tồn tại!";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
            }else
            {
                StringBuilder qry = new StringBuilder("exec TaoTaiKhoan");
                qry.Append(" @TenDangNhap= N'" + txtTenDangNhap.Text + "'");
                qry.Append(",@Email= '" + txtEmail.Text + "'");
                qry.Append(",@Phone= '" + txtSDT.Text + "'");
                qry.Append(",@PassWord= '" + txtMatKhau.Text + "'");
                qry.Append(",@Address= N'" + txtDiaChi.Text + "'");
                int kq = dataProvider.execNonQuery(qry.ToString());
              
                if (kq > 0)
                {
                    message = "Đăng ký thành công!";
                    string script = "alert('" + message + "'); window.location='Login.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
                else
                {
                    message = "Fail!";
                    string script = "alert('" + message + "'); window.location='Register.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
            }
        }
    }
}