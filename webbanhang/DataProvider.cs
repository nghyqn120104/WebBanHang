using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebBanHang
{
    public class DataProvider
    {
        public string StrCon = @"Data Source=DESKTOP-HT298IF\SQLEXPRESS;Initial Catalog=WebBanHang;Integrated Security=True";

        // Hàm này dùng cho lệnh select dùng để hiện dữ liệu
        public DataTable execQuery(SqlCommand cmd) //qry: câu lệnh truy vấn select
        {
            using (SqlConnection conn = new SqlConnection(StrCon))
            {
                cmd.Connection = conn;
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
        }

        // Hàm này dùng cho lệnh insert,delete,update để thêm,xoá,sửa
        public int execNonQuery(string qry)
        {
            int data = 0;
            using (SqlConnection sqlCon = new SqlConnection(StrCon))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand(qry, sqlCon);
                data = sqlCmd.ExecuteNonQuery();
            }
            return data;
        }

        // Dùng để truy vấn 1 dòng dữ liệu
        // Dùng để tính tổng các cột, hoá đơn,...
        public object execScaler(string qry, SqlParameter[] parameters)
        {
            object data = 0;
            using (SqlConnection sqlCon = new SqlConnection(StrCon))
            {
                try
                {
                    sqlCon.Open();
                    using (SqlCommand sqlCmd = new SqlCommand(qry, sqlCon))
                    {
                        if (parameters != null)
                        {
                            sqlCmd.Parameters.AddRange(parameters);
                        }
                        data = sqlCmd.ExecuteScalar();
                    }
                }
                catch (SqlException ex)
                {
                    // Xử lý các lỗi của SQL tại đây
                    Console.WriteLine("Đã xảy ra lỗi SQL: " + ex.Message);
                    throw; // Hoặc xử lý lỗi theo cách thích hợp với ứng dụng của bạn
                }
            }
            return data;
        }


        public object HamTinhToan(string qry)
        {
            object data = 0;
            using (SqlConnection sqlCon = new SqlConnection(StrCon))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand(qry, sqlCon);
                data = sqlCmd.ExecuteScalar();
            }
            return data;
        }

        public int ThemSuaXoaNhieu(string qry, SqlParameter[] parameters)
        {
            int data = 0;
            using (SqlConnection sqlCon = new SqlConnection(StrCon))
            {
                try
                {
                    sqlCon.Open();
                    using (SqlCommand sqlCmd = new SqlCommand(qry, sqlCon))
                    {
                        if (parameters != null)
                        {
                            sqlCmd.Parameters.AddRange(parameters);
                        }
                        data = sqlCmd.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    
                    Console.WriteLine("Đã xảy ra lỗi SQL: " + ex.Message);
                    throw; // Hoặc xử lý lỗi theo cách thích hợp với ứng dụng của bạn
                }
            }
            return data;
        }

        public DataTable HamTimKiem(string query, SqlParameter[] parameters = null)
        {
            DataTable data = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(StrCon))
            {
                using (SqlCommand sqlCmd = new SqlCommand(query, sqlCon))
                {
                    if (parameters != null)
                    {
                        sqlCmd.Parameters.AddRange(parameters);
                    }
                    using (SqlDataAdapter adapter = new SqlDataAdapter(sqlCmd))
                    {
                        adapter.Fill(data);
                    }
                }
            }
            return data;
        }

    }
}