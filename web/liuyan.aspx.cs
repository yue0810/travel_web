using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class liuyan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["name"] == null)
        {
            Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
        }
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = "select * from liuyan";
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        if (reader.HasRows)
        {
            xianshi.Text = "您有未处理的留言信息,请查看";
        }
        else
            xianshi.Text = "没有留言信息哦~~~";
        reader.Close();
        con.Close();
        if (!IsPostBack)
        {
            if (xianshi.Text == "没有留言信息哦~~~")
                chakan.Visible = false;
            else
                chakan.Visible = true;
            xian.Visible = false;
        }
        
    }
    protected void chakan_Click(object sender, EventArgs e)
    {
        yonghu.Items.Clear();
        yonghu.Items.Insert(0, "请选择");
        ArrayList a = new ArrayList();
        xian.Visible = true;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = "select 用户名 from liuyan";
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            a.Add(reader[0].ToString());
        }
        foreach (var x in a)
        {
            yonghu.Items.Add(x.ToString());
        }
        reader.Close();
        con.Close();
    }

    protected void yonghu_SelectedIndexChanged(object sender, EventArgs e)
    {
    //    yonghu.Items.Clear();
    //    yonghu.Items.Insert(0, "请选择");
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = string .Format ("select * from liuyan where 用户名='{0}'",yonghu.SelectedValue.ToString ());
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            txtxian.Text = reader[1].ToString();
        }
        reader.Close();
        con.Close();
    }
    protected void chuli_Click(object sender, EventArgs e)
    {
        ArrayList a = new ArrayList();
        yonghu.Items.Clear();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();

        string sql2 = string.Format("delete from liuyan where 留言='{0}'", txtxian.Text );
        SqlCommand com2 = new SqlCommand(sql2, con);
        com2.ExecuteNonQuery();
        con.Close();
        SqlConnection con2 = new SqlConnection();
        con2.ConnectionString = SqlDataSource1.ConnectionString;
        con2.Open();
        txtxian.Text = "";
        string sql = "select * from liuyan";
        SqlCommand com = new SqlCommand(sql, con2);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            a.Add(reader[0].ToString());
        }
        yonghu.Items.Insert(0, "请选择");
        foreach (var x in a)
        {
            yonghu.Items.Add(x.ToString());
        }
        reader.Close();
        con2.Close();

        Response.Write("<script>alert('已成功处理')</script>");
        if (yonghu.Items.Count == 1)
        {
            xian.Visible = false;
            xianshi.Text = "没有留言信息哦~~~";
            chakan.Visible = false;
        }
    }
    protected void yonghu_DataBound(object sender, EventArgs e)
    {
        yonghu.Items.Insert(0, "请选择");
    }
}