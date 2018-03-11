using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class shouye : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsure_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();

        string sql1 = string.Format("select * from [user] where 用户名='{0}'", txtnicheng.Text);
        SqlCommand com2 = new SqlCommand(sql1,con);
        SqlDataReader reader2 = com2.ExecuteReader();
        if (reader2.HasRows)
        {
            Response.Write("<script>alert('用户名" + txtnicheng.Text + "已被使用，请更换用户名')</script>");
            reader2.Close();
            con.Close();
        }
        else
        {
            reader2.Close();
            string sql = string.Format("insert into [user] (用户名,级别,密码,联系方式) values ('{0}',{1},'{2}','{3}')", txtnicheng.Text,0, txtpsw.Text, txtphone.Text);
            SqlCommand com = new SqlCommand(sql, con);
            com.ExecuteNonQuery();
            Response.Write("<script>alert('注册成功,确认返回登录界面');window.location.href='denglu.aspx'</script>");
            con.Close();
        }
        con.Close();
        txtnicheng.Text = "";
        txtphone.Text = "";
        txtpsw.Text = "";
        txtpsw2.Text = "";
    }
}