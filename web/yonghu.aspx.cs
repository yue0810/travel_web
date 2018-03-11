using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class yonghu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Cookies["name"] == null)
        {
            Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
        }
    }
    protected void btnselect_Click(object sender, EventArgs e)
    {
        if (selname.Text != "")
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = SqlDataSource1.ConnectionString;
            con.Open();
            string sql = string.Format("select * from [user] where 用户名='{0}'", selname.Text);
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    txtnicheng.Text = reader[0].ToString();
                    string str = reader[1].ToString();
                    if (str == "1")
                    {
                        quanxian.Items[1].Selected = true;
                    }
                    else
                        quanxian.Items[0].Selected = true;
                    txtpsw.Text = reader[2].ToString();
                    txtpsw2.Text = reader[2].ToString();
                    txtphone.Text = reader[3].ToString();
                }
            }
            else
                Response.Write("<script>alert('没有名为" + selname.Text + "的用户记录')</script>");
            reader.Close();
            con.Close();
        }
        else
            Response.Write("<script>alert('请输入用户名')</script>");


    }
    static int jibie = 0;
    protected void btnadd_Click(object sender, EventArgs e)
    {
        if (quanxian.SelectedItem == null)
        {
            Response.Write("<script>alert('请完善信息')</script>");
        }
        else
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = SqlDataSource1.ConnectionString;
            con.Open();
            string sql2 = string.Format("select * from [user] where 用户名='{0}'", txtnicheng.Text);
            SqlCommand com2 = new SqlCommand(sql2, con);
            SqlDataReader reader = com2.ExecuteReader();
            if (!reader.HasRows)
            {
                reader.Close();
                if (quanxian.SelectedItem.Text == "管理员")
                {
                    jibie = 1;
                }
                else
                    jibie = 0;
                string sql = string.Format("insert into [user] values('{0}',{1},'{2}','{3}')", txtnicheng.Text, jibie, txtpsw.Text, txtphone.Text);
                SqlCommand com = new SqlCommand(sql, con);
                com.ExecuteNonQuery();
                Response.Write("<script>alert('添加成功')</script>");
            }
            else
                Response.Write("<script>alert('已存在名为" + txtnicheng.Text + "的用户记录')</script>");
            reader.Close();
            con.Close();
            selname.Text = "";
            txtnicheng.Text = "";
            txtphone.Text = "";
            txtpsw.Text = "";
            txtpsw2.Text = "";
        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();

        string sql = string.Format("delete from [user] where 用户名='{0}'", txtnicheng.Text);
        SqlCommand com = new SqlCommand(sql, con);
        com.ExecuteNonQuery();
        Response.Write("<script>alert('删除成功')</script>");

        con.Close();
        selname.Text = "";
        txtnicheng.Text = "";
        txtphone.Text = "";
        txtpsw.Text = "";
        txtpsw2.Text = "";
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (quanxian.SelectedItem == null)
        {
            Response.Write("<script>alert('请完善信息')</script>");
        }
        else
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = SqlDataSource1.ConnectionString;
            con.Open();

            string sql2 = string.Format("select * from [user] where 用户名='{0}'", txtnicheng.Text);
            SqlCommand com2 = new SqlCommand(sql2, con);
            SqlDataReader reader = com2.ExecuteReader();
            if (quanxian.SelectedItem.Text == "管理员")
            {
                jibie = 1;
            }
            else
                jibie = 0;
            reader.Close();
            string sql = string.Format("update [user] set 用户名='{0}',级别={1},密码='{2}',联系方式='{3}' where 用户名='{4}'", txtnicheng.Text, jibie, txtpsw.Text, txtphone.Text, txtnicheng.Text);
            SqlCommand com = new SqlCommand(sql, con);
            com.ExecuteNonQuery();
            Response.Write("<script>alert('修改成功')</script>");
            con.Close();
            selname.Text = "";
            txtnicheng.Text = "";
            txtphone.Text = "";
            txtpsw.Text = "";
            txtpsw2.Text = "";
        }
    }
}