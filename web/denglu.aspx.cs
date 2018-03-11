using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class shouye : System.Web.UI.Page
{
    static int num = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = string.Format("select * from [user] where 用户名='{0}' and 密码='{1}'", txtname.Text, txtpsw.Text);
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        string str = "";
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                str = reader[1].ToString();
            }
            if (int.Parse(str) == 1)
            {
                HttpCookie cok = new HttpCookie("name");
                cok.Value = txtname.Text;
                cok.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(cok);
                string str1 = "name=" + txtname.Text + "&psw=" + txtpsw.Text;
                Response.Redirect("yonghu.aspx?" + str1);
            }
            else
            {
                HttpCookie cok1 = new HttpCookie("putong");
                cok1.Value = txtpsw.Text;
                cok1.Expires = DateTime.Now.AddMinutes(20);
                Response.Cookies.Add(cok1);
                string str2 = "name=" + txtname.Text + "&psw=" + txtpsw.Text;
                Response.Redirect("mine.aspx?" + str2);
            }
        }
        else
        {
            num++;
            if (num > 3)
            {
                Response.Write("<script>alert('错误次数过多,确认返回首页');window.location.href='shouye.aspx'</script>");
            }
            else
                Response.Write("<script>alert('用户名或密码错误')</script>");
        }
        reader.Close();
        con.Close();
    }
}